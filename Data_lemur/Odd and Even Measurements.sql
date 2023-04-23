with cte1 as (SELECT *, 
RANK() over(PARTITION BY EXTRACT(day from measurement_time) 
ORDER BY measurement_time) as rnk FROM measurements)

SELECT tb1.measurement_day, tb2.odd_sum, tb1.even_sum FROM
(SELECT CAST(measurement_time AS DATE) as measurement_day, SUM(measurement_value) as even_sum FROM cte1
where mod(rnk,2) = 0
GROUP BY measurement_day) as tb1
JOIN 
(SELECT CAST(measurement_time AS DATE) as measurement_day, SUM(measurement_value) as odd_sum FROM cte1
where mod(rnk,2) <> 0
GROUP BY measurement_day)as tb2
on tb1.measurement_day = tb2.measurement_day
ORDER BY tb1.measurement_day
