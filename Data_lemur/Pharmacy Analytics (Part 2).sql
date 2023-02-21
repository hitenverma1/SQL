SELECT manufacturer, COUNT(drug), SUM(abs(total_sales - cogs)) as loss
FROM pharmacy_sales
WHERE (total_sales - cogs) <0
GROUP BY manufacturer
ORDER BY SUM(abs(total_sales - cogs)) DESC;