with items as (
    select * from {{ ref('raw_items') }}
)

select 
    id as item_id,
    order_id,
    sku
from items