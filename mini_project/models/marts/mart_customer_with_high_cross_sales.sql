WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(cross_sale) OVER (
            PARTITION BY customer_id
        ) AS revenue
    FROM {{ ref('stg_customers_cross_sale') }}
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