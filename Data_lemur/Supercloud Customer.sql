SELECT customer_id from 
(SELECT customer_id, COUNT(DISTINCT(product_category)) as cnt
FROM customer_contracts c
join products p
on c.product_id = p.product_id
GROUP BY customer_id
order by cnt desc
LIMIT 1) as table1