SELECT
    customer_id,
    product_id,
    product_family,
    payment_month,
    revenue
FROM {{ ref('stg_transaction_details') }}
WHERE revenue>0
MINUS
SELECT
    customer_id,
    product_id,
    product_family,
    payment_month,
    revenue
FROM {{ ref('stg_recurred_customers') }}