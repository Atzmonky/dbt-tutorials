with 
source as (
      select * from {{ source('jaffle_shop', 'orders') }}
),

renamed as (
    select 
        "ID" as id,
        "USER_ID" as user_id,
        "ORDER_DATE" as order_date,
        "STATUS" as status,
        "_ETL_LOADED_AT" as etl_loaded_at
    from source
)

select * from renamed