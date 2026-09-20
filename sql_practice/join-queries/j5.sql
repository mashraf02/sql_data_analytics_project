-- J5. Demand for EVERY skill, including skills with zero postings
--     (in this data every skill has >= 1 posting, so the lowest counts are 1)
SELECT s.skills, s.type, COUNT(sj.job_id) AS postings
FROM skills_dim AS s
LEFT JOIN skills_job_dim AS sj ON sj.skill_id = s.skill_id
GROUP BY s.skill_id, s.skills, s.type
ORDER BY postings ASC, s.skills
LIMIT 15;