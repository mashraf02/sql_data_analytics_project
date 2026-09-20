-- Q12. Skills unique to Data Analyst OR unique to Data Scientist (not shared)
WITH da AS (
  SELECT DISTINCT s.skills
  FROM job_postings_fact j
  JOIN skills_job_dim sj ON sj.job_id = j.job_id
  JOIN skills_dim s      ON s.skill_id = sj.skill_id
  WHERE j.job_title_short = 'Data Analyst'
),
ds AS (
  SELECT DISTINCT s.skills
  FROM job_postings_fact j
  JOIN skills_job_dim sj ON sj.job_id = j.job_id
  JOIN skills_dim s      ON s.skill_id = sj.skill_id
  WHERE j.job_title_short = 'Data Scientist'
)
SELECT skills, 'Data Analyst only' AS unique_to FROM (SELECT skills FROM da EXCEPT SELECT skills FROM ds) a
UNION ALL
SELECT skills, 'Data Scientist only'             FROM (SELECT skills FROM ds EXCEPT SELECT skills FROM da) b
ORDER BY unique_to, skills;