-- what are the most in demand skills for data analyst jobs?


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;

/*
Analysis: Most in-demand skills

SQL is by far the most demanded skill, appearing in 7,291 job postings.
Excel follows with 4,611 postings, while Python appears in 4,330 postings.

The top 5 most demanded skills are:
1. SQL      - 7,291
2. Excel    - 4,611
3. Python   - 4,330
4. Tableau  - 3,745
5. Power BI - 2,609

This shows that SQL, Excel, Python, and BI/data visualization tools
are highly valuable skills in the job market.
*/