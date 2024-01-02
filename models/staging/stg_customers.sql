WITH customers_data AS (
    SELECT * FROM {{ source('sales_source_data', 'customers') }}
)

SELECT * FROM customers_data