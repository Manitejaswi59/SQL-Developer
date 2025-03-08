--Creation of a Students table
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

--Inserting values to the Students table
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

--Displaying the Student table data
select * from Students;

--Retriving the Top 5 TotalScorers
select Name , (MathScore+ScienceScore+EnglishScore) as TotalScore 
from Students
order by TotalScore desc
limit 5;

--Calculating the average of MathScore who scored greater than 70
select avg(MathScore) as AvgMathScore , count(*) as StudentCount
from Students
where MathScore > 70;

--Calculating the average of the TotalScores who are in range 200-250
select avg((MathScore+ScienceScore+EnglishScore)) as average_total_score , count(*) as StudentCount
from Students
where MathScore+ScienceScore+EnglishScore between 200 and 250;

--Determining the 2nd Highest MathScore
select max(MathScore) as Second_highest_MathScore 
from Students
where  MathScore < (select max(MathScore) from Students);