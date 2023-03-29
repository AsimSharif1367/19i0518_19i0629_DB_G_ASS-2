---------------------------------19i-0518__Asim Sharif-----------------------------------------
CREATE TABLE PlaneType (
    Model VARCHAR(50) PRIMARY KEY,
    Capacity INT,
    Weight INT
);

CREATE TABLE Hangar (
    Number INT PRIMARY KEY,
    Capacity INT,
    Location VARCHAR(50)
);

CREATE TABLE Airplane (
    RegNum VARCHAR(50) PRIMARY KEY,
    OfType VARCHAR(50),
    StoredIn INT,
   FOREIGN KEY (OfType) REFERENCES PlaneType(Model),
   FOREIGN KEY (StoredIn) REFERENCES Hangar(Number)
);



CREATE TABLE Owner (
    Ssn VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Phone VARCHAR(50),
    OwnerType VARCHAR(50)
);

CREATE TABLE Person (
    Ssn VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Phone VARCHAR(50)
);

CREATE TABLE Pilot (
    Ssn VARCHAR(50) PRIMARY KEY,
    LicNum VARCHAR(50),
    Restr VARCHAR(50),
    FOREIGN KEY (Ssn) REFERENCES Person(Ssn)
);


CREATE TABLE Employee (
    Ssn VARCHAR(50) PRIMARY KEY,
    Salary INT,
    Shift VARCHAR(50),
    FOREIGN KEY (Ssn) REFERENCES Person(Ssn)
);


CREATE TABLE Corporation (
    Name VARCHAR(50) PRIMARY KEY,
    Address VARCHAR(50),
    Phone VARCHAR(50)
);

CREATE TABLE Flies (
    Ssn VARCHAR(50),
    Model VARCHAR(50),
    PRIMARY KEY (Ssn, Model),
    FOREIGN KEY (Ssn) REFERENCES Pilot(Ssn),
    FOREIGN KEY (Model) REFERENCES PlaneType(Model)
);

CREATE TABLE WorksOn (
    Ssn VARCHAR(50),
    Model VARCHAR(50),
    PRIMARY KEY (Ssn, Model),
    FOREIGN KEY (Ssn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Model) REFERENCES PlaneType(Model)
);

CREATE TABLE PlaneService (
    ServiceId INT PRIMARY KEY,
    RegNum VARCHAR(50),
    DateOfMaintenance DATE,
    HoursSpent INT,
    WorkCode VARCHAR(50),
    FOREIGN KEY (RegNum) REFERENCES Airplane(RegNum)
);

CREATE TABLE Owns (
    OwnerSsn VARCHAR(50),
    RegNum VARCHAR(50),
    PDate DATE,
    PRIMARY KEY (OwnerSsn, RegNum),
    FOREIGN KEY (OwnerSsn) REFERENCES Owner(Ssn),
    FOREIGN KEY (RegNum) REFERENCES Airplane(RegNum)
);

CREATE TABLE Maintain (
    ServiceId INT,
    EmpSsn VARCHAR(50),
	RegNum VARCHAR(50),
    PRIMARY KEY (ServiceId, EmpSsn),
    FOREIGN KEY (ServiceId) REFERENCES PlaneService(ServiceId),
    FOREIGN KEY (EmpSsn) REFERENCES Employee(Ssn),
    FOREIGN KEY (RegNum) REFERENCES Airplane(RegNum)
);


--------------------------------------insertion-------------------------------------

 -- Insert 20 dummy records into the plane_type table----

INSERT INTO PlaneType (Model, Capacity, Weight)
VALUES
  ('Boeing 747', 660, 485000),
  ('Airbus A320', 220, 174000),
  ('Cessna 172', 4, 2400),
  ('Piper PA-28', 4, 2300),
  ('Gulfstream G650', 19, 54100);
  ---------------------------------INSERT INTO hangar-----------------------------

  INSERT INTO hangar (Number, Capacity, Location)
VALUES
  (1, 10, 'Location 1'),
  (2, 5, 'Location 2'),
  (3, 15, 'Location 3'),
  (4, 8, 'Location 4'),
  (5, 20, 'Location 5'),
  (6, 6, 'Location 6'),
  (7, 12, 'Location 7'),
  (8, 7, 'Location 8'),
  (9, 18, 'Location 9'),
  (0, 9, 'Location 10'),
  (11, 14, 'Location 11'),
  (12, 3, 'Location 12'),
  (13, 11, 'Location 13'),
  (14, 16, 'Location 14'),
  (15, 4, 'Location 15'),
  (16, 13, 'Location 16'),
  (17, 19, 'Location 17'),
  (18, 2, 'Location 18'),
  (19, 17, 'Location 19'),
  (20, 1, 'Location 20');




