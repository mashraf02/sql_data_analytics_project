/* Find all job postings that are fully remote (job_location = 'Anywhere') */
SELECT job_id,
    job_title,
    job_location
FROM job_postings_fact
WHERE job_location = 'Anywhere'
LIMIT 20;

/* The result identifies job postings with job_location = 'Anywhere', representing location-independent or remote opportunities. The sample includes Data Engineering, Data Science, Data Analytics, and Machine Learning roles, with several senior-level positions. */