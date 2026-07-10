with raw_marketing_campaign_events as (
    select * from {{ source('flower_shop_raw', 'raw_marketing_campaign_events') }}
)

select * from raw_marketing_campaign_events
