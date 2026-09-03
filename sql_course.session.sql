SELECT 
    j.company_id,
    c.name,
    j.job_title_short,
    c.link
    
FROM job_postings_fact AS j
INNER JOIN company_dim AS c
ON j.company_id = c.company_id AND c.link IS NOT NULL
LIMIT 100;
