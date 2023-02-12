SELECT user_id, (MAX(post_date::date) - MIN(post_date::date)) as days_between FROM posts
where EXTRACT(year from post_date) = '2021'
GROUP BY user_id
HAVING (MAX(post_date::date) - MIN(post_date::date)) <> 0