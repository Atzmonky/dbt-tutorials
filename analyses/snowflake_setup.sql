SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = 'JAFFLE_SHOP'; -- or STRIPE

select * from stripe.payment;
select * from jaffle_shop.customers;
select * from jaffle_shop.orders;