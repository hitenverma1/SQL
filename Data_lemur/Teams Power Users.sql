SELECT sender_id, count(sender_id) as num
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY num DESC
limit 2;


SELECT sender_id, COUNT(message_id) as message_count FROM messages
WHERE EXTRACT(Year FROM sent_date) = 2022 and EXTRACT(month FROM sent_date) = 8
GROUP BY sender_id
ORDER BY message_count desc
limit 2;