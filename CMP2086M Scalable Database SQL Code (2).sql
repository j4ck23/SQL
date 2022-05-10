CREATE DATABASE Delivery_Company;

CREATE TABLE Driver(
    Driver_ID int NOT NULL,
    Driver_name VARCHAR(50) NOT NULL,
    Driver_Tele VARCHAR (15) NOT NULL,
    Driver_Email VARCHAR(40),
    D_Emergency_Contact VARCHAR(12) NOT NULL,
    D_Availability VARCHAR(10),
    PRIMARY KEY (Driver_ID),
    UNIQUE(Driver_Tele),
   	UNIQUE(Driver_Email)
   );

CREATE TABLE Vehicle(
    Vehicle_ID int NOT NULL,
    License_plate VARCHAR(8) NOT NULL,
    Vehicle_make VARCHAR (20) NOT NULL,
    Insurance_expire_date VARCHAR(20) NOT NULL,
    Tax_date VARCHAR(20) NOT NULL,
    MOT_Date VARCHAR(20) NOT NULL,
    PRIMARY KEY (Vehicle_ID),
    UNIQUE (License_plate)
   );

CREATE TABLE Delivery_Location(
    Delivery_Location_ID int NOT NULL,
    Location_name VARCHAR (40) NOT NULL,
    Location_Code VARCHAR (10) NOT NULL,
    PRIMARY KEY (Delivery_Location_ID)
    );

CREATE TABLE Delivery_Details(
    Delivery_ID int NOT NULL,
    Number_Parcels int NOT NULL,
    Delivery_Location_ID int NOT NULL,
    Parcels_Delivered int NOT NULL,
    Parcels_Returned int,
    PRIMARY KEY (Delivery_ID),
    FOREIGN KEY (Delivery_Location_ID) REFERENCES Delivery_Location(Delivery_Location_ID)
    );

CREATE TABLE Manager(
    Manager_ID int NOT NULL,
    Manager_name VARCHAR(50) NOT NULL,
    Manager_Tele VARCHAR (15) NOT NULL,
    Manager_Email VARCHAR(40),
    M_Emergency_Contact VARCHAR(12) NOT NULL,
    M_Availability VARCHAR(10),
    PRIMARY KEY (Manager_ID),
    UNIQUE(Manager_Tele),
    UNIQUE(Manager_Email)
   );

CREATE TABLE Shift(
    Shift_ID int NOT NULL,
    Driver_ID int NOT NULL,
    Vehicle_ID int NOT NULL,
    Delivery_ID int NOT NULL,
    AM_OR_PM VARCHAR(2) NOT NULL,
    Day VARCHAR(12) NOT NULL,
    Manager_ID int NOT NULL,
    PRIMARY KEY (Shift_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    FOREIGN KEY (Delivery_ID) REFERENCES Delivery_Details(Delivery_ID),
    FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID)
    );   

CREATE TABLE Delivery_Status(
    Delivery_Status_ID int NOT NULL,
    Shift_ID int NOT NULL,
    Location VARCHAR (30) NOT NULL,
    Status VARCHAR(30) NOT NULL,
    PRIMARY KEY (Delivery_Status_ID),
    FOREIGN KEY (SHIFT_ID) REFERENCES Shift(Shift_ID)
    );

GRANT INSERT ON Driver TO Manager;
GRANT INSERT ON Delivery_Details TO Manager;
GRANT INSERT ON Delivery_Location TO Manager;
GRANT INSERT ON Delivery_Status TO Manager;
GRANT INSERT ON Manager TO Manager;
GRANT INSERT ON Shift TO Manager;
GRANT INSERT ON Vehicle TO Manager;

GRANT SELECT ON Driver TO Manager;
GRANT SELECT ON Delivery_Details TO Manager;
GRANT SELECT ON Delivery_Location TO Manager;
GRANT SELECT ON Delivery_Status TO Manager;
GRANT SELECT ON Manager TO Manager;
GRANT SELECT ON Shift TO Manager;
GRANT SELECT ON Vehicle TO Manager;

