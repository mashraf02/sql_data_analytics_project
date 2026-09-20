-- Q3. Data Analyst postings per quarter of 2023, stacked with a quarter label
SELECT 'Q1' AS quarter, COUNT(*) AS postings, ROUND(AVG(salary_year_avg)) AS avg_salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND job_posted_date >= '2023-01-01' AND job_posted_date < '2023-04-01'
UNION ALL
SELECT 'Q2', COUNT(*), ROUND(AVG(salary_year_avg))
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND job_posted_date >= '2023-04-01' AND job_posted_date < '2023-07-01'
UNION ALL
SELECT 'Q3', COUNT(*), ROUND(AVG(salary_year_avg))
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND job_posted_date >= '2023-07-01' AND job_posted_date < '2023-10-01'
UNION ALL
SELECT 'Q4', COUNT(*), ROUND(AVG(salary_year_avg))
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND job_posted_date >= '2023-10-01' AND job_posted_date < '2024-01-01';