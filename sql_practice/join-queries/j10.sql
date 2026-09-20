-- J10. Skills that most often appear TOGETHER in Data Analyst postings
SELECT s1.skills AS skill_a,
       s2.skills AS skill_b,
       COUNT(*)  AS postings_together
FROM job_postings_fact AS j
JOIN skills_job_dim AS a  ON a.job_id  = j.job_id
JOIN skills_job_dim AS b  ON b.job_id  = a.job_id
                         AND a.skill_id < b.skill_id      -- avoids (x,x) and mirrored pairs
JOIN skills_dim     AS s1 ON s1.skill_id = a.skill_id
JOIN skills_dim     AS s2 ON s2.skill_id = b.skill_id
WHERE j.job_title_short = 'Data Analyst'
GROUP BY s1.skills, s2.skills
ORDER BY postings_together DESC
LIMIT 10;