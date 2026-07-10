with stores as (
    select * from {{ ref('raw_stores') }}
)

select 
    id as store_id,
    name as store_name,
    opened_at,
    tax_rate
from stores