--DATA PREPARATION AND UNDERSTANDING
--1. What is the total number of rows in each of the 3 tables in the database?
select count(*) from Customer
select count(*) from prod_cat_info
select count(*) from Transactions


--2. What is the total number of transactions that have a return?
select count(*) from transactions
where Qty < 0;


/*3. As you would have noticed, the dates provided across the datasets are not in a
correct format. As first steps, pls convert the date variables into valid date formats
before proceeding ahead.*/
UPDATE Customer
SET DOB = CONVERT(date, DOB, 105)

UPDATE transactions
SET tran_date = CONVERT(date, tran_date, 105)

/*4. What is the time range of the transaction data available for analysis? Show the
output in number of days, months and years simultaneously in different columns.*/
SELECT 
  DATEDIFF(day, MIN(tran_date), MAX(tran_date)) AS days,
  DATEDIFF(month, MIN(tran_date), MAX(tran_date)) AS months,
  DATEDIFF(year, MIN(tran_date), MAX(tran_date)) AS years
FROM transactions;


/*5. Which product category does the sub-category “DIY” belong to?*/
select prod_cat from prod_cat_info
where prod_subcat = 'DIY' 


/*DATA ANALYSIS
-- 1. Which channel is most frequently used for transactions?*/
select Store_type, COUNT(Store_type) as cnt from transactions
group by Store_type
order by cnt desc


--2. What is the count of Male and Female customers in the database?
select Gender, COUNT(Gender) as male_female_count from Customer
where Gender is not null
group by Gender



--3. From which city do we have the maximum number of customers and how many?
select top 1 city_code, count(city_code) as cnt from customer
where city_code is not null
group by city_code
order by cnt desc

--4. How many sub-categories are there under the Books category?
select count(*) count_of_subcat_under_books from prod_cat_info
where prod_cat = 'Books'


--5. What is the maximum quantity of products ever ordered?
select max(Qty) from transactions

--6. What is the net total revenue generated in categories Electronics and Books?
select prod_cat, sum(t.total_amt) from transactions t
inner join prod_cat_info p
on t.prod_cat_code = p.prod_cat_code and t.prod_subcat_code = p.prod_sub_cat_code
group by prod_cat
having prod_cat in ('Electronics','Books')


select * from prod_cat_info

--7. How many customers have >10 transactions with us, excluding returns?
select count(*) as counts from 
(select cust_id,count(cust_id) as cnt from transactions
where qty > 0
group by cust_id
having count(cust_id)> 10) as qw



--8. What is the combined revenue earned from the “Electronics” & “Clothing” categories, from “Flagship stores”?
select sum(t.total_amt) from transactions t
inner join prod_cat_info p
on t.prod_cat_code = p.prod_cat_code and t.prod_subcat_code = p.prod_sub_cat_code
where p.prod_cat in ('Electronics', 'Clothing') and t.Store_type = 'Flagship store'


--9. What is the total revenue generated from “Male” customers in “Electronics” category? Output should display total revenue by prod sub-cat.
select p.prod_subcat, sum(total_amt) as sums from transactions t
inner join prod_cat_info p
on t.prod_cat_code = p.prod_cat_code and t.prod_subcat_code = p.prod_sub_cat_code
inner join customer c
on t.cust_id = c.customer_id
where c.gender = 'M' and p.prod_cat = 'Electronics'
group by  p.prod_subcat


--10.What is percentage of sales and returns by product sub category; display only top 5 sub categories in terms of sales?
select top 5 p.prod_subcat, (sum(t.total_amt)/(select sum(total_amt) from Transactions))*100 as PERCANTAGE_OF_SALES,
(sum(case when t.Qty < 0 then 1 else 0 end)*100)/sum(t.Qty) as PERCENTAGE_OF_RETURN
from transactions t
inner join prod_cat_info p
on t.prod_cat_code = p.prod_cat_code and t.prod_subcat_code = p.prod_sub_cat_code
group by p.prod_subcat
ORDER BY SUM(t.total_amt) DESC



/*11. For all customers aged between 25 to 35 years find what is the net total revenue
generated by these consumers in last 30 days of transactions from max transaction
date available in the data?*/
select sum(tb1.total_amt) as total_revenue from ( 
select *, datediff(year, c.DOB, (select max(tran_date) from transactions)) as age 
from transactions t
inner join Customer c
on t.cust_id = c.customer_Id
where datediff(year, c.DOB, (select max(tran_date) from transactions)) between 25 and 35
and tran_date between DATEADD(day, -30, (select max(tran_date) from transactions)) and (select max(tran_date) from transactions)) as tb1


--12.Which product category has seen the max value of returns in the last 3 months of transactions?
select p.prod_cat, t.tran_date from Transactions t
inner join prod_cat_info p
on t.prod_cat_code = p.prod_cat_code and t.prod_subcat_code = p.prod_sub_cat_code
where tran_date >= DATEADD(month, -3, (select max(tran_date) from transactions))
group by p.prod_cat

select * from Customer

select * from prod_cat_info

select * from Transactions

--13.Which store-type sells the maximum products; by value of sales amount and by quantity sold?
SELECT TOP 1 Store_type 
FROM (
    SELECT t.Store_type, MAX(t.total_amt) AS max_total_amt, MAX(t.Qty) AS max_qty, COUNT(t.Qty) AS qty_sold 
    FROM Transactions t
    INNER JOIN prod_cat_info p ON t.prod_cat_code = p.prod_cat_code AND t.prod_subcat_code = p.prod_sub_cat_code
    WHERE t.Qty > 0
    GROUP BY t.Store_type
) AS q
ORDER BY q.qty_sold;


--14.What are the categories for which average revenue is above the overall average.

--15. Find the average and total revenue by each subcategory for the categories which are among top 5 categories in terms of quantity sold. 