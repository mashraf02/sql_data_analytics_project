-- what skills are required for the top-paying data analyst jobs?


WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC

    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;


/*
Analysis: Highest-Paying Data Analyst Jobs

The results show the highest-paying data analyst positions and
the skills required for each position.

Key findings:
- Associate Director - Data Insights at AT&T: $255,829.50
- Data Analyst, Marketing at Pinterest: $232,423.00
- Data Analyst (Hybrid/Remote) at UCLA Healthcare: $217,000.00
- Principal Data Analyst (Remote) at SmartAsset: $205,000.00
- Director, Data Analyst - HYBRID at Inclusively: $189,309.00

Common skills among these high-paying positions include:
SQL, Python, R, Tableau, Excel, AWS, Azure, Snowflake, Pandas,
and other data engineering and business intelligence tools.

Key insight:
High-paying data analyst roles often require a combination of
SQL/Python fundamentals, data visualization, cloud platforms,
and advanced data technologies.
*/