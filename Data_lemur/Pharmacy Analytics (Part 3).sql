SELECT manufacturer, CONCAT('$',round(sum(total_sales) / 1000000),' million') as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC;