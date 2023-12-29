WITH orders_data AS (
    SELECT * FROM dbt.sales.orders
)

SELECT * FROM orders_data