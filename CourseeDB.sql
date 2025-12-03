CREATE DATABASE CourseDB

CREATE TABLE  Trainers(
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50),
Surname NVARCHAR(60),
FatherName NVARCHAR(50),
FIN NVARCHAR(20),
PHONE INT,
Birth DATE,
Profession NVARCHAR(50),
Experience INT,
Status NVARCHAR(40)
)

INSERT INTO Trainers VALUES
('Araz', 'Mammadov', 'Ilham', 'ABC1234', 501234567, '1990-05-10', 'Full Stack Developer', 5, 'Active'),
('Lala', 'Aliyeva', 'Rashid', 'DEF5678', 507654321, '1995-08-20', 'Backend Developer', 3, 'Active')

CREATE TABLE Packages(
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50),
Price DECIMAL,
Duration INT
)

INSERT INTO Packages VALUES
('Full Stack', 1500.00, 6),
('Backend', 1000.00, 4),
('Frontend', 900.00, 4)

CREATE TABLE Departments(
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50)
)

INSERT INTO Departments VALUES
('IT'),
('Design')


CREATE TABLE [Subjects](
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50)
)

INSERT INTO Subjects VALUES
('HTML'),
('C#'),
('SQL')


CREATE TABLE Students(
ID INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50),
Surname NVARCHAR(60),
FatherName NVARCHAR(50),
FIN NVARCHAR(20),
University NVARCHAR(50),
Major NVARCHAR(30),
Year INT,
Address NVARCHAR(200),
Phone INT,
Gmail NVARCHAR(30)
)

INSERT INTO Students VALUES
('Nigar', 'Huseynova', 'Kamran', 'FIN001', 'BDU', 'Computer Science', 3, 'Baku', 501112233, 'nigar@gmail.com'),
('Elvin', 'Aliyev', 'Rauf', 'FIN002', 'ADNSU', 'IT', 2, 'Ganja', 501223344, 'elvin@gmail.com'),
('Aysel', 'Mammadova', 'Fikret', 'FIN003', 'ADNA', 'Software', 1, 'Sumgait', 501334455, 'aysel@gmail.com')


CREATE TABLE Registrations(
ID INT PRIMARY KEY IDENTITY(1,1),
StudentID INT FOREIGN KEY REFERENCES Students(ID),
PackageID INT FOREIGN KEY REFERENCES Packages(ID),
ContractDate DATE,       
Discount DECIMAL,  
Status NVARCHAR(50),
Trainer INT FOREIGN KEY REFERENCES Trainers(ID)
)
 
INSERT INTO Registrations VALUES
(1, 1, '2025-01-01', 100.00, 'Active', 1), 
(2, 1, '2025-02-01', 50.00, 'Active', 1),  
(3, 2, '2025-03-01', 0.00, 'Active', 2)   


CREATE TABLE Payments(
ID INT PRIMARY KEY IDENTITY(1,1),
Registration INT FOREIGN KEY REFERENCES Registrations(ID),
PaymentDate DATE,      
Amount DECIMAL
)

INSERT INTO Payments VALUES
(1, '2025-01-10', 500.00),
(1, '2025-02-10', 500.00),
(2, '2025-02-15', 700.00),
(3, '2025-03-20', 1000.00)

--1
SELECT COUNT(*) AS FULLSTACKSTUDENTS FROM Registrations R
JOIN Packages P ON R.PackageID=P.ID
WHERE P.Name = 'Full Stack'

--2
SELECT YEAR(PaymentDate) AS ?l, MONTH(PaymentDate) AS Ay, SUM(Amount) AS AyliqOdenis FROM Payments
GROUP BY YEAR(PaymentDate), MONTH(PaymentDate)
ORDER BY YEAR(PaymentDate), MONTH(PaymentDate)

--3
SELECT S.Name,S.Surname, R.ContractDate , DATEADD(MONTH, 1, R.ContractDate) , DATEDIFF(DAY, GETDATE(), DATEADD(MONTH, 1, R.ContractDate)) FROM Registrations R 
JOIN Students S ON R.StudentID=S.ID
WHERE DATEDIFF(DAY, GETDATE(), DATEADD(MONTH, 1, R.ContractDate))=3

--4
SELECT S.Name,S.Surname, R.ContractDate , DATEADD(MONTH, 1, R.ContractDate) , DATEDIFF(DAY, GETDATE(), DATEADD(MONTH, 1, R.ContractDate)) FROM Registrations R 
JOIN Students S ON R.StudentID=S.ID
WHERE DATEADD(MONTH, 1, R.ContractDate)<GETDATE()

--5