INSERT INTO airplane (RegNum, OfType, StoredIn)
VALUES 
   ('A001', 'PT001', 1),
   ('A002', 'PT002', 2),
   ('A003', 'PT003', 3),
   ('A004', 'PT004', 4),
   ('A005', 'PT005', 5),
   ('A006', 'PT006', 6),
   ('A007', 'PT007', 7),
   ('A008', 'PT008', 8),
   ('A009', 'PT009', 9),
   ('A010', 'PT010', 10),
   ('A011', 'PT011', 11),
   ('A012', 'PT012', 12),
   ('A013', 'PT013', 13),
   ('A014', 'PT014', 14),
   ('A015', 'PT015', 15),
   ('A016', 'PT016', 16),
   ('A017', 'PT017', 17),
   ('A018', 'PT018', 18),
   ('A019', 'PT019', 19),
   ('A020', 'PT020', 20);

  SELECT Model FROM PlaneType;
  ---------------------------------- INSERT INTO owner --------------------

  INSERT INTO owner (Ssn, Name, Address, Phone, OwnerType)
VALUES
  ('123-45-6789', 'John Doe', '123 Main St, Anytown, USA', '555-1234', 'person'),
  ('987-65-4321', 'Jane Doe', '456 Oak St, Anytown, USA', '555-5678', 'person'),
  ('555-55-5555', 'Acme Corporation', '789 Broadway, Anytown, USA', '555-2468', 'corporation'),
  ('111-11-1111', 'Joe Smith', '321 Elm St, Anytown, USA', '555-9876', 'person'),
  ('222-22-2222', 'Samantha Johnson', '654 Pine St, Anytown, USA', '555-5432', 'person'),
  ('333-33-3333', 'Global Industries', '987 Maple Ave, Anytown, USA', '555-1357', 'corporation'),
  ('444-44-4444', 'Bob Williams', '246 Cedar St, Anytown, USA', '555-2468', 'person'),
  ('555-55-5555', 'Karen Davis', '369 Oak St, Anytown, USA', '555-3690', 'person'),
  ('666-66-6666', 'XYZ Enterprises', '111 Maple St, Anytown, USA', '555-8888', 'corporation'),
  ('777-77-7777', 'Alice Lee', '444 Elm St, Anytown, USA', '555-7777', 'person'),
  ('888-88-8888', 'Jack Johnson', '777 Cedar St, Anytown, USA', '555-2222', 'person'),
  ('999-99-9999', 'ABC Corporation', '888 Pine St, Anytown, USA', '555-1111', 'corporation'),
  ('111-11-1111', 'Mark Thompson', '321 Main St, Anytown, USA', '555-2468', 'person'),
  ('222-22-2222', 'Lisa Rodriguez', '654 Oak St, Anytown, USA', '555-5432', 'person'),
  ('333-33-3333', 'PQR Corporation', '987 Maple Ave, Anytown, USA', '555-1357', 'corporation'),
  ('444-44-4444', 'Tom Wilson', '246 Cedar St, Anytown, USA', '555-2468', 'person'),
  ('555-55-5555', 'Nancy Davis', '369 Elm St, Anytown, USA', '555-3690', 'person'),
  ('666-66-6666', 'LMN Enterprises', '111 Maple St, Anytown, USA', '555-8888', 'corporation'),
  ('777-77-7777', 'David Lee', '444 Pine St, Anytown, USA', '555-7777', 'person'),
  ('888-88-8888', 'Jacob Bob', '447 Cedar St,Anytown, USA', '555-9877', 'corporation');



  INSERT INTO Person (Ssn, Name, Address, Phone)
