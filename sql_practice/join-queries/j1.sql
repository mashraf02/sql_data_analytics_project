-- J1. Ten highest-paying postings with the company name
SELECT j.job_id, j.job_title_short, c.name AS company, j.job_country, j.salary_year_avg
FROM job_postings_fact AS j
INNER JOIN company_dim AS c ON c.company_id = j.company_id
WHERE j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC
LIMIT 10;