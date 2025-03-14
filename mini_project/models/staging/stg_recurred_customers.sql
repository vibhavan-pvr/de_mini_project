SELECT DISTINCT
    a.customer_id,
    a.product_id,
    a.product_family,
    a.payment_month,
    DATEADD(month,1,a.payment_month) AS next_month,
    a.revenue AS revenue,
    b.revenue AS next_revenue

FROM {{ ref('stg_transaction_details') }} AS a
INNER JOIN {{ ref('stg_transaction_details') }} AS b ON b.payment_month = DATEADD(month,1,a.payment_month) AND a.product_id = b.product_id AND a.customer_id = b.customer_id
