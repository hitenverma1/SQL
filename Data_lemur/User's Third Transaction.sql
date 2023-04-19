with cte as 
    (SELECT * , 
      row_number() OVER(PARTITION BY user_id ORDER BY transaction_date) as ranks 
      FROM transactions)


SELECT user_id, spend, transaction_date 
from cte
where ranks = 3;