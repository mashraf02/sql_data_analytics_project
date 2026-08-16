/* List all columns for every row in job_postings_fact, limited to 20 rows */
SELECT *
FROM job_postings_fact
LIMIT 30;
/* The dataset contains job-level attributes such as job title,
 location, work type, remote status, degree requirement, and salary. 
 Several columns contain NULL/missing values, especially 
 salary-related fields, which should be considered during analysis. */