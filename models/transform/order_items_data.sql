WITH brand_details AS (
    SELECT * FROM {{ ref('stg_brands')}}
),

category_details AS (
    SELECT * FROM {{ ref('stg_categories')}}
),

stock_details AS (
    SELECT * FROM {{ ref('stg_stocks')}}
),

product_details AS (
    SELECT * FROM {{ ref('stg_products')}}
),

order_item_details AS (
    SELECT * FROM {{ ref('stg_order_items')}}
),

product_and_stock_details AS (
    SELECT 
        p.*,
        sto.store_id,
        sto.quantity
        -- b.brand_name,
        -- c.category_name
        FROM product_details AS p
        LEFT JOIN stock_details AS sto using(product_id)
        -- LEFT JOIN brand_details AS b using(brand_id)
        -- LEFT JOIN category_details AS c using(category_id)
),

product_all_details AS (
    SELECT 
        p.*,
        b.brand_name,
        c.category_name
        FROM product_and_stock_details AS p
        LEFT JOIN brand_details AS b using(brand_id)
        LEFT JOIN category_details AS c using(category_id)
),

order_item_all_details AS (
    SELECT 
        oi.*,
        p.product_name AS product_name,
        p.list_price AS product_list_price,
        p.model_year AS model_year,
        p.store_id AS store_id,
        p.quantity AS product_avail_quantity,
        p.brand_id AS brand_id,
        p.brand_name AS brand_name,
        p.category_id AS category_id,
        p.category_name AS category_name
        FROM order_item_details AS oi
        LEFT JOIN product_all_details AS p using(product_id)
)

SELECT * FROM order_item_all_details




