-- Skills required per job (join fact → bridge → dim)
SELECT j.job_id,
    j.job_title,
    s.skills
FROM 
    job_postings_fact AS j
INNER JOIN 
    skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN 
    skills_dim s ON sj.skill_id = s.skill_id
WHERE 
    j.job_title_short = 'Data Analyst'
LIMIT 20;



