SELECT DISTINCT(candidate_id) 
FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
ORDER BY candidate_id
LIMIT 2;