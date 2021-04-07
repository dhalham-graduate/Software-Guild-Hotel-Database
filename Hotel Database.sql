DROP DATABASE IF EXISTS softwareGuildHotel;
CREATE DATABASE softwareGuildHotel;
USE softwareGuildHotel;

CREATE TABLE roomType(
roomTypeId INT AUTO_INCREMENT,
CONSTRAINT PK_roomType PRIMARY KEY (roomTypeId),
roomType VARCHAR(10) NOT NULL,
standardOccupancy INT NOT NULL,
maximumOccupancy INT NOT NULL,
extraPerson DECIMAL(4.2) NOT NULL
);

CREATE TABLE guest(
guestId INT AUTO_INCREMENT,
CONSTRAINT PK_guest PRIMARY KEY (guestId),
fullName VARCHAR(30) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(20),
state VARCHAR(20),
zip VARCHAR(6),
phone VARCHAR(15) NOT NULL
);

CREATE TABLE reservation(
reservationId INT ,
CONSTRAINT PK_reservation PRIMARY KEY (reservationId),
roomNumber INT NOT NULL,
adults INT NOT NULL,
children INT NOT NULL,
checkIn DATE NOT NULL,
checkOut DATE NOT NULL,
totalCost DECIMAL(6,2) NOT NULL,
guestId INT NOT NULL
);

CREATE TABLE appliance(
applianceId INT,
CONSTRAINT PK_appliance PRIMARY KEY (applianceId),
applianceType VARCHAR(20) NOT NULL
);

CREATE TABLE room(
roomId INT,
CONSTRAINT PK_room PRIMARY KEY (roomId),
basePrice DECIMAL(5,2) NOT NULL,
ADA BOOLEAN NOT NULL,
roomTypeId INT NOT NULL,
CONSTRAINT FK_room_roomType FOREIGN KEY (roomTypeId) REFERENCES roomType(roomTypeId)
);

CREATE TABLE roomReservation(
roomId INT,
reservationId INT,
CONSTRAINT PK_roomReservation PRIMARY KEY (roomId, reservationId),
CONSTRAINT FK_roomReservation_room FOREIGN KEY (roomId) REFERENCES room(roomId),
CONSTRAINT FK_roomReservation_reservation FOREIGN KEY (reservationId) REFERENCES reservation(reservationId)
);

CREATE TABLE roomAppliance(
roomId INT,
applianceId INT,
CONSTRAINT PK_roomAppliance PRIMARY KEY (roomId, applianceId),
CONSTRAINT FK_roomAppliance_room FOREIGN KEY (roomId) REFERENCES room(roomId),
CONSTRAINT FK_roomAppliance_appliance FOREIGN KEY (applianceId) REFERENCES appliance(applianceId)
);