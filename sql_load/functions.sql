SELECT *
FROM (
    SELECT * FROM january_jobs
    UNION ALL 
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
) AS quarter_job_postings