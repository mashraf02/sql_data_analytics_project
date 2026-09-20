-- Q1. Companies that post remote jobs OR offer health insurance (each company listed once)

SELECT c.company_id, 
    c.name
FROM company_dim  AS c
JOIN job_postings_fact AS j ON j.company_id = c.company_id 
WHERE j.job_work_from_home = TRUE

UNION

SELECT c.company_id, 
    c.name
FROM company_dim AS c 
JOIN job_postings_fact AS j ON j.company_id = c.company_id 
WHERE j.job_health_insurance = TRUE 
ORDER BY name;