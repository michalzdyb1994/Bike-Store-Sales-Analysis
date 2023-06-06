select
ord.order_id, 
pro.product_name,
bra.brand_name, 
CONCAT(cus.first_name, ' ', cus.last_name) as customer_name, 
cat.category_name, 
SUM(ite.quantity * ite.list_price) as 'revenue',
SUM(ite.quantity) as 'total_units',
ord.order_date, 
sto.store_name, 
cus.state, 
CONCAT(sta.first_name, ' ', sta.last_name) as sales_rep
FROM
production.products pro
join production.brands bra on
pro.brand_id = bra.brand_id
join production.categories cat ON
cat.category_id = pro.category_id
join sales.order_items ite ON
ite.product_id = pro.product_id
join sales.orders ord ON
ord.order_id = ite.order_id
join sales.stores sto ON
sto.store_id = ord.store_id
join sales.staffs sta ON
sta.staff_id = ord.staff_id
join sales.customers cus ON
cus.customer_id = ord.customer_id

GROUP BY 
ord.order_id,
pro.product_name,
bra.brand_name, 
cat.category_name,
ord.order_date,
sto.store_name, 
cus.state,
CONCAT(sta.first_name, ' ', sta.last_name),
CONCAT(cus.first_name, ' ', cus.last_name) 