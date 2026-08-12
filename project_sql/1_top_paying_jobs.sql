-- what are the top paying data analyst jobs?

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type, 
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC

LIMIT 10

/*
Analysis: Highest-Paying Data Analyst Jobs

The results show the top-paying data analyst positions in the dataset.

Top 5 highest-paying roles:
1. Data Analyst - Mantys: $650,000
2. Director of Analytics - Meta: $336,500
3. Associate Director - Data Insights - AT&T: $255,829.50
4. Data Analyst, Marketing - Pinterest: $232,423
5. Data Analyst (Hybrid/Remote) - UCLA Healthcare: $217,000

Key insight:
The highest-paying roles include senior and leadership positions,
but some individual Data Analyst roles also offer very high salaries.

All listed positions are marked as "Anywhere" and "Full-time",
showing that remote/anywhere opportunities can include highly
competitive salaries.
*/