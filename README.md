# Project Overview

With “UAV Parking Enforcement”, we are using image processing to detect the license
plates of authorized and unauthorized vehicles within the TAMUCC parking lots. It will
then cross reference the extracted license plate numbers with information in the database
to make sure the license plate in question is authorized to park on campus. This could all
be seen on a web application UPD will have access to.

This benefits UPD because of the automation of the ticketing process, more areas can be
covered while preventing more unauthorized parking or the use of invalid parking passes.
With the ability to ”email” the unauthorized parker their ticket, issues with lost tickets or
claiming to have never received one would be greatly reduced. This is because all
documentation would be recorded in the database for future referencing. This overall
would help with cracking down on unauthorized parking.

For this project to be fully functional, we will need access to drones, AWS, a database, and
a server that can handle image processing. All of the results from the image processing
script will be stored in the database, and all of the drone videos will be stored and dated in
a bucket on AWS. The tables from the database will be presented through a web
application that officers can use to find information. A login should be used to increase
security so only officers can access the web application.

## Product Perspective

The product in the making will be its own new self contained product. There are multiple
parts to our system; drone, AWS, server, database and web application. Each will play a
crucial part in the completion of our product.

The drone will have to either be controlled by a user with a remote or follow a planned
pathway to record vehicles in the parking lot. Due to the amount of images produced, and
the amount of hardware needed, the videos will be transferred off of the drone to perform
the image processing remotely.

Through our server, we will send the videos to AWS S3, which will store our videos based
on date captured in their own sub directories that can be pulled from the bucket through a
function in the python script. The video will be downloaded onto the server to go through
the image processing algorithm and then deleted upon completion due to the sheer size of
the memory it will take up. We must have a server capable of using high levels of image
processing and enough storage to pull a video each time during the loop.

Once the script has run, the information will be compared to a working database of current
authorized individual by using SQL statements, if it does not match an existing authorized
user, the vehicle will be considered unauthorized and will receive a ticket and their
information will be inserted into the ticketing database for reference. All of this will be
seen using a UI that the officers on duty will have access to.



## Master Branch

The master branch is the python backend of the project. The script takes an argument being the mp4 video and then the image processing takes place by breaking the video into frames. Once the frames are separated, the plates are extracted and placed into a CSV for comparison within the database.

## ASP Branch
The asp branch is used as our web application that officers can use to check the ticketing process and if a student wishes to argue their ticket, the officer has evidence of the ticket, the date and time of the ticket, as well as the S3 path of the frame for reference.
