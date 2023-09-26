with 
source as (
      select * from {{ source('stripe', 'payment') }}
),

renamed as (
    select 
        "ID" as payment_id,
        "ORDERID" as order_id,
        "PAYMENTMETHOD" as payment_method,
        "STATUS" as status,
        round(1.0 * "AMOUNT"/100, 3) as amount_dollars, 
        "CREATED" as created_at,
        "_BATCHED_AT" as batched_at
    from source
)

select * from renamed