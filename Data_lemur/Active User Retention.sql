select mnth, COUNT(DISTINCT(user_id)) from (
SELECT EXTRACT(month from event_date) as mnth, user_id FROM user_actions
where EXTRACT(month from event_date) = 7 and user_id in(
SELECT distinct(user_id) FROM user_actions
where EXTRACT(month from event_date) = 6))as a
GROUP BY mnth;