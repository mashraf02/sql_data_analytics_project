SELECT 
     c.company_id,
     c.name,
     j.job_title_short,
     j.job_location
FROM 
    company_dim AS c
LEFT JOIN 
    job_postings_fact AS j
ON c.company_id = j.company_id
WHERE 
    j.job_title_short = 'Data Analyst' AND j.job_location = 'Anywhere'
LIMIT 1000;

