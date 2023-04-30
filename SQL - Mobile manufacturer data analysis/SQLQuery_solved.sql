--1. List all the states in which we have customers who have bought cellphones from 2005 till today.
select State from DIM_LOCATION d
inner join FACT_TRANSACTIONS f
on d.IDLocation = f.IDLocation
where year(f.Date) >= 2005 


--2. What state in the US is buying the most 'Samsung' cell phones? 
select top 1 dl.state, sum(f.Quantity) qn
from FACT_TRANSACTIONS f
join DIM_MODEL dmo
on f.IDModel = dmo.IDModel
join DIM_LOCATION dl
on dl.IDLocation = f.IDLocation
join DIM_MANUFACTURER dma
on dma.IDManufacturer = dmo.IDManufacturer
where dl.Country = 'US' and dma.Manufacturer_Name = 'Samsung'
group by dl.State
order by sum(f.Quantity) desc



--3. Show the number of transactions for each model per zip code per state
select f.IDModel, COUNT(f.IDModel) as no_of_transaction, dl.ZipCode, dl.State
from FACT_TRANSACTIONS f
join DIM_MODEL dmo
on f.IDModel = dmo.IDModel
join DIM_LOCATION dl
on dl.IDLocation = f.IDLocation
group by  dl.ZipCode, dl.State, f.IDModel
order by  dl.ZipCode, dl.State, f.IDModel


--4. Show the cheapest cellphone (Output should contain the price also)
select top 1 * from DIM_MODEL
order by Unit_price


--5. Find out the average price for each model in the top5 manufacturers in terms of sales quantity and order by average price.
select IDModel, avrg_price from (
select *,DENSE_RANK() over(order by quantity desc) as rnk from
(select f.IDModel, sum(f.Quantity) as quantity, avg(f.TotalPrice) as avrg_price
from FACT_TRANSACTIONS f
join DIM_MODEL dmo
on f.IDModel = dmo.IDModel
join DIM_MANUFACTURER dma
on dma.IDManufacturer = dmo.IDManufacturer
group by f.IDModel) as t1
) as s
where rnk < 6
order by avrg_price


--6. List the names of the customers and the average amount spent in 2009, where the average is higher than 500 
select dmc.Customer_Name, AVG(f.TotalPrice) as avg_price
from FACT_TRANSACTIONS f
join DIM_CUSTOMER dmc
on f.IDCustomer = dmc.IDCustomer
where year(f.date) = 2009
group by dmc.Customer_Name
having AVG(f.TotalPrice) > 500


--7. List if there is any model that was in the top 5 in terms of quantity, simultaneously in 2008, 2009 and 2010 
select IDModel from 
(select year(Date) as yr, IDModel, sum(Quantity) as sums,
dense_rank() over(partition by year(Date) order by sum(Quantity) desc) as rnk
from FACT_TRANSACTIONS
where year(Date) in (2008,2009,2010)
group by year(Date), IDModel) as s
where rnk < 6
group by IDModel
having count(*) =3


--8. Show the manufacturer with the 2nd top sales in the year of 2009 and the manufacturer with the 2nd top sales in the year of 2010. 
select * from (
select dma.Manufacturer_Name, sum(f.TotalPrice) as sale, year(f.date) as yr, 
DENSE_RANK() over(partition by year(f.date) order by sum(f.TotalPrice) desc) as rnk
from FACT_TRANSACTIONS f
join DIM_MODEL dmo
on f.IDModel = dmo.IDModel
join DIM_MANUFACTURER dma
on dmo.IDManufacturer = dma.IDManufacturer
where year(f.date) in (2009, 2010)
group by dma.Manufacturer_Name, year(f.date)) as sw
where rnk = 2


--9. Show the manufacturers that sold cellphones in 2010 but did not in 2009
select distinct(dma.Manufacturer_Name)
from FACT_TRANSACTIONS f
join DIM_MODEL dmo
on f.IDModel = dmo.IDModel
join DIM_MANUFACTURER dma
on dmo.IDManufacturer = dma.IDManufacturer
where year(f.date) in (2010) 
and dma.Manufacturer_Name not in (select distinct(dma.Manufacturer_Name)
								from FACT_TRANSACTIONS f
								join DIM_MODEL dmo
								on f.IDModel = dmo.IDModel
								join DIM_MANUFACTURER dma
								on dmo.IDManufacturer = dma.IDManufacturer
								where year(f.date) in (2009))


--10. Find top 100 customers and their average spend, average quantity by each year. Also find the percentage of change in their spend. 
select top 100 dmc.Customer_Name, AVG(f.TotalPrice), year(f.date) as avg_price
from FACT_TRANSACTIONS f
join DIM_CUSTOMER dmc
on f.IDCustomer = dmc.IDCustomer
group by dmc.Customer_Name, year(f.date)



select * from FACT_TRANSACTIONS

select * from DIM_MODEL

select * from DIM_MANUFACTURER

select * from DIM_CUSTOMER

select * from DIM_LOCATION

select * from DIM_DATE