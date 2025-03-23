-- Creating a StudentScores table
create table StudentScores
(
  StudentId int auto_increment primary key,
  MathScore int,
  ScienceScore int,
  TotalScore int generated always as (MathScore+ScienceScore) stored
);

-- inserting values into StudentScores table
insert into StudentScores (MathScore,ScienceScore) values
(40,46),
(25,26),
(36,50),
(45,46),
(50,50),
(20,10),
(36,48),
(50,30),
(48,36),
(49,12),
(50,48),
(39,19);

-- Displaying the contents of the StudentScores table
select StudentId,TotalScore,MathScore,ScienceScore from StudentScores;

-- Displaying the grades of the students based on their TotalScore
select StudentId,TotalScore,
  case 
    when TotalScore >= 90 then 'A'
    when TotalScore >= 80 then 'B'
    when TotalScore >= 70 then 'C'
    else 'D (FAIL)'
  end as Grade
from StudentScores;

-- Displaying the each subject pass/fail status based on their marks
select StudentId,MathScore,
  case 
    when MathScore >= 40 then 'PASS'
    else 'FAIL'
  end as MathScoreStatus,
  ScienceScore,
  case
    when ScienceScore >= 40 then 'PASS'
    else 'FAIL'
  end as ScienceScoreStatus
from StudentScores