VALUES
  ('111-11-1111', 'John Smith', '123 Main St', '555-1234'),
  ('222-22-2222', 'Jane Doe', '456 Maple Ave', '555-5678'),
  ('333-33-3333', 'Bob Johnson', '789 Oak St', '555-9012'),
  ('444-44-4444', 'Samantha Lee', '321 Elm St', '555-3456'),
  ('555-55-5555', 'Michael Davis', '654 Pine St', '555-7890'),
  ('666-66-6666', 'Emily Wilson', '987 Cedar St', '555-2345'),
  ('777-77-7777', 'David Brown', '246 Cherry St', '555-6789'),
  ('888-88-8888', 'Karen Taylor', '135 Birch Ave', '555-0123'),
  ('999-99-9999', 'Steven Green', '864 Oak Ave', '555-4567'),
  ('123-45-6789', 'Sarah Kim', '987 Maple St', '555-8901'),
  ('234-56-7890', 'William Chen', '654 Cedar St', '555-2345'),
  ('345-67-8901', 'Rachel Rodriguez', '321 Pine Ave', '555-6789'),
  ('456-78-9012', 'Ryan Patel', '246 Oak Ave', '555-0123'),
  ('567-89-0123', 'Jennifer Nguyen', '135 Birch St', '555-4567'),
  ('678-90-1234', 'Daniel Ramirez', '864 Maple Ave', '555-8901'),
  ('789-01-2345', 'Sophia Wong', '987 Elm St', '555-2345'),
  ('890-12-3456', 'Matthew Kim', '654 Cherry St', '555-6789'),
  ('901-23-4567', 'Ava Davis', '321 Cedar St', '555-0123'),
  ('012-34-5678', 'Ethan Martinez', '246 Pine Ave', '555-4567'),
  ('345-67-8901', 'Isabella Rodriguez', '135 Oak St', '555-8901');



  ---------------------------------INSERT INTO pilot----------------------------

  INSERT INTO pilot (Ssn,Licnum, Restr)
VALUES
  ('111-11-1111', 'P001', 'None'),
  ('222-22-2222', 'P002', 'Glider'),
  ('333-33-3333',  'P003', 'Single-engine land'),
  ('444-44-4444', 'P004', 'Multi-engine land'),
  ('555-55-5555', 'P005', 'Single-engine sea'),
  ('666-66-6666', 'P006', 'Multi-engine sea'),
  ('777-77-7777', 'P007', 'Rotorcraft-helicopter'),
  ('888-88-8888', 'P008', 'Rotorcraft-gyroplane'),
  ('999-99-9999', 'P009', 'Lighter-than-air-balloon'),
  ('123-45-6789',  'P010', 'Lighter-than-air-dirigible'),
  ('234-56-7890',  'P011', 'Powered-lift'),
  ('345-67-8901',  'P012', 'Powered-parachute'),
  ('456-78-9012', 'P013', 'Weight-shift-control'),
  ('567-89-0123', 'P014', 'Glider and powered-glider'),
  ('678-90-1234',  'P015', 'Single-engine land '),
  ('789-01-2345', 'P016', 'Multi-engine land '),
  ('890-12-3456', 'P017', 'Rotorcraft-helicopter'),
  ('901-23-4567', 'P018',  'None'),
  ('880-13-3656', 'P019', 'Rotorcraft-helicopter'),
  ('990-11-3456', 'P020', 'Glider');


  ------------------------------INSERT INTO Employee-----------------------

  INSERT INTO Employee (Ssn, Salary, Shift)
VALUES 
    ('111-11-1111', 50000, 'Day'),
    ('222-22-2222', 65000, 'Night'),
    ('333-33-3333', 45000, 'Day'),
    ('444-44-4444', 70000, 'Night'),
    ('555-55-5555', 55000, 'Day'),
    ('666-66-6666', 60000, 'Night'),
    ('777-77-7777', 40000, 'Day'),
    ('888-88-8888', 75000, 'Night'),
    ('999-99-9999', 60000, 'Day'),
    ('101-01-0101', 45000, 'Night'),
    ('202-02-0202', 70000, 'Day'),
    ('303-03-0303', 55000, 'Night'),
    ('404-04-0404', 60000, 'Day'),
    ('505-05-0505', 40000, 'Night'),
    ('606-06-0606', 75000, 'Day'),
    ('707-07-0707', 60000, 'Night'),
    ('808-08-0808', 45000, 'Day'),
    ('909-09-0909', 70000, 'Night'),
    ('123-45-6789', 55000, 'Day'),
    ('987-65-4321', 60000, 'Night');

	
	INSERT INTO Corporation (Name, Address, Phone)
