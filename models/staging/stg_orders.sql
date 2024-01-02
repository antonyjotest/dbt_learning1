WITH orders_data AS (
    SELECT * FROM {{ source('sales_source_data', 'orders') }}
)

SELECT * FROM orders_data