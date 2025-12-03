CREATE DATABASE ComputerSToreDB

CREATE TABLE Categories(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100),
)

INSERT INTO Categories VALUES
('Laptop'),
('Klaviatura'),
('Mouse')


CREATE TABLE Products(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(80),
Marka NVARCHAR(100),
Model NVARCHAR(100),
Price DECIMAL,
CategoryID INT FOREIGN KEY REFERENCES Categories(ID)
)

INSERT INTO Products VALUES 
('Lenovo Ideapad 3', 'Lenovo', 'Ideapad 3', 1350, 1),
('HP Pavilion 15', 'HP', 'Pavilion 15', 1750, 1),
('Asus VivoBook 14', 'Asus', 'VivoBook 14', 1550, 1),

('Logitech K120', 'Logitech', 'K120', 30, 2),
('A4Tech KL-7', 'A4Tech', 'KL-7', 25, 2),
('Razer BlackWidow', 'Razer', 'BlackWidow V3', 150, 2),

('Logitech M185', 'Logitech', 'M185', 25, 3),
('Razer DeathAdder', 'Razer', 'DeathAdder V2', 95, 3),
('HP X1000', 'HP', 'X1000', 18, 3)




CREATE TABLE EMPLOYEES(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(80),
Surname NVARCHAR(100),
FatherName NVARCHAR(100),
Age INT,
Salary DECIMAL,
BranchID  INT FOREIGN KEY REFERENCES Branches(ID)
)

INSERT INTO EMPLOYEES VALUES
('Murad', '?liyev', 'Rasim', 29 ,2000, 1),
('Aydan', 'Quliyeva', '?li', 21, 1500, 1),
('Fatima', 'Eliyeva', 'Shain', 21, 1450, 1),
('Kamran', 'Rzayev', 'Zaur', 23, 1000, 2),
('Leyla', 'Hüseynova', 'El?ad', 25, 850, 3)



CREATE TABLE Branches(
ID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100)
)

INSERT INTO Branches VALUES
('Neftciler'),
('28 May'),
('Ehmedli'),
('Genclik')


CREATE TABLE Sales(
ID INT PRIMARY KEY IDENTITY,
EmployeeID INT FOREIGN KEY REFERENCES Employees(ID),
ProductID INT FOREIGN KEY REFERENCES Products(ID),
Quantity INT,
SaleDate DATE
)

INSERT INTO Sales VALUES
(1, 4, 1, '12/05/2025'),
(1, 7, 4, '12/05/2025'),
(3, 2, 2, '12/04/2025'),
(5, 8, 3, '12/04/2025'),
(2, 2, 2, '12/03/2025'),
(3, 5, 1, '12/03/2025'),
(2, 4, 2, '12/03/2025'),
(4, 7, 4, '12/02/2025'),
(5, 6, 1, '12/01/2025'),
(3, 8, 2, '12/01/2025'),
(2, 3, 1, '12/25/2025'),
(4, 2, 1, '12/25/2025'),
(2, 6, 2, '11/24/2025'),
(3, 5, 2, '11/23/2025'),
(2, 2, 3, '11/23/2025'),
(5, 9, 5, '11/20/2025'),
(1, 8, 2, '11/20/2025')


SELECT * FROM Products --1

SELECT * FROM EMPLOYEES --2

SELECT * FROM EMPLOYEES WHERE Name='Murad' --4

select P.Name'Mehsul', C.Name'Kateqoriya' from Products P
JOIN Categories C ON P.CategoryID=C.ID --3

SELECT E.Name, E.Surname, E.FatherName, E.Age, E.Salary, B.Name FROM EMPLOYEES E
join Branches B on E.BranchID=B.ID
WHERE Age<25 --5

SELECT P.Model'Model adi', COUNT(C.ID) FROM Products P
JOIN Categories C ON P.CategoryID=C.ID
GROUP BY P.Model --6 

SELECT C.Name'Kateqoiya adi', COUNT(P.ID) FROM Categories C
JOIN Products P  ON P.CategoryID=C.ID
GROUP BY C.Name--7


SELECT TOP 1 P.Model, SUM(S.Quantity) AS TotalSold FROM Sales S
JOIN Products P ON S.ProductID = P.ID
WHERE MONTH(S.SaleDate) = 12
GROUP BY P.Model
ORDER BY TotalSold DESC --9

SELECT b.Name AS BranchName,SUM(s.Quantity) AS MonthlyAmount
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.ID
JOIN Branches b ON e.BranchID = b.ID
WHERE MONTH(s.SaleDate) = 12
GROUP BY b.Name --8


SELECT TOP 1 E.Name, E.Surname, SUM(S.Quantity) AS TotalSales FROM Employees E
LEFT JOIN Sales S ON E.ID = S.EmployeeID 
AND MONTH(S.SaleDate) = 12
GROUP BY E.Name, E.Surname
ORDER BY TotalSales ASC --10

SELECT E.Name, E.Surname, SUM(S.Quantity * P.Price) AS TotalAmount FROM Sales S
JOIN Employees E ON S.EmployeeID = E.ID
JOIN Products P ON S.ProductID = P.ID
WHERE MONTH(S.SaleDate) = 12
GROUP BY E.Name, E.Surname
HAVING SUM(S.Quantity * P.Price) > 3000 --11

SELECT [Name] + ' ' + Surname+' '+ FatherName as Fullname From EMPLOYEES --12

SELECT Name, LEN(NAME) FROM Products --13


SELECT TOP 1 * FROM Products
ORDER BY Price DESC --14

SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products) OR Price = (SELECT MIN(Price) FROM Products) --15

SELECT Name, Price,
CASE 
WHEN Price < 1000 THEN 'Münasib'
WHEN Price BETWEEN 1000 AND 2500 THEN 'Orta qiymetli'
ELSE 'Baha'
END AS PriceCategory
FROM Products


SELECT SUM(S.Quantity * P.Price) AS TotalAmount FROM Sales S
JOIN Products P ON S.ProductID = P.ID
WHERE MONTH(S.SaleDate) = 12 --17


SELECT TOP 1 E.*, SUM(S.Quantity) AS TotalSold FROM Sales S
JOIN Employees E ON S.EmployeeID = E.ID
WHERE MONTH(S.SaleDate) = 12
GROUP BY E.ID, E.Name, E.Surname, E.FatherName, E.Age, E.Salary, E.BranchID
ORDER BY TotalSold DESC --18

SELECT TOP 1 E.*, SUM(S.Quantity * P.Price) AS TotalIncome FROM Sales S
JOIN Employees E ON S.EmployeeID = E.ID
JOIN Products P ON S.ProductID = P.ID
WHERE MONTH(S.SaleDate) = 12
GROUP BY E.ID, E.Name, E.Surname, E.FatherName, E.Age, E.Salary, E.BranchID
ORDER BY TotalIncome DESC --19

UPDATE EMPLOYEES SET Salary = Salary * 1.5
WHERE ID = (SELECT TOP 1 EmployeeID FROM Sales
WHERE MONTH(SaleDate) = 12
GROUP BY EmployeeID
ORDER BY SUM(Quantity) DESC) --20







