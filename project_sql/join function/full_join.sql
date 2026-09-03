SELECT
    j.job_id,
    c.company_id,
    j.job_title_short,
    j.salary_year_avg,
    c.link
FROM job_postings_fact AS j
FULL JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
  AND j.salary_year_avg >= 10000;