-- Job postings with company name (INNER JOIN)
SELECT jp.job_id,
    cd.company_id,
    cd.name AS company_name
FROM job_postings_fact AS jp
INNER JOIN company_dim AS cd ON cd.company_id = jp.company_id
LIMIT 20;


