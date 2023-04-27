select  t1.transaction_date, t1.user_id, COUNT(t1.user_id) as purchase_count from
(SELECT *,
RANK() over(PARTITION BY user_id ORDER BY transaction_date desc) as rk 
FROM user_transactions) as t1
WHERE rk =1
GROUP BY t1.transaction_date,t1.user_id
