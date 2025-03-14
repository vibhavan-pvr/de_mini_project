SELECT
    customer_id,
    product_id,
    product_family,
    payment_month,
    (revenue-next_revenue) as loss
FROM {{ ref('stg_recurred_customers') }}
WHERE next_revenue < revenue