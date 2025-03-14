SELECT
    p.product_id,
    p.product_family,
    p.product_sub_family,
    SUM(t.revenue) AS total_revenue
FROM {{ ref('stg_products') }} AS p
INNER JOIN {{ ref('stg_transactions') }} AS t ON t.product_id = p.product_id
GROUP BY
    p.product_id,p.product_family,p.product_sub_family