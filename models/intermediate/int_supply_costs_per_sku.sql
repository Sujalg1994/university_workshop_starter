with supplies as (
    select * from {{ ref('stg_supplies') }}
),

aggregated as (
    select
        product_id as sku,
        sum(cost) as total_supply_cost,
        sum(case when perishable then cost else 0 end) as perishable_supply_cost,
        sum(case when not perishable then cost else 0 end) as non_perishable_supply_cost
    from supplies
    group by product_id
)

select * from aggregated
