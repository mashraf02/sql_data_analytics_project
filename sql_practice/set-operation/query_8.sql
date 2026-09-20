-- Q8. Skills asked for in Data Scientist postings but never in Data Analyst postings
SELECT s.skills
FROM job_postings_fact j
JOIN skills_job_dim sj ON sj.job_id = j.job_id
JOIN skills_dim s      ON s.skill_id = sj.skill_id
WHERE j.job_title_short = 'Data Scientist'
 
EXCEPT
 
SELECT s.skills
FROM job_postings_fact j
JOIN skills_job_dim sj ON sj.job_id = j.job_id
JOIN skills_dim s      ON s.skill_id = sj.skill_id
WHERE j.job_title_short = 'Data Analyst'
ORDER BY skills;