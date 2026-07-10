with products as (
    select * from {{ ref('raw_products') }}
)

select 
    sku as product_id,
    name as product_name,
    type as product_type,
    price,
    description
from products