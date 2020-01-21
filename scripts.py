INITIAL_SCRIPT = """SELECT plate_number, ap_id, pass_valid from dbo.Cars where plate_number = ?"""

STUDENT_SCRIPT = """SELECT * from dbo.Authorized_Parkers where ap_id = ?"""

TICKET_SCRIPT = """INSERT INTO dbo.Tickets (plate_number, s3_image_location, ticket_datetime, sent) VALUES (?,?,?,?)"""

EMAIL_INFO_SCRIPT = """SELECT make, model, color, model_year from dbo.Cars where ap_id = ?"""

UNIDENTIFIED_SCRIPT = """INSERT INTO dbo.Unidentified_Vehicle (supposed_plate_number, s3_image_location, unidentified_vehicle_datetime) VALUES (?,?,?)"""

REPEAT_TICKET_SCRIPT = """SELECT MAX(ticket_datetime) from dbo.Tickets where plate_number = ?"""

REPEAT_UNIDENTIFIED_SCRIPT = """SELECT s3_image_location from dbo.Unidentified_Vehicle where supposed_plate_number = ?"""

EMAIL_SCRIPT =  """Subject: TAMUCC Parking Violation (This is not real)\n
Dear Islander,

You are receiving this email due to a vehicle registered under your name that has been found 
parking on campus grounds without a valid parking pass. Please visit University Police Department 
to address this issue so that a valid parking pass can be issued and your balance can be paid.

MAKE: {}
MODEL: {}
COLOR: {}
YEAR: {}
PLATE: {}
DATE: {}

Thank you,
University Police Department
Texas A&M - Corpus Christi
6300 Ocean Drive

Disclaimer: Not real, part of a class project
"""