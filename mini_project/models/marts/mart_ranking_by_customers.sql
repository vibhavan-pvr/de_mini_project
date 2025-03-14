WITH ranked_customers AS (
    SELECT
        customer_id,
        customer_name,
        total_revenue,
        DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS rank
    FROM {{ ref('stg_customer_revenue') }}
)
SELECT
    customer_id,
    customer_name,
    total_revenue,
    rank
FROM ranked_customers