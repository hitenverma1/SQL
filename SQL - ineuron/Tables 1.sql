create database company;
use  company;

##create Employee Table

create table Employee(
empid int Not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department_name varchar(25)
);

##check the schema
desc Employee;

##create Bonus Table
Create table bonus(
emp_ref_id int,
bonus_amt int,
bonus_date datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete cascade
);

##create Employee Designation table
Create table designation(
emp_ref_id int,
designation varchar(25),
desigantion_date datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete cascade
);

insert into Employee values
(0001,'Hiten','Verma',60000,'18-12-11 09:00:00','Data Scientist'),
(0002,'Savan','Kumar',38000,'18-12-19 09:00:00','Python Head'),
(0003,'Dilip','Gupta',56000,'15-11-28 09:00:00','Programmer'),
(0004,'Virat','Dhaman',64800,'20-04-06 09:00:00','Developer'),
(0005,'Gautam','Gogia',49600,'16-06-21 09:00:00','Accountant'),
(0006,'Jonty','Verma',78600,'21-08-11 09:00:00','Data Analyst');

select * from Employee;

insert into bonus values
(0001,5100,'16-03-12'),
(0001,5000,'17-03-18'),
(0002,4200,'19-04-14'),
(0003,3200,'19-07-30'),
(0001,6500,'21-08-13'),
(0004,8700,'21-06-22'),
(0005,5500,'21-05-12'),
(0006,2100,'17-01-11');

select count(*) from bonus;

insert into designation values
(0001,'Manager','2020-02-11 00:00:00'),
(0002,'Web Developer','2020-01-20 00:00:00'),
(0003,'Executive','2020-12-22 00:00:00');

select * from designation;
