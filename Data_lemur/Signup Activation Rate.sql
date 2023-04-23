SELECT 
ROUND(1.0*COUNT(*)/(SELECT COUNT(*) FROM emails),2) as confirm_rate 
FROM emails e
left join texts t on e.email_id = t.email_id
where signup_action = 'Confirmed'