VALUES
  ('ABC Inc', '123 Main St, Anytown USA', '555-1234'),
  ('XYZ Corp', '456 High St, Anytown USA', '555-5678'),
  ('Acme Enterprises', '789 Broad St, Anytown USA', '555-9012'),
  ('Globex Corporation', '321 Center St, Anytown USA', '555-3456'),
  ('Initech Inc', '543 Oak St, Anytown USA', '555-7890'),
  ('Umbrella Corporation', '876 Pine St, Anytown USA', '555-2345'),
  ('Stark Industries', '987 Maple St, Anytown USA', '555-6789'),
  ('Wayne Enterprises', '654 Cedar St, Anytown USA', '555-0123'),
  ('LexCorp', '321 Elm St, Anytown USA', '555-4567'),
  ('Weyland-Yutani Corporation', '789 Birch St, Anytown USA', '555-8901'),
  ('Tyrell Corporation', '246 Cherry St, Anytown USA', '555-2345'),
  ('Omni Consumer Products', '135 Walnut St, Anytown USA', '555-6789'),
  ('Cyberdyne Systems', '864 Oak St, Anytown USA', '555-0123'),
  ('Aperture Science', '975 Pine St, Anytown USA', '555-4567'),
  ('Black Mesa Research Facility', '864 Elm St, Anytown USA', '555-8901'),
  ('Abstergo Industries', '753 Cedar St, Anytown USA', '555-2345'),
  ('Massive Dynamic', '864 Birch St, Anytown USA', '555-6789'),
  ('Vault-Tec Corporation', '975 Cherry St, Anytown USA', '555-0123'),
  ('Watterson Inc', '246 Walnut St, Anytown USA', '555-4567'),
  ('Monarch Sciences', '135 Oak St, Anytown USA', '555-8901');


  INSERT INTO Flies (Ssn, Model)
VALUES
    ('111-11-1111', 'Boeing 747'),
    ('111-11-1111', 'Airbus A380'),
    ('222-22-2222', 'Cessna 172'),
    ('222-22-2222', 'Boeing 737'),
    ('333-33-3333', 'Airbus A320'),
    ('333-33-3333', 'Boeing 777'),
    ('444-44-4444', 'Cessna 182'),
    ('555-55-5555', 'Piper Cherokee'),
    ('666-66-6666', 'Boeing 787'),
    ('666-66-6666', 'Airbus A350'),
    ('777-77-7777', 'Cessna 152'),
    ('888-88-8888', 'Boeing 737'),
    ('888-88-8888', 'Boeing 747'),
    ('999-99-9999', 'Airbus A320'),
    ('999-99-9999', 'Boeing 787'),
    ('999-99-9999', 'Airbus A380'),
    ('999-99-9999', 'Boeing 777'),
    ('999-99-9999', 'Airbus A350'),
    ('999-99-9999', 'Boeing 747'),
    ('999-99-9999', 'Boeing 737');



	INSERT INTO WorksOn (Ssn, Model) VALUES
('111-11-1111', 'Boeing 747'),
('222-22-2222', 'Airbus A380'),
('333-33-3333', 'Boeing 737'),
('444-44-4444', 'Embraer E190'),
('555-55-5555', 'Cessna Citation X'),
('666-66-6666', 'Boeing 767'),
('777-77-7777', 'Airbus A320'),
('888-88-8888', 'Boeing 787'),
('999-99-9999', 'Bombardier Global 7500'),
('111-11-1111', 'Embraer Phenom 100'),
('222-22-2222', 'Boeing 777'),
('333-33-3333', 'Cessna 172'),
('444-44-4444', 'Airbus A330'),
('555-55-5555', 'Boeing 757'),
('666-66-6666', 'Embraer Legacy 500'),
('777-77-7777', 'Boeing 737 MAX'),
('888-88-8888', 'Cessna 206'),
('999-99-9999', 'Airbus A321'),
('101-01-0101', 'Boeing 737'),
('202-02-0202', 'Cessna Citation CJ3');




