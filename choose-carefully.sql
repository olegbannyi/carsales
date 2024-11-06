with
ProductSales as
(
    select p.model, 
        p.price,
        sum(s.total_price) as total_sale_per_model,
        i.quantity as inventory_per_model
from products p
join inventory i  on i.product_id = p.product_id
join sales s  on s.product_id = p.product_id
group by p.model, p.price, inventory_per_model
)
select model, price,  total_sale_per_model, inventory_per_model,
    total_sale_per_model / inventory_per_model as  sales_inventory_ratio
from ProductSales
order by sales_inventory_ratio desc;
