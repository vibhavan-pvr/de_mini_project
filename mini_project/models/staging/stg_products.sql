SELECT DISTINCT
    product_id,
    product_family,
    product_sub_family
FROM {{ source('DBT_PROJECT','PRODUCTS') }}
WHERE product_id IS NOT NULL
