SELECT drug, (total_sales - cogs) as profit
FROM pharmacy_sales
ORDER BY (total_sales - cogs) DESC
LIMIT 3;