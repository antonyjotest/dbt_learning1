WITH categories_data AS (
    SELECT * FROM {{ source('production_source_data', 'categories') }}
)

SELECT * FROM categories_data