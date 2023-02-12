use intro_sql;
show tables

select * from trans_details;

select product_name, product_id, datediff(sysdate(),order_date) as Diff_date, order_date
from trans_details

select product_name, product_id, date_format(order_date,'%Y') as Years, order_date
from trans_details

select product_name, product_id, date_format(order_date,'%m') as Months, order_date
from trans_details

select product_name, product_id, date_format(order_date,'%d') as Dates, order_date
from trans_details

select Year(order_date) , order_date
from trans_details

select quarter(order_date) , order_date
from trans_details

select adddate('2015-10-15', interval 6 year);

select adddate('2015-10-15', interval 10 quarter);

select adddate('2015-10-15', interval 2 day);

select subdate('2015-10-15', interval 2 day);

select subdate('2015-10-15', interval 2 day), adddate('2015-10-15', interval -2 day);

