with 
source as (
    select * from {{ source('jaffle_shop', 'orders') }}
),

renamed as (
    select 
        "ID" as order_id,
        "USER_ID" as customer_id,
        date("ORDER_DATE") as order_date,
        "STATUS" as status,
        "_ETL_LOADED_AT" as etl_loaded_at
    from source
)

select * from renamed