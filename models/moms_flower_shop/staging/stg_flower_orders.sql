with raw_flower_orders as (
    select * from {{ source('flower_shop_raw', 'raw_flower_orders') }}
)

select * from raw_flower_orders
