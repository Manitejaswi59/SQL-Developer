-- Creation of Students table
create table Students(
  StudentId int auto_increment primary key,
  Name varchar(50) not null,
  MathScore int,
  TotalScore int
);

-- Insertion of values to Students table
insert into Students (Name,MathScore,TotalScore) values
("Roshini",82,550),
("Peter",55,326),
("Ramesh",96,590),
("Tejaswi",100,500),
("Naveen",26,450),
("Swathi",49,460),
("Kamesh",87,458),
("Rama",69,559),
("Anamika",25,250),
("Paranjyothi",56,400);

-- Displaying the contents of the Students table
select * from Students;

-- Ranking the Students based on TotalScore
select Name,RANK() OVER (order BY TotalScore DESC) as RankNo
from Students;

-- Calculating the running total for MathScore
select Name,MathScore,sum(MathScore) OVER (order by  StudentId) as CumulativeTotal
from Students;