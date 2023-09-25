with 
source as (
      select * from {{ source('stripe', 'payment') }}
),

renamed as (
    select 
        "ID" as id,
        "ORDERID" as order_id,
        "PAYMENTMETHOD" as payment_method,
        "STATUS" as status,
        "AMOUNT" as amount, 
        "CREATED" as created_at,
        "_BATCHED_AT" as batched_at
    from source
)

select * from renamed