JOINS

create database join_sql

use join_sql

show tables
Customers: CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country
Orders: OrderID, CustomerID, EmployeeID, OrderDate, ShipperID


create table customers
(
CustomerID int not null,
CustomerName varchar(100),
ContactName varchar(100),
Address varchar(100),
City varchar(100),
PostalCode varchar(10),
Country varchar(20),
primary key (CustomerID)
)


create table Orders
(
OrderID int not null,
CustomerID int,
EmployeeID int,
OrderDate datetime,
ShipperID int,
primary key (OrderID)
)

INSERT INTO customers values (1,'Hiten','Hiten','Hong Kong','Hong Kong','000000','Hong Kong SAR');
INSERT INTO customers values (2,'Ravi','Ravi','Mumbai','Mumbai','000000','INDIA');
INSERT INTO customers values (3,'James','James','Delhi','Delhi','000000','INDIA');
INSERT INTO customers values (4,'Karan','Karan','Delhi','Delhi','000000','INDIA');
INSERT INTO customers values (5,'Hardeep','Hardeep','Pune','Pune','000000','INDIA');
INSERT INTO customers values (6,'Varun','Varun','Jaipur','Jaipur','000000','INDIA');
INSERT INTO customers values (7,'Manav','Manav','Nepal','Nepal','000000','INDIA');
INSERT INTO customers values (8,'Akshay','Akshay','Delhi','Delhi','000000','INDIA');
INSERT INTO customers values (9,'Sagar','Sagar','Himachal','Himachal','000000','INDIA');
INSERT INTO customers values (10,'Shubham','Shubham','Qatar','Qatar','000000','INDIA');

select * from customers

INSERT INTO Orders values (901,1,1,sysdate(),928601);
INSERT INTO Orders values (902,4,4,sysdate()-10,928701);
INSERT INTO Orders values (903,3,3,sysdate()-20,928801);
INSERT INTO Orders values (904,5,5,sysdate()-30,928301);
INSERT INTO Orders values (905,6,6,sysdate()-40,928401);
INSERT INTO Orders values (906,11,11,sysdate()-20,938401);

select * from Orders

select * from customers c
left join Orders o
ON c.customerID = o.customerID

select c.customerID, c.customerName, c.country, o.orderID, o.orderdate from customers c
left join Orders o
ON c.customerID = o.customerID

select o.customerID, c.customerName, c.country, o.orderID, o.orderdate from customers c
right join Orders o
ON c.customerID = o.customerID

select o.customerID, c.customerName, c.country, o.orderID, o.orderdate from customers c
inner join Orders o
ON c.customerID = o.customerID

#other way of inner join
select o.customerID, c.customerName, c.country, o.orderID, o.orderdate
from customers c, Orders o
Where c.customerID = o.customerID


#full outer join

select o.customerID, c.customerName, c.country, o.orderID, o.orderdate from customers c
Left outer join Orders o
ON c.customerID = o.customerID
Union
select o.customerID, c.customerName, c.country, o.orderID, o.orderdate from customers c
right outer join Orders o
ON c.customerID = o.customerID





