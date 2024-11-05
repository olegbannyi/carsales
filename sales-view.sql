create index customer_sales_product
on sales(customer_id, product_id);

create view sales_summary as
select p.model, sum(s.quantity) as total_sold
from sales s
join  products p on s.product_id = p.product_id
group by p.model
order by total_sold desc;

select * from sales_summary;
