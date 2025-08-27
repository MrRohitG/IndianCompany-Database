DROP DATABASE IF EXISTS IndianCompany;
-- Create Database
CREATE DATABASE IndianCompany;
USE IndianCompany;

-- Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) NOT NULL,
    ManagerAadhar CHAR(12),
    ManagerStartDate DATE
);

-- Employee Table
CREATE TABLE Employee (
    Aadhar CHAR(12) PRIMARY KEY, -- Aadhaar instead of SSN
    FName VARCHAR(30) NOT NULL,
    MInit CHAR(1),
    LName VARCHAR(30) NOT NULL,
    DOB DATE,
    Address VARCHAR(100),
    Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
    Salary DECIMAL(10,2),
    DeptID INT,
    SupervisorAadhar CHAR(12),
    
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),  -- one  department can have many employees
    FOREIGN KEY (SupervisorAadhar) REFERENCES Employee(Aadhar) ON DELETE SET NULL --one supervisor can have many subordinates   
    
);



-- Project Table
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Works_On Table (Many-to-Many between Employee & Project)
CREATE TABLE Works_On (
    Aadhar CHAR(12),
    ProjectID INT,
    Hours DECIMAL(4,1) CHECK (Hours >= 0),
    
    PRIMARY KEY (Aadhar, ProjectID),
    FOREIGN KEY (Aadhar) REFERENCES Employee(Aadhar) ON DELETE CASCADE,
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID) ON DELETE CASCADE
);

-- Dependent Table
CREATE TABLE Dependent (
    DependentID INT PRIMARY KEY AUTO_INCREMENT,
    Aadhar CHAR(12),
    DepName VARCHAR(50),
    Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
    Relationship VARCHAR(20),
    DOB DATE,
    
    FOREIGN KEY (Aadhar) REFERENCES Employee(Aadhar) ON DELETE CASCADE
);

-- Location Table
CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    DeptID INT,
    Location VARCHAR(50),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- -------------------------------
-- Departments
-- -------------------------------
INSERT INTO Department (DeptName, ManagerAadhar, ManagerStartDate) VALUES
('Research','111122223333','2015-04-12'),
('Administration','222233334444','2016-07-01'),
('Headquarters','333344445555','2014-01-01'),
('Finance','444455556666','2017-03-15'),
('Marketing','555566667777','2018-05-10');

-- -------------------------------
-- Employees
-- -------------------------------
-- Top Managers
INSERT INTO Employee (Aadhar, FName, MInit, LName, DOB, Address, Gender, Salary, DeptID, SupervisorAadhar) VALUES
('111122223333','Rajesh','K','Mehra','1960-08-15','10 Marine Drive, Mumbai','M',1200000,1,NULL),
('222233334444','Priya','S','Nair','1970-11-05','99 Indiranagar, Bengaluru','F',1100000,2,NULL),
('333344445555','Suresh','T','Iyer','1975-09-21','12 Baner Road, Pune','M',1150000,3,NULL),
('444455556666','Kiran','R','Sharma','1972-01-10','55 MG Road, Delhi','F',1050000,4,NULL),
('555566667777','Anita','P','Patel','1974-06-25','88 Brigade Road, Bengaluru','F',1070000,5,NULL);

-- Mid-level Managers
INSERT INTO Employee (Aadhar, FName, MInit, LName, DOB, Address, Gender, Salary, DeptID, SupervisorAadhar) VALUES
('666677778888','Amit','B','Sharma','1980-03-12','45 MG Road, Delhi','M',750000,1,'111122223333'),
('777788889999','Neha','A','Singh','1985-07-20','221 Hadapsar, Pune','F',700000,1,'111122223333'),
('888899990000','Anjali','J','Patel','1990-02-10','33 Whitefield, Bengaluru','F',720000,2,'222233334444'),
('999900001111','Arjun','V','Reddy','1991-06-30','88 Gachibowli, Hyderabad','M',710000,2,'222233334444'),
('123450001234','Rohit','K','Gupta','1988-08-15','101 Connaught Place, Delhi','M',680000,4,'444455556666'),
('123450001235','Simran','L','Kaur','1990-09-25','45 Andheri West, Mumbai','F',670000,4,'444455556666'),
('123450001236','Varun','S','Joshi','1992-04-12','78 Indiranagar, Bengaluru','M',690000,5,'555566667777'),
('123450001237','Tanya','P','Shah','1989-12-30','12 Salt Lake, Kolkata','F',660000,5,'555566667777');

