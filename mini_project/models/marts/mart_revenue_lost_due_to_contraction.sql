WITH products_churned AS (
    SELECT 
        COUNT(product_id) as products_churned,
        SUM(revenue) AS revenue_lost_due_to_contraction
    FROM {{ ref('stg_customers_churned') }}
),
down_sales AS (
    SELECT
        SUM(loss) AS down_sales
    FROM {{ ref('stg_revenue_loss_customers') }}
)
SELECT
    *  
FROM products_churned
FULL JOIN down_sales