INSERT INTO PlaneService (ServiceId, RegNum, DateOfMaintenance, HoursSpent, WorkCode) 
VALUES 
(1, 'ABC123', '2022-02-01', 10, 'AC001'),
(2, 'DEF456', '2022-02-02', 12, 'AC002'),
(3, 'GHI789', '2022-02-03', 8, 'AC003'),
(4, 'JKL012', '2022-02-04', 6, 'AC004'),
(5, 'MNO345', '2022-02-05', 9, 'AC005'),
(6, 'PQR678', '2022-02-06', 7, 'AC006'),
(7, 'STU901', '2022-02-07', 11, 'AC007'),
(8, 'VWX234', '2022-02-08', 13, 'AC008'),
(9, 'YZA567', '2022-02-09', 5, 'AC009'),
(10, 'BCD890', '2022-02-10', 4, 'AC010'),
(11, 'EFG123', '2022-02-11', 15, 'AC011'),
(12, 'HIJ456', '2022-02-12', 3, 'AC012'),
(13, 'KLM789', '2022-02-13', 14, 'AC013'),
(14, 'NOP012', '2022-02-14', 11, 'AC014'),
(15, 'QRS345', '2022-02-15', 9, 'AC015'),
(16, 'TUV678', '2022-02-16', 8, 'AC016'),
(17, 'WXY901', '2022-02-17', 7, 'AC017'),
(18, 'ZAB234', '2022-02-18', 6, 'AC018'),
(19, 'CDE567', '2022-02-19', 5, 'AC019'),
(20, 'FGH890', '2022-02-20', 12,'AC020');




INSERT INTO Owns (OwnerSsn, RegNum, PDate)
VALUES
('123-45-6789', 'ABC123', '2022-01-01'),
('234-56-7890', 'XYZ789', '2022-02-15'),
('345-67-8901', 'DEF456', '2022-03-10'),
('456-78-9012', 'GHI789', '2022-04-20'),
('567-89-0123', 'JKL123', '2022-05-05'),
('678-90-1234', 'MNO456', '2022-06-08'),
('789-01-2345', 'PQR789', '2022-07-22'),
('890-12-3456', 'STU123', '2022-08-15'),
('901-23-4567', 'VWX456', '2022-09-18'),
('012-34-5678', 'YZA789', '2022-10-25'),
('123-45-6789', 'BCD123', '2022-11-11'),
('234-56-7890', 'EFG456', '2022-12-20'),
('345-67-8901', 'HIJ789', '2023-01-02'),
('456-78-9012', 'KLM123', '2023-02-12'),
('567-89-0123', 'NOP456', '2023-03-08'),
('678-90-1234', 'QRS789', '2023-04-18'),
('789-01-2345', 'TUV123', '2023-05-20'),
('890-12-3456', 'WXY456', '2023-06-22'),
('901-23-4567', 'ZAB789', '2023-07-31'),
('012-34-5678', 'CDE123', '2023-08-15');



INSERT INTO Maintain (ServiceId, EmpSsn, RegNum)
VALUES 
   (1, '123-45-6789', 'ABC123'),
   (2, '234-56-7890', 'DEF456'),
   (3, '345-67-8901', 'GHI789'),
   (4, '456-78-9012', 'JKL012'),
   (5, '567-89-0123', 'MNO345'),
   (6, '678-90-1234', 'PQR678'),
   (7, '789-01-2345', 'STU901'),
   (8, '890-12-3456', 'VWX234'),
   (9, '901-23-4567', 'YZA567'),
   (10, '012-34-5678', 'BCD890'),
   (11, '123-45-6789', 'EFG123'),
   (12, '234-56-7890', 'HIJ456'),
   (13, '345-67-8901', 'KLM789'),
   (14, '456-78-9012', 'NOP012'),
   (15, '567-89-0123', 'QRS345'),
   (16, '678-90-1234', 'TUV678'),
   (17, '789-01-2345', 'WXY901'),
   (18, '890-12-3456', 'ZAB234'),
   (19, '901-23-4567', 'CDE567'),
   (20, '012-34-5678', 'FGH890');

   SELECT * FROM Airplane;

   
INSERT INTO Airplane(RegNum, OfType, StoredIn)
VALUES 
   ('A001', 'PT001', 1),
   ('A002', 'PT002', 2),
   ('A003', 'PT003', 3),
   ('A004', 'PT004', 4),
   ('A005', 'PT005', 5),
   ('A006', 'PT006', 6),
   ('A007', 'PT007', 7),
   ('A008', 'PT008', 8),
   ('A009', 'PT009', 9),
   ('A010', 'PT010', 10),
   ('A011', 'PT011', 11),
   ('A012', 'PT012', 12),
   ('A013', 'PT013', 13),
   ('A014', 'PT014', 14),
   ('A015', 'PT015', 15),
   ('A016', 'PT016', 16),
   ('A017', 'PT017', 17),
   ('A018', 'PT018', 18),
   ('A019', 'PT019', 19),
   ('A020', 'PT020', 20);