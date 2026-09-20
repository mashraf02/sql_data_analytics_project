-- J2. Three-table join through the bridge table: skills required by one posting
SELECT j.job_id, j.job_title, s.skills, s.type
FROM job_postings_fact AS j
JOIN skills_job_dim   AS sj ON sj.job_id   = j.job_id
JOIN skills_dim       AS s  ON s.skill_id  = sj.skill_id
WHERE j.job_id = 0;