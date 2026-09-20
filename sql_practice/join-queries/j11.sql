-- J11. Self join: pairs of countries where the SAME company hires for the SAME role
WITH company_role_country AS (
    SELECT DISTINCT company_id, job_title_short, job_country
    FROM job_postings_fact
)
SELECT a.job_country AS country_1,
       b.job_country AS country_2,
       COUNT(DISTINCT a.company_id) AS companies
FROM company_role_country AS a
JOIN company_role_country AS b
  ON  b.company_id      = a.company_id
  AND b.job_title_short = a.job_title_short
  AND a.job_country     < b.job_country       -- each pair once, no (x,x)
GROUP BY a.job_country, b.job_country
ORDER BY companies DESC
LIMIT 10;