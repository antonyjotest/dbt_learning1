WITH staffs_data AS (
    SELECT * FROM {{ source('sales_source_data', 'staffs') }}
)

SELECT * FROM staffs_data