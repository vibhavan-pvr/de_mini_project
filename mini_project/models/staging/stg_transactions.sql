WITH date_formatted AS (
    SELECT DISTINCT
        customer_id,
        product_id,
        TO_CHAR(payment_month, 'MM-DD-YYYY') AS payment_month_wrong,
        TO_DATE(payment_month_wrong, 'DD-MM-YYYY') AS payment_month,
        CAST(revenue_type AS INT) AS revenue_type,
        revenue,
        quantity
    FROM {{ source('DBT_PROJECT','TRANSACTIONS') }}
    WHERE customer_id IS NOT NULL
    ORDER BY payment_month
)
SELECT
    customer_id,
    product_id,
    payment_month,
    revenue_type,
    revenue,
    quantity
from date_formatted