create database intro_sql
use intro_sql

create table emp_info
(
first_name varchar(20),
last_name varchar(20),
id int not null,
age int,
city varchar(20),
state varchar(20),
primary key (id)
)

insert into emp_info values ('hiten','verma',456789,25,'Delhi','New Delhi')

select * from emp_info


create table emp_exercise
(
emp_name varchar(50),
designation varchar(50),
age int,
salary float
)

insert into emp_exercise values ('Jonie Weber' , 'Secretary', 28, 19500.00)
insert into emp_exercise values ('Potsy Weber' , 'Programmer', 32, 45300.00)
insert into emp_exercise values ('Drik Smith' , 'Programmer II', 45, 75020.00)

select * from emp_exercise

insert into emp_exercise values ('Hiten Verma' , 'Data Scientist', 25, 89500.00);
insert into emp_exercise values ('Rahul Sharma' , 'Data Analyst', 35, 65300.00);
insert into emp_exercise values ('Divya Rao' , 'Web Developer', 25, 71020.00);
insert into emp_exercise values ('Jonty Ed' , 'Database Manager', 26, 45500.00);
insert into emp_exercise values ('Gautam Yadav' , 'CA', 31, 41300.00);

select * from emp_exercise

select * from emp_exercise
where salary > 30000

select emp_name from emp_exercise
where age < 30

select emp_name, salary from emp_exercise
where designation = 'programmer'

select * from emp_exercise
where emp_name like '%ebe%'

select * from emp_exercise
where emp_name like 'Potsy%'

select * from emp_exercise
where age > 80;

select * from emp_exercise
where emp_name like '%ith%'

select * from emp_exercise
where emp_name like 'jo%'

select * from emp_exercise

set SQL_SAFE_UPDATES = 0;

update emp_exercise set designation = 'ML Engineer' where designation = 'CA'

update emp_exercise set emp_name = 'Weber-Williams' where emp_name = 'Jonie Weber'

update emp_exercise set age = age+1 where emp_name = 'Drik Smith'

update emp_exercise set designation = 'Administrative Assistant' where designation = 'Secretary'

update emp_exercise set salary = salary+3500 where salary < 30000;

update emp_exercise set salary = salary+4500 where salary > 33500;

update emp_exercise set designation = 'Programmer II' where designation = 'Programmer III';
update emp_exercise set designation = 'Programmer' where designation = 'Programmer II';

select * from emp_exercise

delete from emp_exercise where designation = 'Database Manager';