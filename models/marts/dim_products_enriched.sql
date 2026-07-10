with products as (
    select * from {{ ref('stg_products') }}
),

supply_costs as (
    select * from {{ ref('int_supply_costs_per_sku') }}
),

enriched as (
    select
        products.product_id,
        products.product_name,
        products.product_type,
        products.price,
        products.description,
        -- coalesce: products with no linked supplies should cost/margin as 0/full price, not null
        coalesce(supply_costs.total_supply_cost, 0) as total_supply_cost,
        coalesce(supply_costs.perishable_supply_cost, 0) as perishable_supply_cost,
        coalesce(supply_costs.non_perishable_supply_cost, 0) as non_perishable_supply_cost,
        products.price - coalesce(supply_costs.total_supply_cost, 0) as product_margin
    from products
    left join supply_costs on products.product_id = supply_costs.sku
)

select * from enriched
