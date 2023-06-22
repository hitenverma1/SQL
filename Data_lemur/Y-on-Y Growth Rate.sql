SELECT EXTRACT(year from transaction_date) as year, product_id,
spend as curr_year_spend, lag(spend) over (PARTITION BY product_id) as prev_year_spend,
ROUND(((spend - lag(spend) over (PARTITION BY product_id)) 
    /lag(spend) over (PARTITION BY product_id))*100,2) as yoy_rate
FROM user_transactions;