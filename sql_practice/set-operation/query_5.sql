-- Q5. Programming languages demanded by ALL THREE of Data Analyst, Data Scientist and Data Engineer
SELECT s.skills
FROM job_postings_fact j
JOIN skills_job_dim sj ON sj.job_id = j.job_id
JOIN skills_dim s      ON s.skill_id = sj.skill_id
WHERE j.job_title_short = 'Data Analyst' AND s.type = 'programming'
 
INTERSECT
 
SELECT s.skills
FROM job_postings_fact j
JOIN skills_job_dim sj ON sj.job_id = j.job_id
JOIN skills_dim s      ON s.skill_id = sj.skill_id
WHERE j.job_title_short = 'Data Scientist' AND s.type = 'programming'
 
INTERSECT
 
SELECT s.skills
FROM job_postings_fact j
JOIN skills_job_dim sj ON sj.job_id = j.job_id
JOIN skills_dim s      ON s.skill_id = sj.skill_id
WHERE j.job_title_short = 'Data Engineer' AND s.type = 'programming'
ORDER BY skills;