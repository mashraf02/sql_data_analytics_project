SELECT c.name, 
    COUNT(*) AS postings
FROM 
    job_postings_fact AS j
INNER JOIN company_dim AS c ON c.company_id = j.company_id
GROUP BY c.name
HAVING COUNT(*) >= 100
ORDER BY postings DESC;