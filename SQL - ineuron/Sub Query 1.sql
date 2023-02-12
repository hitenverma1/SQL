use intro_sql;

show tables

create table emp_sal
(
emp_id int ,
first_name varchar(50),
last_name varchar (50),
country varchar (20),
salary int
);

insert into emp_sal values (1,'hiten','verma','india',78000);
insert into emp_sal values (2,'deepak','sharma','india',45000);
insert into emp_sal values (3,'gautam','gulati','india',64000);
insert into emp_sal values (4,'raghu','gupta','india',91000);
insert into emp_sal values (5,'rahul','sharma','india',63000);

select * from emp_sal;

-- salary greater than average salary

select * from emp_sal
where salary > (select avg(salary) from emp_sal)

-- second highest salary

select first_name, last_name, salary
from (select * from emp_sal
order by salary desc
limit 2) as emp
order by salary asc
limit 1;


select * from emp_sal
order by salary desc



