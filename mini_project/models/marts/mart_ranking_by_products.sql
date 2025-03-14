WITH ranked_products AS (
    SELECT
        product_id,
        product_family,
        product_sub_family,
        total_revenue,
        DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS rank
    FROM {{ ref('stg_product_revenue') }}
)
SELECT
    product_id,
    product_family,
    product_sub_family,
    total_revenue,
    rank
FROM ranked_products