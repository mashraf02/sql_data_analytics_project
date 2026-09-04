-- Jobs offering health insurance vs not, by title


SELECT job_title_short,
       SUM(CASE WHEN job_health_insurance THEN 1 ELSE 0 END) AS with_insurance,
       SUM(CASE WHEN NOT job_health_insurance THEN 1 ELSE 0 END) AS without_insurance
FROM job_postings_fact
GROUP BY job_title_short;