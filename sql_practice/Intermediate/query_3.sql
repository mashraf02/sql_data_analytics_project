-- 13. Most in-demand skills for Data Analyst roles
SELECT 
    s.skills, COUNT(*) AS demand_count
FROM 
    job_postings_fact j
INNER JOIN 
    skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN 
    skills_dim s ON sj.skill_id = s.skill_id
WHERE   
    j.job_title_short = 'Data Analyst'
GROUP BY s.skills
ORDER BY demand_count DESC
LIMIT 20;