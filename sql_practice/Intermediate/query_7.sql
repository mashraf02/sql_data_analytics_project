-- Skills grouped by type, with count of distinct skills
SELECT type,
    COUNT(*) AS skills_count
FROM skills_dim
GROUP BY type
ORDER BY skills_count DESC;