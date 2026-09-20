-- J4. Top hiring companies with posting count and average salary (join to an aggregated subquery)
SELECT c.name, t.postings, t.avg_salary
FROM company_dim AS c
JOIN (
    SELECT company_id,
           COUNT(*)                      AS postings,
           ROUND(AVG(salary_year_avg))   AS avg_salary
    FROM job_postings_fact
    GROUP BY company_id
) AS t ON t.company_id = c.company_id
ORDER BY t.postings DESC
LIMIT 10;