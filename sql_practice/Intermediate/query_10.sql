-- Company posting the most Data Analyst jobs (subquery in FROM)

SELECT company_name, 
    total_postings
FROM (
    SELECT c.name AS company_name, 
        COUNT(*) AS total_postings
    FROM job_postings_fact j
    JOIN company_dim c ON j.company_id = c.company_id
    WHERE j.job_title_short = 'Data Analyst'
    GROUP BY c.name
) sub
ORDER BY total_postings DESC
LIMIT 5;