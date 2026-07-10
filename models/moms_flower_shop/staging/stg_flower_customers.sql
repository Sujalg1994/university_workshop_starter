with raw_customers as (
    select * from {{ source('flower_shop_raw', 'raw_customers') }}
)

select * from raw_customers
