-- J9. Role x country grid of posting counts, with 0 where there are none
WITH top_countries AS (
    SELECT job_country FROM job_postings_fact
    GROUP BY job_country ORDER BY COUNT(*) DESC LIMIT 5
),
roles AS (
    SELECT DISTINCT job_title_short FROM job_postings_fact
)
SELECT r.job_title_short, tc.job_country, COUNT(j.job_id) AS postings
FROM roles AS r
CROSS JOIN top_countries AS tc
LEFT JOIN job_postings_fact AS j
       ON j.job_title_short = r.job_title_short
      AND j.job_country     = tc.job_country
GROUP BY r.job_title_short, tc.job_country
ORDER BY r.job_title_short, postings DESC;