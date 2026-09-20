-- Q4. Companies hiring for BOTH Data Analyst and Data Engineer roles
SELECT c.company_id, c.name
FROM company_dim c JOIN job_postings_fact j ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
 
INTERSECT
 
SELECT c.company_id, c.name
FROM company_dim c JOIN job_postings_fact j ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Engineer'
ORDER BY name;