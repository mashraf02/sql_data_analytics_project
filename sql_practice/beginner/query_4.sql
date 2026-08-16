/* List distinct job schedule types available in the dataset.*/

SElECT DISTINCT job_schedule_type
FROM job_postings_fact
LIMIT 50;

/* The job_schedule_type column contains diverse employment arrangements, including full-time, part-time, contractor, internship, temporary, and volunteer roles. Multiple combinations indicate that some postings support more than one employment type, while the empty value represents missing data.*/