SELECT
    COUNT(*) AS customer_churned
FROM {{ ref('stg_transaction_lm') }}
WHERE first_next_month_revenue = 0 AND second_next_month_revenue = 0
