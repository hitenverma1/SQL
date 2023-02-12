SELECT COUNT(*) as co_w_duplicate_jobs
FROM (
  SELECT company_id, title, description
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1 ) jl;