with raw_addresses as (
    select * from {{ source('flower_shop_raw', 'raw_addresses') }}
)

select * from raw_addresses
