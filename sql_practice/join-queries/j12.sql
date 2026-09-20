-- J12. Bucket salaries into bands and count postings per band
WITH salary_bands (band, low, high) AS (
    VALUES ('Under 60K', 0, 60000),
           ('60K-90K',   60000, 90000),
           ('90K-120K',  90000, 120000),
           ('120K-160K', 120000, 160000),
           ('160K+',     160000, 1000000000)
)
SELECT b.band, COUNT(*) AS postings
FROM job_postings_fact AS j
JOIN salary_bands AS b
  ON j.salary_year_avg >= b.low AND j.salary_year_avg < b.high
GROUP BY b.band, b.low
ORDER BY b.low;