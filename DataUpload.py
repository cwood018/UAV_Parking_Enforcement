import boto3
import sys
import pyodbc
import settings
import scripts
import os
import time as clock
import datetime
import csv
import Main
import smtplib, ssl
import tkinter
from tkinter import messagebox

INFORMATION = {
    'bucket' : 'car-videos',
    'upload_file': sys.argv[1],
    's3_location':'testfile',
    'evidence_bucket': 'ticketing-evidence',
    'license_plates': '/Users/christopherwood/PycharmProjects/ProjectFinal/lp_results.csv',
    'unidentified_vehicles':'unidentified-vehicles'

}

class DataUpload(object):


    def main(self):
        if INFORMATION['upload_file'].endswith('.mp4'):
            root = tkinter.Tk()
            root.withdraw()
            s3_path, time_path = self.create_file_path() # function to create the path used for S3
            s3 = self.connect_to_aws()
            messagebox.showinfo("S3 Upload","Beginning S3 Video Upload")
            file_path = self.file_upload(s3, s3_path, time_path) # function to upload the video to S3
            messagebox.showinfo("Image Processing","Beginning License Extraction")
            Main.main()
            messagebox.showinfo("Image Processing","License Extraction Complete")
            uCount = 0
            ticketCount = 0
            file = open(INFORMATION['license_plates']) # Opening of CSV file for plates and file paths of frames
            csv_file = csv.reader(file)
            next(csv_file)
            for row in csv_file:
                frame_path = row[0]
                license_plate = row[1]
                ap_id, pass_validation, conn, uCount = self.databaseCheck(license_plate, frame_path, s3, file_path, uCount) # Function to check if table has license plate present
                if pass_validation == 1: # Checks to see if plate is approved for parking
                    print("PASS VALIDATED")
                    continue
                elif pass_validation == -1: # Plate does not match car in database
                    print("UNIDENTIFIED VEHICLE DETECTED.")
                    uCount += 1
                    continue
                else: # Parking not valid
                    print("PASS NOT VALIDATED")
                    anum, fname, lname, email = self.getStudentInfo(ap_id, conn) # Function to gather student information for ticket
                ticket_time = self.ticketCreation(file_path, s3, frame_path, license_plate, conn) # Function to create ticket
                if ticket_time is None:
                    ticketCount -= 1
                    continue
                else:
                    print("TICKET CREATED")
                    ticketCount += 1
                    self.mailto(email, ticket_time, ap_id, license_plate, conn) # Function to email ticket
            messagebox.showinfo("Script Complete","Script detected {} Newly Unidentified Vehicles and {} Tickets were sent for "
                                                  "Parking Violations from Video {}".format(uCount, ticketCount, file_path))
        else:
            root = tkinter.Tk()
            root.withdraw()
            messagebox.showinfo("Video File","Video is not in MP4 Format.")
            exit(12)
    def connect_to_aws(self):
        s3 = boto3.client('s3', aws_access_key_id=settings.aws_access_key_id,
                          aws_secret_access_key=settings.aws_secret_access_key)
        return s3

    def create_file_path(self):
        full_date = clock.ctime(os.path.getctime(INFORMATION['upload_file'])) # Gets the time of creation from the file
        splitter = full_date.split(' ') # Splits the time timestamp to be placed in other variables
        month = splitter[1]
        day = splitter[2]
        year = splitter[4]
        time = splitter[3]
        s3_path = os.path.join(month + '_' + day + '_' + year) # Creates date directory naming convention
        time_path = os.path.join(time) # Creates the time subdirectory

        return s3_path, time_path



    def file_upload(self,s3, s3_path, time_path):
        create_path = os.path.join(s3_path + '/' + time_path)
        s3.upload_file(INFORMATION['upload_file'], INFORMATION['bucket'], create_path) # Uploads the file to S3 with proper naming convention
        print("Successful Upload")
        # response = s3.download_file(INFORMATION['bucket'], create_path, INFORMATION['destination_file']) # Downloads the file from S3 to whichever path you set it to
        # print("Successful Download")
        return create_path

    def databaseCheck(self, license_plate, frame_path, s3, file_path, uCount):
        ap_id = 0
        pass_validation = " "
        conn = pyodbc.connect(
            'Driver={SQL Server};'
            'Server=AWS_ADDRESS;'
            'Database=capstone_final;'
            'UID=username;'
            'PWD=password'

        ) # Establishing Connection with Microsoft SQL Express
        print("CONNECTION SUCCESSFUL")
        try:
            cursor = conn.cursor()
            cursor.execute(scripts.INITIAL_SCRIPT, license_plate) # SELECT Script for license plate
            result = cursor.fetchall()
            if len(result) > 0: # Checks if any plates are found from the SELECT statement
                for row in result:
                    ap_id = row[1]
                    pass_validation = row[2]
            else: # None were found, thus unidentified vehicle
                repeat_cursor = conn.cursor()
                repeat_cursor.execute(scripts.REPEAT_UNIDENTIFIED_SCRIPT, license_plate)
                result = repeat_cursor.fetchall()
                repeat_cursor.close()
                if len(result) > 0:
                    pass_validation = -1
                    uCount -= 1
                    print("UNIDENTIFIED VEHICLE ALREADY IN DATABASE")
                else:
                    unidentified_time = datetime.datetime.now() # Gets current time
                    u_path = INFORMATION['unidentified_vehicles'] + '/' + file_path + '/' + license_plate # Creating S3 path
                    response = s3.upload_file(frame_path, INFORMATION['evidence_bucket'], u_path) # Uploads the file to S3 with proper naming convention
                    u_cursor = conn.cursor()
                    u_cursor.execute(scripts.UNIDENTIFIED_SCRIPT, license_plate, u_path, unidentified_time) # INSERT SQL script for Unidentified vehicle
                    u_cursor.commit()
                    u_cursor.close()
                    pass_validation = -1 # Sets validation to -1 to catch
            cursor.close()
        except:
            print("Error: Could not find ap_id or pass_validation")
        return ap_id, pass_validation, conn, uCount




    def getStudentInfo(self, ap_id, conn):
        student_anum = 0
        student_fname = " "
        student_lname = " "
        student_mail = " "
        try:
            cursor = conn.cursor()
            cursor.execute(scripts.STUDENT_SCRIPT, ap_id) # SELECT Script to find student info with ap_id
            result = cursor.fetchall()
            for row in result:
                student_anum = row[1]
                student_fname = row[2]
                student_lname = row[3]
                student_mail = row[4]
            cursor.close()
        except:
            print("Error: Could not retrieve student information")
        return student_anum, student_fname, student_lname, student_mail

    def ticketCreation(self, file_path, s3, frame_path, license_plate, conn):
        ticket_time = datetime.datetime.now()
        cursor = conn.cursor()
        cursor.execute(scripts.REPEAT_TICKET_SCRIPT, license_plate)
        prev_ticket_time = cursor.fetchone()
        ticket_date = prev_ticket_time[0]
        if ticket_date.date() == datetime.datetime.now().date():
            print("VEHICLE ALREADY TICKETED TODAY")
            return None
        else:
            # evidence = os.path.join(file_path,license_plate)
            evidence = file_path + '/' + license_plate
            response = s3.upload_file(frame_path, INFORMATION['evidence_bucket'], evidence) # Uploads the file to S3 with proper naming convention
            try:
                cursor = conn.cursor()
                evidence_path = os.path.join(INFORMATION['evidence_bucket'],evidence)
                cursor.execute(scripts.TICKET_SCRIPT,license_plate, evidence_path, ticket_time, 1)
                cursor.commit()
                cursor.close()
            except:
                print("Error: Ticket could not be uploaded")
            return ticket_time


    def mailto(self, email, ticket_time, ap_id, license_plate, conn):
        make = " "
        model = " "
        color = " "
        model_year = 0
        port = 587
        home_email = settings.email_account
        home_password = settings.email_password
        away_email = email
        try:
            cursor = conn.cursor()
            cursor.execute(scripts.EMAIL_INFO_SCRIPT,ap_id)
            result = cursor.fetchall()
            for row in result:
                make = row[0]
                model = row[1]
                color = row[2]
                model_year = row[3]
            cursor.close()
        except:
            print("Error: Could not retrieve student information")
        email_message = scripts.EMAIL_SCRIPT.format(make, model, color, model_year, license_plate, ticket_time)
        try:
           server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
           server.ehlo()
           server.login(home_email, home_password)
           server.sendmail(home_email, away_email, email_message)
           server.close()
           print("EMAIL SENT")
        except:
           print("Email was not sent")


if __name__ == '__main__':
    test = DataUpload()
    test.main()