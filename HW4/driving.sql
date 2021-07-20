-- Part 2: E/R to Schema
-- a)
CREATE TABLE InsuranceCo
(
    name VARCHAR(100) PRIMARY KEY,
    phone INT
);

CREATE TABLE Person
(
    ssn INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Driver
(
    dr_ssn INT PRIMARY KEY REFERENCES Person(ssn),
    driverID INT
);

CREATE TABLE NonProfessionalDriver
(
    npd_ssn INT PRIMARY KEY REFERENCES Driver(dr_ssn)
);

CREATE TABLE ProfessionalDriver
(
    pd_ssn INT PRIMARY KEY REFERENCES Driver(dr_ssn),
    medicalHistory VARCHAR(1000)
);

CREATE TABLE Vehicle
(
    licensePlate VARCHAR(10) PRIMARY KEY,
    maxLiability REAL,
    year INT,
    insuranceCompany VARCHAR(100) REFERENCES InsuranceCo(name),
    ve_ssn INT REFERENCES Person(ssn)
);

CREATE TABLE Car
(
    car_LicensePlate VARCHAR(10) PRIMARY KEY REFERENCES Vehicle(licensePlate),
    make VARCHAR(100)
);

CREATE TABLE Truck
(
    capacity INT,
    truck_LicensePlate VARCHAR(10) PRIMARY KEY REFERENCES Vehicle(licensePlate),
    truck_ssn INT REFERENCES ProfessionalDriver(pd_ssn)
);

CREATE TABLE Drives
(
    drive_LicensePlate VARCHAR(10) REFERENCES Car(car_LicensePlate),
    drives_ssn INT REFERENCES NonProfessionalDriver(npd_ssn),
    PRIMARY KEY (drive_LicensePlate, drives_ssn)
);

-- b)
-- b. (5 points) Which relation in your relational schema represents the relationship "insures" 
--    in the E/R diagram? Why is that your representation?
/*
    In the schema above, the relationship between vehicle and InsuranceCo represents the relationship
    of "insures" in line 37. The relationship between vehicle and InsuranceCo is that each company can have  many
    vechicle in the mean time that each vechicle can only have one insurance company, which perfectly 
    corresponds to the insures relation. Meanwhile, I put a reference of the primary key of InsuranceCo in the 
    Vechicle table that each vechicle we add references an insurance company. This prevents us from creating more tables.
/*

-- c)
-- c. (5 points) Compare the representation of the relationships "drives" and "operates" in your 
-- schema, and explain why they are different.
/*  For operate relationship, since there's an arrow pointing from truck to professional driver. It's a many to one relationship that we can easily
    get a truck through a professional driver's ssn. However, as for drives relationship, we can't get the car simply through nonprofessional driver's
    ssn. We need to have nonprofessional driver's ssn as well as car's licenseplate to matain the relationship.
*/


