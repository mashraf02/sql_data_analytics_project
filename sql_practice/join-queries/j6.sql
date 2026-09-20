-- J6. Anti-join: postings that list NO skills at all
SELECT j.job_id, j.job_title_short, j.job_country
FROM job_postings_fact AS j
LEFT JOIN skills_job_dim AS sj ON sj.job_id = j.job_id
WHERE sj.job_id IS NULL
LIMIT 20;
 
-- J6b. How many postings have no skills, as a share of all postings
SELECT COUNT(*) FILTER (WHERE sj.job_id IS NULL)                        AS without_skills,
       COUNT(*)                                                          AS total_postings,
       ROUND(100.0 * COUNT(*) FILTER (WHERE sj.job_id IS NULL) / COUNT(*), 1) AS pct_without_skills
FROM job_postings_fact AS j
LEFT JOIN (SELECT DISTINCT job_id FROM skills_job_dim) AS sj ON sj.job_id = j.job_id;