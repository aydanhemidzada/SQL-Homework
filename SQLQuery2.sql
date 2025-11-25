create database EmployeeDB

create table Regions(
RegionId int,
RegionName nvarchar(25)
)

create table Countries(
CountryId char(2),
CountryName nvarchar(40),
RegionId int
)

create table Locations(
LocationId int,
StreetAddress nvarchar(25),
PostalCode nvarchar(12),
City nvarchar(30),
StateProvince nvarchar(12),
CountryId char(2)
)

create table Departments(
DepartmentId int,
DepartmentName nvarchar(30),
MnagerId int,
LocationId int
)

create table Employees(
EmployeeId int,
FirstName nvarchar(20),
LastName nvarchar(25),
Email nvarchar(25),
PhoneNumber nvarchar(20),
HireDate date,
JobId nvarchar(10),
Salary int,
CommissionPct int,
ManagerId int,
DepartmentId int
)

create table Jobs(
JobId nvarchar(10),
JobTitle nvarchar(35),
MinSalary int,
MaxSalary int
)

create table Job_History(
EmployeeId int,
StartDate date,
EndDate date,
JobId nvarchar(10),
DepartmentId int
)

create table Job_Grades(
GradeLevel nvarchar(2),
LowestSal int,
HighestSal int
)

