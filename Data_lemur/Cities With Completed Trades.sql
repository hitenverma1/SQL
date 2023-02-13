SELECT u.city, COUNT(u.city) as cnt FROM trades t
join users u
on t.user_id = u.user_id
where status = 'Completed'
GROUP BY u.city
ORDER BY cnt DESC
LIMIT 3;