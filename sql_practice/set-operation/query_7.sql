-- Q7. "Sweet-spot" postings: remote AND salary disclosed AND no degree required
SELECT job_id FROM job_postings_fact WHERE job_work_from_home = TRUE
INTERSECT
SELECT job_id FROM job_postings_fact WHERE salary_year_avg IS NOT NULL
INTERSECT
SELECT job_id FROM job_postings_fact WHERE job_no_degree_mention = TRUE;