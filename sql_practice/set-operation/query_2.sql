-- Q2. Top 3 most demanded skills for each of three roles, in one result set
(
  SELECT 'Data Analyst' AS role, s.skills, COUNT(*) AS demand
  FROM job_postings_fact j
  JOIN skills_job_dim sj ON sj.job_id = j.job_id
  JOIN skills_dim s      ON s.skill_id = sj.skill_id
  WHERE j.job_title_short = 'Data Analyst'
  GROUP BY s.skills
  ORDER BY demand DESC
  LIMIT 3
)
UNION ALL
(
  SELECT 'Data Scientist', s.skills, COUNT(*)
  FROM job_postings_fact j
  JOIN skills_job_dim sj ON sj.job_id = j.job_id
  JOIN skills_dim s      ON s.skill_id = sj.skill_id
  WHERE j.job_title_short = 'Data Scientist'
  GROUP BY s.skills
  ORDER BY COUNT(*) DESC
  LIMIT 3
)
UNION ALL
(
  SELECT 'Data Engineer', s.skills, COUNT(*)
  FROM job_postings_fact j
  JOIN skills_job_dim sj ON sj.job_id = j.job_id
  JOIN skills_dim s      ON s.skill_id = sj.skill_id
  WHERE j.job_title_short = 'Data Engineer'
  GROUP BY s.skills
  ORDER BY COUNT(*) DESC
  LIMIT 3
);