GRANT DROP ON Driver TO Manager;
GRANT DROP ON Delivery_Details TO Manager;
GRANT DROP ON Delivery_Location TO Manager;
GRANT DROP ON Delivery_Status TO Manager;
GRANT DROP ON Manager TO Manager;
GRANT DROP ON Shift TO Manager;
GRANT DROP ON Vehicle TO Manager;

GRANT DELETE ON Driver TO Manager;
GRANT DELETE ON Delivery_Details TO Manager;
GRANT DELETE ON Delivery_Location TO Manager;
GRANT DELETE ON Delivery_Status TO Manager;
GRANT DELETE ON Manager TO Manager;
GRANT DELETE ON Shift TO Manager;
GRANT DELETE ON Vehicle TO Manager;

INSERT INTO Driver
    (Driver_ID, Driver_name, Driver_Tele, Driver_Email, D_Emergency_Contact, D_Availability)
Values
    (1, 'Dave Fullman', '07986498966', 'Dave@Gmail.com', '07856932549', 'Available'),
    (2, 'Simon Red', '03657854128', 'SimonR34@Gmail.com', '07854129876', 'Available'),
    (3, 'Luara Green', '07854123684', 'LGreen@Gmail.com', '07895677473', 'Hoilday'),
    (4, 'Liam Bailey', '07968732354', 'Laim_Bailey@Gmail.com', '07895487501', 'Available'),
    (5, 'Paul Huddson', '07989858959', 'Paul2@Gmail.com', '07865863332', 'Available'),
    (6, 'Rachel Wayne', '07998438966', 'RachYne2@Gmail.com', '07858457156', 'Available'),
    (7, 'Dave lukewater', '07985585476', 'DaveLuke2@Gmail.com', '07812346987', 'Hoilday'),
    (8, 'Mike Power', '07985635745', 'Mikeyp@Gmail.com', '07802505078', 'Available'),
    (9, 'Karen Miller', '07985454789', 'Karne123@Gmail.com', '07800587301', 'Sick'),
    (10, 'Bryce salior', '07986787968', 'SailorB@Gmail.com', '07856569631', 'Available');

INSERT INTO Vehicle
    (Vehicle_ID, License_plate, Vehicle_make, Insurance_expire_date, Tax_date, MOT_Date)
Values
    (1, 'BD69 SMR', 'Ford Transit', '10/08/2021', '11/01/2022', '11/08/2021'),
    (2, 'MY70 JHT', 'Ford Transit', '26/11/2021', '11/01/2022', '16/06/2021'),
    (3, 'LL69 YTE', 'Ford Transit', '06/01/2022', '11/01/2022', '30/11/2021'),
    (4, 'MF70 HTE', 'Ford Transit', '16/09/2021', '11/01/2022', '20/02/2021'),
    (5, 'SW70 HAW', 'Ford Transit', '10/08/2021', '11/01/2022', '24/05/2021');

INSERT INTO Delivery_Location
    (Delivery_Location_ID, Location_name, Location_Code)
Values
    (1, 'Lincoln Center', 'LN1'),
    (2, 'Lincoln Nettleham', 'LN2'),
    (3, 'Lincoln Fiskerton', 'LN3'),
    (4, 'Lincoln Branston', 'LN4'),
    (5, 'Lincoln Waddington', 'LN5'),
    (6, 'Lincoln Hykeham', 'LN6'),
    (7, 'Market Rasen - Caistor', 'LN7'),
    (8, 'Market Rasen', 'LN8'),
    (9, 'Horncastle', 'LN9'),
    (10, 'Woodhall Spa', 'LN10'),
    (11, 'Louth', 'LN11'),
    (12, 'Mablethorpe', 'LN12');

INSERT INTO Delivery_Details
    (Delivery_ID, Number_Parcels, Delivery_Location_ID, Parcels_Delivered, Parcels_Returned)
