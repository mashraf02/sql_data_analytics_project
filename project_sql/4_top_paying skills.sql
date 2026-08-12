--what are the top skills based on salary?


SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/*
Average salary by skill.

The results show the average salary associated with job postings
requiring each skill, sorted from highest to lowest average salary.

Key findings:
- PySpark has the highest average salary: $208,172.25
- Bitbucket: $189,154.50
- Couchbase: $160,515.00
- Watson: $160,515.00
- DataRobot: $155,485.50
- GitLab: $154,500.00
- Swift: $153,750.00
- Jupyter: $152,776.50
- Pandas: $151,821.33
- Elasticsearch and Golang: $145,000.00
- NumPy: $143,512.50
- Databricks: $141,906.60
- Linux: $136,507.50
- Kubernetes: $132,500.00
- PostgreSQL: $123,878.75
- GCP: $122,500.00

Overall, the results suggest that skills related to big data,
cloud platforms, data engineering, and machine learning tools
are associated with higher average salaries in this dataset.
*/