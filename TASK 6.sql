-- Create a Employee table
create table Employee(
  EmployeeId int auto_increment primary key,
  Name varchar(50),
  Department varchar(50),
  Salary decimal(7,2)
);

-- Insert the sample data int the Employee table
insert into Employee (Name,Department,Salary) values 
('Niraja','Developer',85300),
('Ram','HR',50000),
('Srinu','Network Administrator',65000),
('Venumani','R&D',90000),
('Sujitha','Business analyst',83000),
('Ravi','AI scientist',85000),
('Susrutha','HR',64000),
('Ajay','Developer',86000);

-- Displaying the contents of the Employee table
select * from Employee;

-- Altering the table by adding a Lastupdated column
Alter table Employee add LastUpdated DATE default (curdate());
describe Employee;

-- Altering the Employee table by adding a Status column
alter table Employee add Status varchar(15) default 'Inactive';
describe Employee;

-- Updating the Employee table 
update Employee set Status = 'Active' where EmployeeId % 3 <> 0;
select * from Employee;

-- Deleting the records of the Employees that are Inactive
Delete from Employee where Status = 'Inactive';
select * from Employee;

-- Deleting the records of the Employee that have LastUpdated not today
Delete from Employee where LastUpdated < curdate();
select * from Employee;


