-- 1. All Data Analyst postings
SELECT job_id,
    job_title, 
    job_location, 
    job_posted_date
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';


-- 2. Remote Data Analyst jobs
SELECT 
    job_id,
    job_location,
    job_country
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND job_work_from_home = TRUE;

-- 3. Distinct job titles available
SELECT DISTINCT job_title_short
FROM job_postings_fact;

-- 4. Count postings per job title
SELECT job_title_short,
    COUNT(*) AS total_postings
FROM job_postings_fact
GROUP BY job_title_short
ORDER BY total_postings DESC;

-- 5. Top 10 highest-paying yearly-salary postings
SELECT 
    job_title_short,
    job_location,
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10;

-- 6. Jobs posted after a given date '2023-06-01'
SELECT job_id, 
    job_title_short, 
    job_posted_date
FROM job_postings_fact
WHERE job_posted_date >  '2023-06-01'

-- 7. Average yearly salary for Data Analyst roles
SELECT AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';

-- 8. Jobs that mention no degree required
SELECT job_title_short,
    job_no_degree_mention
FROM job_postings_fact
WHERE job_no_degree_mention = TRUE;

-- 9. Count of postings by country (top 5)
SELECT job_country, COUNT(*) AS postings
FROM job_postings_fact
GROUP BY job_country
ORDER BY postings DESC
LIMIT 5; 

-- 10. All entries in skills_dim of type 'programming'
SELECT skill_id,
    skills,
    type
FROM skills_dim
WHERE type = 'programming';
 