use company;

show tables;


##1. Write an sql query too retreive all details where first name from employee table which starts with 'v'
Select * from employee
where first_name like 'h%';


##2. write an sql query to print employees full name and salary from employee table whose slaray between 25000 to 60000
Select concat(first_name,' ' ,last_name) as full_name, salary  from employee
where salary between 25000 and 60000;


##3. SQL query to retrieve details of the employees who have joined in DEC 2018 
Select * from employee
where year(joining_date) = 2018 and month(joining_date) = 12;


##4. Sql query to fetch number of employees in every department
Select count(*),department_name from employee
group by department_name;


##5. SQL query to print details of the employee who are also Executives
select first_name, designation from designation
inner join employee
on employee.empid = designation.emp_ref_id
where designation = 'Executive';

##6. SQL query to clone a new table from another table
create table clone_employee like employee;
desc clone_employee;


##7. SQL query to show top n salary of employees
select * from employee
order by salary desc 
limit 4;


##8. SQL query to determine the 4th highest salary
select first_name, salary from employee order by salary desc limit 3,1;


##9. SQL query to determine the 5th highest salary using limit
select first_name, salary from 
(select first_name, salary from employee
order by salary desc limit 5) as emp
order by salary asc limit 1;

