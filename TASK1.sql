--creating a StudentManagement database
create database StudentManagement;
--using StudentManagement database
use StudentManagement;

--creating a table called Students
create table Students(
StudentID int auto_increment primary key,
Name varchar(50),
Gender varchar(1) check (Gender in ('M','F')),
Age int,
Grade varchar(10),
MathScore int,
ScienceScore int,
EnglishScore int
);

--inserting values to the Students table
insert into Students (Name,Gender,Age,Grade,MathScore,ScienceScore,EnglishScore) values
('Ramesh','M',19,'A',90,85,84),
('Bhavya','F',20,'B',75,79,80),
('Swathi','F',20,'C',60,65,62),
('Suresh','M',22,'E',42,45,49),
('Kittu','M',21,'A',95,95,95),
('Roshini','F',19,'C',50,55,54),
('Prajitha','F',20,'E',47,41,40),
('Ramu','M',21,'C',73,76,75),
('Gopi','M',20,'D',45,50,52),
('Prasanthi','F',19,'D',35,52,53);

--Retriving the data from the Students table
select * from Students;

--Retriving the Averages of MathScore,ScienceScore,EnglishScore from the Students table
select avg(MathScore) as MathAverage, 
       avg(ScienceScore) as ScienceAverage, 
       avg(EnglishScore) as EnglishAverage 
from Students;

--Retriving the highest performer from the Students table
select Name,(MathScore + EnglishScore + ScienceScore) as TotalScore from Students
order by TotalScore
limit 1;

--Retriving the count of the number of student based on the Grade
select Grade , count(*) as no_of_students from Students
group by Grade
order by Grade;

--Retriving the average scores in Math,Science,English and TotalScore based on the Gender 
select Gender , avg(MathScore) as MathAverage, 
       avg(ScienceScore) as ScienceAverage, 
       avg(EnglishScore) as EnglishAverage,
       avg((MathScore + EnglishScore + ScienceScore)/3) as TotalAverage from Students 
group by Gender;

--Retriving the students name who scored more than 80 marks in maths
select Name,MathScore from Students
where MathScore > 80;

select * from Students where Name = 'Gopi';

--updating a student name Gopi math score to 65
update Students set MathScore = 65 where Name = 'Gopi';

--reflecting the update operation performed above
select * from Students where Name = 'Gopi';


