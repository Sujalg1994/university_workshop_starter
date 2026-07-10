with orders as (
    select * from {{ ref('raw_orders') }}
)

select 
    ID as order_id,
    CUSTOMER as customer_id,
    ORDERED_AT as ordered_at,
    STORE_ID as store_id,
    SUBTOTAL as subtotal,
    TAX_PAID as tax_paid,
    ORDER_TOTAL as order_total
from orders