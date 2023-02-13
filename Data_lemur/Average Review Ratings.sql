SELECT EXTRACT(month from submit_date) as mnth, 
product_id, ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY EXTRACT(month from submit_date), product_id
ORDER BY mnth, product_id;