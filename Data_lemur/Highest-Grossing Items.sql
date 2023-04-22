WITH cte1 as (SELECT category, product, SUM(spend) as total_spend FROM product_spend
where EXTRACT(year from transaction_date) = 2022
GROUP BY product_spend.category,product_spend.product)

SELECT category, product, total_spend
FROM 
(SELECT *,
row_number() OVER(PARTITION BY category ORDER BY total_spend DESC) as row_num
FROM cte1) spd
WHERE row_num <=2