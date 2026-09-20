-- J13. Postings that pay more than their own company's average (join to per-company averages)
SELECT c.name, j.job_title_short, j.salary_year_avg, ca.avg_salary
FROM job_postings_fact AS j
JOIN (
    SELECT company_id, AVG(salary_year_avg) AS avg_salary, COUNT(salary_year_avg) AS n
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
    GROUP BY company_id
    HAVING COUNT(salary_year_avg) >= 5
) AS ca ON ca.company_id = j.company_id
JOIN company_dim AS c ON c.company_id = j.company_id
WHERE j.salary_year_avg > ca.avg_salary * 1.5
ORDER BY j.salary_year_avg DESC
LIMIT 10;