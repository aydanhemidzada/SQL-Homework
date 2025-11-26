CREATE DATABASE SchoolDB

CREATE TABLE Students(
StudentsID int PRIMARY KEY Identity(1,1),
FullName nvarchar(100) NOT NULL,
Age int ,
Email varchar(30) UNIQUE,
Score int DEFAULT(0),
CHECK(Age BETWEEN 6 AND 20),
CHECK(Score BETWEEN 0 AND 100)
)
	
INSERT INTO Students
VALUES ('Aytac Elekberova',9,'aytac@gmail.com',88),
('Fatima Aliyeva',19,'fatima@gmail.com',73),
('Fatime Memmedli',12,'fmemmedli@gmail.com',96),
('Tural Quluzade',6,'tural@gmail.com',51),
('Christian Bale',18,'chris@gmail.com',99)


ALTER TABLE Students
ADD Class nvarchar(10)


UPDATE Students Set Email='fmemmedli236@gmail.com'
WHERE FullName='Fatime Memmedli'

UPDATE Students SET Email='chrisbale1@gmail.com'
WHERE FullName='Christian Bale'


DELETE FROM Students
WHERE Age<10


ALTER TABLE Students
ADD CONSTRAINT CheckSore5 CHECK(Score%5=0)

UPDATE Students SET Score=95
WHERE Age=19
Update Students SET Score=90
WHERE Age=12
Update Students Set Score=85
WHERE Age=18

CREATE TABLE TopStudents(
TopStudentsID int PRIMARY KEY,
FullName nvarchar(50),
Score int
)

INSERT INTO TopStudents (TopStudentsID,FullName,Score)
Select StudentsID,FullName,Score from Students
WHERE Score >= 90
 
select * from TopStudents

select * from Students
