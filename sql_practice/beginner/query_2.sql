/* Show the job title, company id, and location for every posting where the job title is exactly 'Data
 Analyst'.
 */
SELECT job_title,
    company_id,
    job_location
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
LIMIT 20;


    /* The result shows the geographical distribution of Data Analyst
     job postings across companies. Singapore appears multiple times, indicating relatively higher job-posting frequency in this sample, while the data also shows a broad international distribution across Asia, Europe, and the United States. */