-- Q9. Skills in skills_dim that no job posting has ever listed
SELECT skill_id FROM skills_dim
EXCEPT
SELECT skill_id FROM skills_job_dim;