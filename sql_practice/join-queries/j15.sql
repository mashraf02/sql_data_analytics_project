-- J15. Skill category mix per role (fact -> bridge -> dimension, grouped by dimension attribute)
SELECT j.job_title_short, s.type, COUNT(*) AS mentions
FROM job_postings_fact AS j
JOIN skills_job_dim    AS sj ON sj.job_id  = j.job_id
JOIN skills_dim        AS s  ON s.skill_id = sj.skill_id
GROUP BY j.job_title_short, s.type
ORDER BY j.job_title_short, mentions DESC;