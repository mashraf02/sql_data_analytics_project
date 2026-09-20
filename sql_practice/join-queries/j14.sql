-- J14. Semi-join with EXISTS: companies that have at least one remote posting that discloses salary
SELECT c.company_id, c.name
FROM company_dim AS c
WHERE EXISTS (
    SELECT 1
    FROM job_postings_fact AS j
    WHERE j.company_id = c.company_id
      AND j.job_work_from_home = TRUE
      AND j.salary_year_avg IS NOT NULL
)
ORDER BY c.name
LIMIT 20;