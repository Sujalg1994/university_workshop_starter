with items as (
    select * from {{ ref('stg_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('dim_products_enriched') }}
),

stores as (
    select * from {{ ref('stg_stores') }}
),

order_items as (
    select
        items.item_id,
        items.order_id,
        orders.customer_id,
        orders.store_id,
        stores.store_name,
        items.sku as product_id,
        products.product_name,
        products.product_type,
        orders.ordered_at,
        products.price as item_revenue,
        products.total_supply_cost as item_cost,
        products.perishable_supply_cost as item_perishable_cost,
        products.non_perishable_supply_cost as item_non_perishable_cost,
        products.price - products.total_supply_cost as item_gross_margin
    from items
    left join orders on items.order_id = orders.order_id
    left join products on items.sku = products.product_id
    left join stores on orders.store_id = stores.store_id
)

select * from order_items
