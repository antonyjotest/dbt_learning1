WITH order_items_data AS (
    SELECT * FROM dbt.sales.order_items
)

SELECT * FROM order_items_data