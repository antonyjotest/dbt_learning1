WITH order_items_data AS (
    SELECT * FROM {{ source('sales_source_data', 'order_items') }}
)

SELECT * FROM order_items_data