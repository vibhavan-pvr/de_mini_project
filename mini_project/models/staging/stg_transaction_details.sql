SELECT
    t.customer_id,
    t.product_id,
    p.product_family,
    t.payment_month,
    t.revenue_type,
    t.revenue,
    t.quantity
FROM {{ ref('stg_transactions') }} AS t
LEFT JOIN {{ ref('stg_products') }} AS p ON t.product_id = p.product_id
WHERE t.revenue_type = 1
order by customer_id,payment_month