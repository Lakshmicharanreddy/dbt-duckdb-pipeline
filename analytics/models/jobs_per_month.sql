SELECT 
    DATE_TRUNC('month', search_date) AS month,
    search_term AS role,
    COUNT(*) AS postings
FROM {{ ref('job_postings') }}
GROUP BY 1, 2
ORDER BY month, role
