-- Q6. Companies that hire in BOTH the United States and the United Kingdom
SELECT c.company_id, c.name
FROM company_dim c JOIN job_postings_fact j ON j.company_id = c.company_id
WHERE j.job_country = 'United States'
 
INTERSECT
 
SELECT c.company_id, c.name
FROM company_dim c JOIN job_postings_fact j ON j.company_id = c.company_id
WHERE j.job_country = 'United Kingdom'
ORDER BY name;