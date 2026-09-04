-- Data Analyst jobs paying above the overall average (subquery in WHERE)
SELECT job_id, 
    job_title, 
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg > (
      SELECT AVG(salary_year_avg) FROM job_postings_fact WHERE job_title_short = 'Data Analyst'
  )
ORDER BY salary_year_avg DESC
LIMIT 10;