Values
    (1, 20, 1, 20, 0),
    (2, 20, 2, 20, 0),
    (3, 40, 3, 37, 3),
    (4, 24, 6, 20, 4),
    (5, 52, 7, 51, 1),
    (6, 21, 9, 20, 1),
    (7, 10, 12, 10, 0),
    (8, 30, 7, 27, 3),
    (9, 60, 1, 58, 2),
    (10, 32, 7, 31, 1),
    (11, 20, 9, 20, 0),
    (12, 20, 10, 20, 0),
    (13, 40, 11, 37, 3),
    (14, 24, 1, 20, 4),
    (15, 52, 2, 51, 1),
    (16, 21, 4, 20, 1),
    (17, 10, 6, 10, 0),
    (18, 30, 7, 27, 3),
    (19, 60, 1, 58, 2),
    (20, 32, 9, 31, 1),
    (21, 20, 12, 20, 0),
    (22, 20, 8, 20, 0),
    (23, 40, 9, 37, 3),
    (24, 24, 11, 20, 4),
    (25, 52, 3, 51, 1),
    (26, 21, 5, 20, 1),
    (27, 10, 10, 10, 0),
    (28, 30, 6, 27, 3),
    (29, 60, 1, 58, 2),
    (30, 32, 9, 31, 1),
    (31, 20, 12, 20, 0),
    (32, 20, 6, 20, 0),
    (33, 40, 7, 37, 3),
    (34, 24, 8, 20, 4),
    (35, 52, 4, 51, 1),
    (36, 21, 9, 20, 1),
    (37, 10, 3, 10, 0),
    (38, 30, 5, 27, 3),
    (39, 60, 1, 58, 2),
    (40, 32, 2, 31, 1),
    (41, 20, 10, 20, 0),
    (42, 20, 11, 20, 0),
    (43, 40, 9, 37, 3),
    (44, 24, 3, 20, 4),
    (45, 52, 5, 51, 1),
    (46, 21, 6, 20, 1),
    (47, 10, 12, 10, 0),
    (48, 30, 1, 27, 3),
    (49, 60, 9, 58, 2),
    (50, 32, 5, 31, 1);

INSERT INTO Manager
    (Manager_ID, Manager_name, Manager_Tele, Manager_Email, M_Emergency_Contact, M_Availability)
Values
    (1, 'Lisa Beth', '07865321485', 'LisaB@Gmail.com', '07854653574', 'Available'),
    (2, 'Sara king', '07854545896', 'SK12@Gmail.com', '07856996365', 'Available'),
    (3, 'Luara Kest', '07845663574', 'LKT@Gmail.com', '07845412458', 'Hoilday');

INSERT INTO Shift
    (Shift_ID, Driver_ID, Vehicle_ID, Delivery_ID, AM_OR_PM, Day, Manager_ID)
