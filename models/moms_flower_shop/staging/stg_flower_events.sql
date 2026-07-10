with raw_website_events as (
    select * from {{ source('flower_shop_raw', 'raw_website_events') }}
)

select * from raw_website_events
