/*  Show the 10 most recently posted jobs, newest first */
SELECT job_id,
    job_title,
    job_posted_date
FROM job_postings_fact
ORDER BY job_posted_date DESC
LIMIT 10;


/* The result shows the latest job postings based on job_posted_date, with all records posted on December 31, 2023. The postings include Data Analyst, Data Scientist, Engineering, and related technical roles, indicating strong activity across multiple job categories. */