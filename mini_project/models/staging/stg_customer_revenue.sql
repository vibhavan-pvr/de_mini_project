SELECT
    t.customer_id,
    c.customer_name,
    SUM(t.revenue) AS total_revenue
FROM {{ ref('stg_transactions') }} AS t
INNER JOIN {{ ref('stg_customers') }} AS c ON c.customer_id = t.customer_id
GROUP BY
    t.customer_id,c.customer_name