Values
    (1, 1, 1, 1, 'AM', 'Monday', 1),
    (2, 2, 2, 2, 'AM', 'Monday', 1),
    (3, 6, 3, 3, 'AM', 'Monday', 1),
    (4, 7, 4, 4, 'AM', 'Monday', 1),
    (5, 3, 5, 5, 'AM', 'Monday', 1),
    (6, 3, 1, 6, 'PM', 'Monday', 1),
    (7, 7, 2, 7, 'PM', 'Monday', 1),
    (8, 9, 3, 8, 'PM', 'Monday', 1),
    (9, 10, 4, 9, 'PM', 'Monday', 1),
    (10, 4, 5, 10, 'PM', 'Monday', 1),
    (11, 1, 1, 11, 'AM', 'Tuesday', 1),
    (12, 2, 2, 12, 'AM', 'Tuesday', 1),
    (13, 6, 3, 13, 'AM', 'Tuesday', 1),
    (14, 8, 4, 14, 'AM', 'Tuesday', 1),
    (15, 5, 5, 15, 'AM', 'Tuesday', 1),
    (16, 5, 1, 16, 'PM', 'Tuesday', 2),
    (17, 7, 2, 17, 'PM', 'Tuesday', 2),
    (18, 6, 3, 18, 'PM', 'Tuesday', 2),
    (19, 10, 4, 19, 'PM', 'Tuesday', 2),
    (20, 9, 5, 20, 'PM', 'Tuesday', 2),
    (21, 2, 1, 21, 'AM', 'Wednesday', 2),
    (22, 3, 2, 22, 'AM', 'Wednesday', 2),
    (23, 9, 3, 23, 'AM', 'Wednesday', 2),
    (24, 10, 4, 24, 'AM', 'Wednesday', 2),
    (25, 6, 5, 25, 'AM', 'Wednesday', 2),
    (26, 3, 1, 26, 'PM', 'Wednesday', 2),
    (27, 9, 2, 27, 'PM', 'Wednesday', 2),
    (28, 4, 3, 28, 'PM', 'Wednesday', 2),
    (29, 5, 4, 29, 'PM', 'Wednesday', 2),
    (30, 6, 5, 30, 'PM', 'Wednesday', 2),
    (31, 1, 1, 31, 'AM', 'Thursday', 3),
    (32, 2, 2, 32, 'AM', 'Thursday', 3),
    (33, 8, 3, 33, 'AM', 'Thursday', 3),
    (34, 9, 4, 34, 'AM', 'Thursday', 3),
    (35, 10, 5, 35, 'AM', 'Thursday', 3),
    (36, 10, 1, 36, 'PM', 'Thursday', 3),
    (37, 5, 2, 37, 'PM', 'Thursday', 3),
    (38, 6, 3, 38, 'PM', 'Thursday', 3),
    (39, 9, 4, 39, 'PM', 'Thursday', 3),
    (40, 7, 5, 40, 'PM', 'Thursday', 1),
    (41, 1, 1, 41, 'AM', 'Firday', 1),
    (42, 2, 2, 42, 'AM', 'Firday', 1),
    (43, 4, 3, 43, 'AM', 'Firday', 1),
    (44, 6, 4, 44, 'AM', 'Firday', 1),
    (45, 8, 5, 45, 'AM', 'Firday', 1),
    (46, 4, 1, 46, 'PM', 'Firday', 1),
    (47, 6, 2, 47, 'PM', 'Firday', 1),
    (48, 5, 3, 48, 'PM', 'Firday', 1),
    (49, 10, 4, 49, 'PM', 'Firday', 1),
    (50, 9, 5, 50, 'PM', 'Firday', 1);

INSERT INTO Delivery_Status
    (Delivery_Status_ID, Shift_ID, Location, Status)
Values
    (1, 46, 'MableThorpe-Mablethorpe', 'OUT'),
    (2, 47, 'Horncastle-Langton', 'OUT'),
    (3, 48, 'Horncastle-Tetford', 'OUT'),
    (4, 49, 'Lincoln-Saxilby' , 'OUT'),
    (5, 50, 'Lincoln-Depot', 'HOME');


CREATE PROCEDURE GetLocation()

SELECT delivery_status.Shift_ID, shift.Shift_ID, Location, Driver_ID, Vehicle_ID
FROM delivery_status 
INNER JOIN shift on delivery_status.Shift_ID = shift.Shift_ID;

CALL GetLocation;

DELIMITER //

CREATE PROCEDURE Parcels_Delivered(in Driver int, in Day varchar(12))
BEGIN

SELECT delivery_details.Delivery_ID, SUM(parcels_delivered), shift.Delivery_ID, Driver_ID, Day
From delivery_details
INNER JOIN shift on delivery_details.Delivery_ID = shift.Delivery_ID
where shift.Driver_ID = Driver
AND shift.Day = Day;

END //

DELIMITER ;
                                   
CALL Parcels_Delivered(1, 'Monday');

SELECT * FROM driver;

SELECT DISTINCT Driver_ID, AM_OR_PM 
from Shift 
group by Driver_ID
having max(AM_OR_PM) = 'AM'