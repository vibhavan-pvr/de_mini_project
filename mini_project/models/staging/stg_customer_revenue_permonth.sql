WITH customer_revenues AS(
    SELECT 
        customer_id,
        revenue,
        product_id,
        sum(revenue) over (partition by payment_month,customer_id) as revenue_per_month,
        payment_month
    FROM {{ ref('stg_transactions') }}
    ORDER BY customer_id,payment_month
)
SELECT
    customer_id,
    payment_month,
    revenue_per_month,
    MAX(payment_month) AS last_month
from customer_revenues
group by payment_month,customer_id,revenue_per_month