-- J8. Side-by-side skill demand: Data Analyst vs Data Scientist
WITH da AS (
    SELECT s.skills, COUNT(*) AS n
    FROM job_postings_fact j
    JOIN skills_job_dim sj ON sj.job_id  = j.job_id
    JOIN skills_dim s      ON s.skill_id = sj.skill_id
    WHERE j.job_title_short = 'Data Analyst'
    GROUP BY s.skills
),
ds AS (
    SELECT s.skills, COUNT(*) AS n
    FROM job_postings_fact j
    JOIN skills_job_dim sj ON sj.job_id  = j.job_id
    JOIN skills_dim s      ON s.skill_id = sj.skill_id
    WHERE j.job_title_short = 'Data Scientist'
    GROUP BY s.skills
)
SELECT COALESCE(da.skills, ds.skills) AS skill,
       COALESCE(da.n, 0)              AS analyst_postings,
       COALESCE(ds.n, 0)              AS scientist_postings
FROM da
FULL OUTER JOIN ds ON ds.skills = da.skills
ORDER BY analyst_postings + scientist_postings DESC
LIMIT 15;