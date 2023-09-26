with
customers as (
    select * from {{ ref("stg_customers") }}
),

fct_orders as (
    select * from {{ ref('fct_orders') }}
),

customer_orders as (
    select 
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(order_id) as cnt_orders,
        sum(amount_dollars) as lifetime_value
    from fct_orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        co.first_order_date,
        co.last_order_date,
        coalesce(co.cnt_orders, 0) as cnt_orders,
        co.lifetime_value
    from customers
    left join customer_orders co 
        on customers.customer_id = co.customer_id
)

select * from final

