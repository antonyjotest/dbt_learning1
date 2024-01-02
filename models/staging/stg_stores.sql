WITH stores_data AS (
    SELECT * FROM {{ source('sales_source_data', 'stores') }}
)
SELECT * FROM stores_data