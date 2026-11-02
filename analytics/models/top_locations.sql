SELECT

      job_location,
      COUNT(*) AS POSTINGS

FROM {{ ref('job_postings') }}
GROUP BY job_location

ORDER BY POSTINGS DESC

LIMIT 10 
