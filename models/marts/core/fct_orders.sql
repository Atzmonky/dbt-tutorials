with 
orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select 
        order_id,
        sum(case when status = 'success' then amount_usd end) as amount_usd
    from payments
    group by 1
),

final as ( 
    select 
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        coalesce(op.amount_usd, 0) as amount_usd
    from orders o
    left join order_payments op 
        on op.order_id = o.order_id
)

select * from final
order by order_id asc
