-- "KPI REQUIREMENT" --

select * from pizza_table

-- Q1 CALCULATE TOTAL REVENUE OF PIZZA ORDERS
select sum(total_price) as total_revenue from pizza_table 

-- Q2 CALCULATE AVERAGE ORDER VALUE OF PIZZA ORDERS
select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_table

-- Q3 CALCULATE TOTAL PIZZA SOLD 
select sum(quantity) as total_pizza_sold from pizza_table

-- Q4 CALCULATE TOTAL ORDERS
select count(distinct order_id) as total_orders from pizza_table

-- Q5 CALCULATE AVERAGE PIZZA PER ORDER 
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2))as decimal(10,2))as avg_pizza_per_order 
from pizza_table
			
-- "CHARTS REQUIREMENT" --		

-- Q1 DAILY TREND FOR TOTAL ORDERS
SELECT extract(day from (TO_DATE('','YYYY-MM-DD')));

SELECT to_date(order_date, 'DD-MM-YYYY')
FROM pizza_table;

select to_char(DATE 'order_date', 'Day');

--Q2 MONTHLY TREND FOR TOTAL ORDERS
SELECT to_char(order_date, 'month') as month_name , count(distinct order_id)
from pizza_table
group by month_name

--Q3 PERCENTAGE OF SALES BY PIZZA CATEGORY
select pizza_category,sum(total_price),sum(total_price)*100/(select sum(total_price) from pizza_table) as percent_sales
from pizza_table 
group by pizza_category

--Q4 PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size,sum(total_price)*100/(select sum(total_price) from pizza_table) as percent_sales
from pizza_table 
group by pizza_size
order by percent_sales desc

--Q6 TOP 5 BEST SELLARS BY REVENUE,TOTAL QUANTITY AND TOTAL ORDERS
--BY REVENUE
select pizza_name,sum(total_price) as total_revenue
from pizza_table 
group by pizza_name
order by total_revenue desc
limit 5
-- BY TOTAL QUANTITY
select pizza_name,sum(quantity) as total_quantity
from pizza_table 
group by pizza_name
order by total_quantity desc
limit 5
-- BY TOTAL ORDERS 
select pizza_name,COUNT(distinct order_id) as total_orders
from pizza_table 
group by pizza_name
order by total_orders desc
limit 5

