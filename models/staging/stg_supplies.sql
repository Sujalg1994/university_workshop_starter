with supplies as (
    select * from {{ ref('raw_supplies') }}
)

select 
    id as supply_id,
    name as supply_name,
    cost,
    perishable,
    sku as product_id
from supplies