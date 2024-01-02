WITH staff_details AS (
    SELECT staff_id, first_name FROM {{ ref('stg_staffs')}}
),

store_details AS (
    SELECT store_id, store_name FROM {{ ref('stg_stores')}}
),

customer_details AS (
    SELECT customer_id, first_name FROM {{ ref('stg_customers')}}
),

order_details AS (
    SELECT * FROM {{ ref('stg_orders')}}
),

-- SELECT * FROM order_details

ordered_details AS (
    SELECT 
        od.*,
        cd.first_name AS customer_name,
        sta.first_name AS staff_name,
        sto.store_name AS store_name
        FROM order_details AS od
        LEFT JOIN customer_details AS cd using(customer_id)
        LEFT JOIN staff_details AS sta using(staff_id)
        LEFT JOIN store_details AS sto using(store_id)
)

SELECT * FROM ordered_details






