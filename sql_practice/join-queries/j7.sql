-- J7. Every company with its posting count, including companies with none
SELECT c.name, COUNT(j.job_id) AS postings
FROM job_postings_fact AS j
RIGHT JOIN company_dim AS c ON c.company_id = j.company_id
GROUP BY c.company_id, c.name
ORDER BY postings DESC
LIMIT 10;