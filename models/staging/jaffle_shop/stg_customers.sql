with
    customers as (

        select id as customer_id, first_name, last_name

        from {{ source("jaffle_shop", "CUSTOMERS") }}

    ),
    final_data as (
        select
            customers.customer_id,
            customers.first_name,
            customers.last_name,
            case
                when employees.employee_id = 1 then 'employee' else 'not employee'
            end as is_employee
        from customers
        left outer join
            {{ ref("employees") }} employees
            on customers.customer_id = employees.customer_id
    )
select * from final_data
