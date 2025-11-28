CREATE DATABASE CountryDB

CREATE TABLE Countries(
ID INT PRIMARY  KEY IDENTITY(1,1),
Name NVARCHAR(30),
Aera DECIMAL,
Population INT
)

CREATE TABLE Cities(
ID INT PRIMARY  KEY IDENTITY(1,1),
Name NVARCHAR(30),
Aera DECIMAL,
Population DECIMAL,
CountryID INT FOREIGN KEY REFERENCES Countries(ID)
)


INSERT INTO Countries VALUES
('Azerbaijan',86600,10224889),
('Sweden',447000,10600000),
('Slovakia',49000,5700000),
('France',543941,66650000),
('Italy',301340,589000000)


INSERT INTO Cities VALUES
('Baku',2140,2300000,1),
('Stockholm',118,975000,2),
('Bratislava',367,430000,3),
('Kosice',242,240000,3),
('Paris',105,2160000,4),
('Marseille',240,870000,4),
('Rome',1285,2870000,5),
('Milan',181,1400000,5)


select * from Cities as Cs
INNER JOIN Countries as Ct ON Cs.CountryID=Ct.ID

select * from Cities as Cs
RIGHT JOIN Countries as Ct ON Cs.CountryID=Ct.ID

select * from Cities as Cs
LEFT JOIN Countries as Ct ON Cs.CountryID=Ct.ID

select Cs.Name 'CityName', Cs.Aera 'CityAera', Ct.Name'CountryName', Ct.Aera 'CountryAera' from Cities as Cs
FULL JOIN Countries as Ct ON Cs.CountryID=Ct.ID

