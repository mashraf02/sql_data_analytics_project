-- Q11. Companies that hire ONLY in the United States (never anywhere else)
SELECT company_id FROM job_postings_fact WHERE job_country = 'United States'
EXCEPT
SELECT company_id FROM job_postings_fact WHERE job_country <> 'United States';