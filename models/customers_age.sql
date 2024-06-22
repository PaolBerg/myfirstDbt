-- ~/.dbt/models/customers_age.sql

with customer_details as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        date_of_birth,
        TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
    from {{ ref('customers_raw') }}
)

select * from customer_details;
