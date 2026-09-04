-- Categorize jobs as remote vs on-site with CASE

SELECT job_id, 
    job_title_short,
    CASE 
        WHEN job_work_from_home 
        THEN 'Remote' 
        ELSE 'On-site' END AS work_mode
FROM job_postings_fact
LIMIT 20;
