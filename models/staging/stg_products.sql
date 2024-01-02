WITH products_data AS (
    SELECT * FROM {{ source('production_source_data', 'products') }}
)

SELECT * FROM products_data