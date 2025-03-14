SELECT
    c.customer_id,
    c.payment_month,
    c.revenue_per_month,
    DATEADD(MONTH, 1, c.payment_month) AS first_next_month,
    COALESCE(n1.revenue_per_month,0) AS first_next_month_revenue,
    DATEADD(MONTH, 2, c.payment_month) AS second_next_month,
    COALESCE(n2.revenue_per_month,0) AS second_next_month_revenue,
    DATEADD(MONTH, -1, c.payment_month) AS first_prev_month,
    COALESCE(n3.revenue_per_month,0) AS first_prev_month_revenue,
    DATEADD(MONTH, -2, c.payment_month) AS second_prev_month,
    COALESCE(n4.revenue_per_month,0) AS second_prev_month_revenue,
FROM {{ ref('stg_customer_revenue_permonth') }} AS c
LEFT JOIN {{ ref('stg_customer_revenue_permonth') }} AS n1 ON n1.payment_month = DATEADD(MONTH, 1, c.payment_month) AND c.customer_id = n1.customer_id
LEFT JOIN {{ ref('stg_customer_revenue_permonth') }} AS n2 ON n2.payment_month = DATEADD(MONTH, 2, c.payment_month) AND c.customer_id = n2.customer_id
LEFT JOIN {{ ref('stg_customer_revenue_permonth') }} AS n3 ON n3.payment_month = DATEADD(MONTH, -1, c.payment_month) AND c.customer_id = n3.customer_id
LEFT JOIN {{ ref('stg_customer_revenue_permonth') }} AS n4 ON n4.payment_month = DATEADD(MONTH, -2, c.payment_month) AND c.customer_id = n4.customer_id
WHERE first_prev_month < c.last_month and second_prev_month < c.last_month
ORDER BY c.customer_id
