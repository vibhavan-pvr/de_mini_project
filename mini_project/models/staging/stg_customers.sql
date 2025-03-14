SELECT DISTINCT
    customer_id,
    customername AS customer_name
FROM {{source('DBT_PROJECT','CUSTOMERS')}}
WHERE customer_id IS NOT NULL
ORDER BY customer_id