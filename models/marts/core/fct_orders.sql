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
        sum(case when status = 'success' then amount_dollars end) as amount_dollars
    from payments
    group by 1
),

final as ( 
    select 
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        coalesce(op.amount_dollars, 0) as amount_dollars
    from orders o
    left join order_payments op 
        on op.order_id = o.order_id
)

select * from final

