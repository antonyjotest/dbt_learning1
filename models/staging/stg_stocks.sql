WITH stocks_data AS (
    SELECT * FROM {{ source('production_source_data', 'stocks') }}
)

SELECT * FROM stocks_data