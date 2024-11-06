with
EmployeeSales as
(
    select concat(e.first_name, ' ', e.last_name) as employee_name,
        e.position,
        date_format(s.sale_date, "%M %Y") as month_year,
        s.total_price
    from employees as e
    join
        sales as s on e.employee_id = s.employee_id
),
EmployeeSalesTotalPerMonth as
(
    select employee_name,
            position, 
            month_year,
            sum(total_price) total_price
    from EmployeeSales
    group by  employee_name, position, month_year
),
EmployeeSalesPercentage as
(
    select es.employee_name,
            es.position, 
            es.month_year,
            es.total_price * 100 / (
                select sum(total_price) from EmployeeSalesTotalPerMonth
                where  month_year = es.month_year
            ) as percent_of_total 
    from EmployeeSalesTotalPerMonth es
)
select employee_name, position, month_year,
    case
        when percent_of_total <  5 then 0
        when  percent_of_total >= 5 and percent_of_total < 10 then 2000
        when  percent_of_total >= 10 and percent_of_total < 20 then 5000
        when  percent_of_total >= 20 and percent_of_total < 30 then 10000
        when  percent_of_total >= 30 and percent_of_total < 40 then 15000
        when  percent_of_total >= 40 then 25000
    end as employee_bonus
from EmployeeSalesPercentage
where position = 'Sales Associate';
