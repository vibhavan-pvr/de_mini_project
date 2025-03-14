SELECT
    year(payment_month) as year,
    COUNT(*) AS customers_added
FROM {{ ref('stg_transaction_lm') }}
WHERE first_prev_month_revenue = 0 AND second_prev_month_revenue = 0
group by year