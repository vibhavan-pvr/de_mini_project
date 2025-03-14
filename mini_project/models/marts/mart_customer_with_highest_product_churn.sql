WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(revenue) OVER (
            PARTITION BY customer_id
        ) AS revenue
    FROM {{ ref('stg_customers_churned') }}
),
rankings AS(
    SELECT
        customer_id,
        RANK() OVER (
            ORDER BY revenue DESC
        ) AS rank
    FROM customer_sales
)
SELECT DISTINCT
    customer_id
FROM rankings
WHERE rank<2
GROUP BY customer_id