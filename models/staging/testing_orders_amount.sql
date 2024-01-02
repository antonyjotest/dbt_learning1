WITH order_item_details AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

SELECT
    order_id,
    SUM(list_price) AS total_amount
    FROM order_item_details
    GROUP BY 1
    HAVING total_amount < 0
