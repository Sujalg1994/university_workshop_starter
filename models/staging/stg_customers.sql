with customers as (
    select * from {{ ref('raw_customers') }}
)

select 
    ID as customer_id,
    NAME as full_name
from customers