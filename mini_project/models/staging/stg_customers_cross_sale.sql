WITH sales AS (
    SELECT
        customer_id,
        COUNT(product_id) AS products,
        SUM(revenue) AS revenue,
        payment_month
    FROM mini_project.staging.stg_transaction_details
    GROUP BY customer_id, payment_month
)
SELECT
    c.customer_id,
    c.products,
    c.revenue,
    c.payment_month,
    DATEADD(month, 1, c.payment_month) AS next_month,
    d.revenue as next_revenue,
    (d.revenue - c.revenue) AS cross_sale
FROM sales AS c
LEFT JOIN sales AS d 
    ON c.payment_month = DATEADD(month, 1, d.payment_month) 
    AND c.customer_id = d.customer_id
WHERE d.products > c.products