-- Regular Employees
INSERT INTO Employee (Aadhar, FName, MInit, LName, DOB, Address, Gender, Salary, DeptID, SupervisorAadhar) VALUES
('123450001238','Deepak','R','Kumar','1995-03-10','15 Powai, Mumbai','M',500000,1,'666677778888'),
('123450001239','Neelam','S','Verma','1993-06-20','22 Koramangala, Bengaluru','F',480000,1,'666677778888'),
('123450001240','Sahil','M','Singh','1994-01-15','33 Baner, Pune','M',470000,1,'777788889999'),
('123450001241','Riya','K','Patel','1992-11-25','44 Whitefield, Bengaluru','F',460000,2,'888899990000'),
('123450001242','Aditya','V','Rao','1990-08-18','66 Banjara Hills, Hyderabad','M',450000,2,'999900001111'),
('123450001243','Kavya','L','Sharma','1995-07-05','101 MG Road, Delhi','F',440000,4,'123450001234'),
('123450001244','Manish','P','Gupta','1993-12-12','88 Salt Lake, Kolkata','M',430000,5,'123450001236');

-- -------------------------------
-- Projects
-- -------------------------------
INSERT INTO Project (ProjectName, Location, DeptID) VALUES
('MobileAppX','Pune',1),
('AIChatbot','Hyderabad',1),
('PaymentGateway','Delhi',1),
('ERPSystem','Bengaluru',2),
('CorporateRestructure','Mumbai',3),
('EmployeeBenefits','Bengaluru',2),
('FinancialForecast','Delhi',4),
('MarketingCampaign','Bengaluru',5),
('BrandAwareness','Mumbai',5),
('CloudMigration','Hyderabad',4);

-- -------------------------------
-- Works_On
-- -------------------------------
INSERT INTO Works_On (Aadhar, ProjectID, Hours) VALUES
('666677778888',1,35.5),
('666677778888',2,10.0),
('777788889999',1,20.0),
('777788889999',2,15.0),
('888899990000',4,25.0),
('999900001111',4,30.0),
('123450001234',7,40.0),
('123450001235',7,35.0),
('123450001236',8,20.0),
('123450001237',9,22.0),
('123450001238',1,18.0),
('123450001239',2,15.0),
('123450001240',1,25.0),
('123450001241',4,12.0),
('123450001242',10,30.0),
('123450001243',7,28.0),
('123450001244',8,26.0);

-- -------------------------------
-- Dependents
-- -------------------------------
INSERT INTO Dependent (Aadhar, DepName, Gender, Relationship, DOB) VALUES
('666677778888','Isha','F','Daughter','2015-04-05'),
('666677778888','Pooja','F','Spouse','1985-07-12'),
('777788889999','Kabir','M','Son','2018-01-04'),
('888899990000','Riya','F','Daughter','2016-12-30'),
('999900001111','Anand','M','Spouse','1972-12-25'),
('123450001234','Sara','F','Daughter','2017-02-14'),
('123450001235','Rohan','M','Son','2016-05-10'),
('123450001236','Maya','F','Spouse','1990-11-05'),
('123450001237','Aria','F','Daughter','2018-07-20'),
('123450001238','Vikram','M','Son','2019-09-25');

-- -------------------------------
-- Locations
-- -------------------------------
INSERT INTO Location (DeptID, Location) VALUES
(1,'Mumbai'),
(1,'Pune'),
(2,'Bengaluru'),
(2,'Hyderabad'),
(3,'Mumbai'),
(3,'Delhi'),
(4,'Delhi'),
(4,'Hyderabad'),
(5,'Bengaluru'),
(5,'Mumbai');


SHOW TABLES;

-- 2. Display contents of all tables
SELECT * FROM Department;
SELECT * FROM Location;
SELECT * FROM Project;
SELECT * FROM Employee;
SELECT * FROM Works_On;
SELECT * FROM Dependent;