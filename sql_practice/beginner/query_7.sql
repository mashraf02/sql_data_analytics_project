/* Rank every job posting by salary_year_avg within its job_title_short group, and also show a gapless
 dense rank alongside it.*/
SELECT job_id,
    job_title_short,
    salary_year_avg,
    RANK() OVER (
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS salary_rank,
    DENSE_RANK() OVER (
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS salary_dense_rank
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 200;


/* The result ranks job postings by salary_year_avg in descending order across the dataset. RANK() assigns the same rank to tied salaries with gaps afterward, while DENSE_RANK() assigns the same rank without leaving gaps. */