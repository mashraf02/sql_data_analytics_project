-- What are the most optimal skills?

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id 
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id,
        skills
),

average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id 
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id;

ORDER BY 
    demand_count DESC, avg_salary DESC;

/*
Analysis: Optimal Skills for Data Analysts

This analysis compares skill demand with average salary for
remote Data Analyst positions.

Key findings:
- SQL has the highest demand (398 jobs) with an average salary of $97,237.
- Python is highly demanded (236 jobs) and has a higher average salary of $101,397.
- R has strong demand (148 jobs) with an average salary of $100,499.
- Tableau (230 jobs) and Power BI (110 jobs) are also highly demanded.
- Some less common skills have very high average salaries:
  PySpark ($208,172), Bitbucket ($189,155), Couchbase ($160,515),
  and Pandas ($151,821).

Key insight:
SQL, Python, R, Tableau, and Power BI offer a strong combination
of demand and salary. Meanwhile, specialized skills such as PySpark,
Pandas, cloud technologies, and advanced data tools can provide
higher salary potential but appear in fewer job postings.

For a Data Analyst career, building a foundation in SQL and Python
while adding BI tools and specialized technologies can provide
a strong balance between job opportunities and salary potential.
*/