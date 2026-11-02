
WITH totals AS (

    SELECT month,
        SUM(postings) AS TOTAL_POSTINGS

    FROM {{ ref('jobs_per_month') }}

    GROUP BY month

),
remote AS (
    SELECT DATE_TRUNC('month',search_date) AS month,
           COUNT(*) AS REMOTE_POSTINGS

    FROM {{ ref('job_postings') }}
    WHERE job_work_from_home
    GROUP BY month
)
SELECT

      month,
      total_postings,
      remote_postings,
      ROUND(100.0 * remote_postings / total_postings , 1) AS pct_re

FROM totals
JOIN remote USING (month)
ORDER BY month