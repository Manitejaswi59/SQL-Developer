-- Creating a Students table
create table Students(
StudentId int auto_increment primary key,
Name varchar(30));

-- Inserting data into Students table
insert into Students (Name) values
('Srilakshmi'),
('Ramu'),
('Sitha'),
('Rajesh'),
('Sobitha'),
('Sameer'),
('Ashwin'),
('Poorni'),
('Sivaji'),
('Sundari');

-- Displaying the contents of Students table
select * from Students;

-- Creating a Scores table
create table Scores(
StudentId int auto_increment,
Subject varchar(50),
Score int ,
foreign key(StudentId) references Students(StudentId));

-- Inserting data into Scores table
insert into Scores (Subject,Score) values
('Mathematics',99),
('Physics',30),
('Chemistry',70),
('Mathematics',86),
('Computer Networks',98),
('Operating System',94),
('Computer Graphics',69),
('Artificial intelligence',32),
('Machine Learning',87),
('Chemistry',26);

-- Displaying the contents of Scores table
select * from Scores;

-- Creating a Student_Scores view that show student details including the Scores
create view Student_Scores as 
select s.StudentId,s.Name,sc.Subject,sc.Score
from Students s 
join Scores sc on s.StudentId = sc.StudentId;

-- Displaying the contents of Student_Scores
select * from Student_Scores;

-- Creating a Passed_Students view to show the student that scores greater than 40
create view Passed_Students as
select StudentId,Name 
from Students
where StudentId not in
(select StudentId from Scores where Score < 40);

-- Displaying the contents of the Passed_Students
select * from Passed_Students;
