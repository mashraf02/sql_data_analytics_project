-- Average salary by job title (only titles with salary data)

SELECT 
    job_title_short,
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
GROUP BY job_title_short
HAVING COUNT (*) >= 10
ORDER BY avg_salary DESC;


