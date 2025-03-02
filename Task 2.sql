-- Creation of students table
create table Students(
StudentID int auto_increment primary key,
Name varchar(50),
Gender varchar(1) check (Gender in ('M','F')),
Age int,
Grade varchar(10),
email varchar(20)
);

--insertion of values into Student table
insert into Students (Name,Gender,Age,Grade,email) values
('Ramesh','M',19,'A','ramesh@gmail.com'),
('Bhavya','F',20,'B','bhavya12@gmail.com'),
('Swathi','F',20,'C','swathi45@gamil.com'),
('Suresh','M',22,'E','suresh89@gamil.com'),
('Kittu','M',21,'A','kittu@gmail.com');

--Retreving the details from student table
select * from Students;

--creation of Course table
create table Courses(
course_id int PRIMARY KEY,
course_name varchar(20),
course_description text
);

--insertion of values into Courses table
insert into Courses(course_id,course_name,course_description) values
(1, 'Web ', 'Learn HTML, CSS, JS'),
(2, 'Python ', 'Intro to Python'),
(3, 'Database ', 'Learn SQL basics'),
(4, 'ML', 'ML algorithms & Python'),
(5, 'Cybersecurity', 'Online security & crypto');

--Retriving the details from course table
select  * from Courses;

--creation of the enrollment table
create table Enrollments(
enrollment_id int auto_increment PRIMARY KEY ,
studentID int ,
course_id int,
enrollment_date date,
foreign key (studentID) references Students(studentID) ON DELETE cascade,
foreign key (course_id) references Courses(course_id) on DELETE cascade
);

--insertion of values into enrollment table
insert into Enrollments (studentID,course_id,enrollment_date) values
(1, 1, '2025-02-01'),
(2, 3, '2025-02-05'),
(3, 2, '2025-02-10'),
(3, 5, '2025-02-13'),
(4, 5, '2025-02-15'),
(5, 5, '2025-02-20'),
(1, 2, '2025-02-25');

--Retriving data from enrollments table
select * from Enrollments;
 
--Retriving the list of all students and the courses they are enrolled in 
select s.Name as Student_name , c.course_name as Course_name 
from Students s  
inner join Enrollments e on e.studentID = s.StudentID 
inner join Courses c on e.course_id = c.course_id;  

--Retriving the number of students enrolled int each course
select c.course_name,count(e.enrollment_id) as no_of_students 
from Courses c  
left join Enrollments e on e.course_id = c.course_id
group by c.Course_name;

--Retriving the name of students that are enrolled in more than 1 course
select s.Name as Student_name 
from Students S
inner join Enrollments e on e.StudentID = s.StudentID
group by s.Name
having count(e.course_id) > 1;

-- Retriving the course that no one is enrolled
select c.course_name 
from Courses C
left join Enrollments e on e.course_id = c.course_id
where e.enrollment_id is null;