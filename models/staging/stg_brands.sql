WITH brands_data AS (
    SELECT * FROM {{ source('production_source_data', 'brands') }}
)

SELECT * FROM brands_data