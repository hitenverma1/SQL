with cte1 as(SELECT ag.age_bucket,SUM(ac.time_spent) as time_opening FROM activities ac
JOIN age_breakdown ag
on ac.user_id = ag.user_id
where ac.activity_type = 'open'
GROUP BY ag.age_bucket),
cte2 as(SELECT ag.age_bucket,sum(ac.time_spent) as time_sending FROM activities ac
JOIN age_breakdown ag
on ac.user_id = ag.user_id
where ac.activity_type = 'send'
GROUP BY ag.age_bucket)

select cte1.age_bucket, ROUND((cte2.time_sending / (cte2.time_sending + cte1.time_opening))*100.0,2) as send_perc,
ROUND((cte1.time_opening / (cte2.time_sending + cte1.time_opening))*100.0,2) as open_perc
from cte1
join cte2 on cte1.age_bucket = cte2.age_bucket
ORDER BY cte1.age_bucket