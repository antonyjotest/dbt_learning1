WITH order_details AS (
    SELECT * FROM {{ ref('orders_data')}}
),

order_item_details AS (
    SELECT * FROM {{ ref('order_items_data')}}
),

sales_data AS (
    SELECT 
        o.ORDER_ID AS ORDER_ID,
        o.ORDER_STATUS AS ORDER_STATUS,
        o.ORDER_DATE AS ORDER_DATE,
        o.REQUIRED_DATE AS REQUIRED_DATE,
        o.SHIPPED_DATE AS SHIPPED_DATE,
        o.CUSTOMER_ID AS CUSTOMER_ID,
        o.CUSTOMER_NAME AS CUSTOMER_NAME,
        o.STAFF_ID AS STAFF_ID,
        o.STAFF_NAME AS STAFF_NAME,
        o.STORE_ID AS STORE_ID,
        o.STORE_NAME AS STORE_NAME,

        oi.ITEM_ID AS ITEM_ID,
        oi.QUANTITY AS QUANTITY,
        oi.LIST_PRICE AS LIST_PRICE,
        oi.DISCOUNT AS DISCOUNT,
        oi.PRODUCT_NAME AS PRODUCT_NAME,
        oi.PRODUCT_LIST_PRICE AS PRODUCT_LIST_PRICE,
        oi.MODEL_YEAR AS MODEL_YEAR,
        oi.PRODUCT_AVAIL_QUANTITY AS PRODUCT_AVAIL_QUANTITY,
        oi.BRAND_ID AS BRAND_ID,
        oi.BRAND_NAME AS BRAND_NAME,
        oi.CATEGORY_ID AS CATEGORY_ID,
        oi.CATEGORY_NAME AS CATEGORY_NAME

        FROM order_details AS o
        LEFT JOIN order_item_details AS oi using(order_id)
)

SELECT * FROM sales_data
