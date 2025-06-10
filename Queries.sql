-- queries solution 

-- basic:

-- Q1. Retrieve the total number of orders placed.
select count(order_id) from orders;

-- Q2. Calculate the total revenue generated from pizza sales.
select round(sum(od.quantity*p.price),2) as "Total revenue" from pizzas as p
JOIN pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
join order_details as od on p.pizza_id=od.pizza_id

;

-- Q3. Identify the highest-priced pizza by size.
select pt.name as "Pizza Name ",p.size as "Size", p.price as "Price" from pizzas as p
JOIN pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
order by p.price DESC
limit 3
;

-- Q4. Identify the most common pizza size ordered.
select count(pt.name) as "Name" ,p.size
from pizzas as p
join pizza_types as pt on pt.pizza_type_id=p.pizza_type_id
group by p.size
order by count(p.size) DESC
limit 1
;

-- Q5. List the top 5 most ordered pizza types along with their quantities.
select pt.name AS "Pizza Name", sum(od.quantity) as "Quantity" from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on p.pizza_id=od.pizza_id
group by pt.name 
order by sum(od.quantity) DESC
limit 5
;

-- Intermediate:

-- Q6. Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category AS "Pizza Category", sum(od.quantity) as "Quantity" from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on p.pizza_id=od.pizza_id
group by pt.category
order by Quantity DESC
;

-- Q7. Determine the distribution of orders by hour of the day.
select hour(od_time) as "Time",count(order_id) as "Order Count" from orders 
group by Time
order by count(order_id) DESC
;

-- Q8. Join relevant tables to find the category-wise distribution of pizzas.
select category,count(name) as "Name" from pizza_types
group by category
order by count(Name) DESC
;

-- Q9. Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity),0) as avg_pizza from
(select o.od_date,sum(od.quantity) as quantity from orders as o
join order_details as od on o.order_id=od.order_id
group by o.od_date) as order_q;


-- Q10. Determine the top 3 most ordered pizza types based on revenue.
select pt.name,sum(od.quantity*p.price) as Revenue from pizza_types as pt 
join pizzas as p on pt.pizza_type_id=p.pizza_type_id
join order_details as od on p.pizza_id=od.pizza_id
group by pt.name
order by revenue DESC
limit 3
;

-- Advanced:
-- Q11. Calculate the percentage contribution of each pizza type to total revenue.
select pt.category , 
round((sum(od.quantity*p.price) /(select round(sum(od.quantity*p.price),2) as total_sales from order_details as od
join pizzas as p on od.pizza_id=p.pizza_id
))*100,2) as Total_Revenue
from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.category
order by Total_Revenue
;

-- Q12. Analyze the cumulative revenue generated over time.
select od_date,
sum(revenue) over(order by od_date) as cummulative_revenue from 
(select o.od_date,round(sum(p.price*od.quantity),2) as revenue from pizzas as p
join order_details as od on od.pizza_id=p.pizza_id
join orders as o on o.order_id=od.order_id
group by o.od_date) as sales
;


-- Q13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT * 
FROM (
    SELECT 
        pt.category, 
        pt.name, 
        ROUND(SUM(p.price * od.quantity), 2) AS revenue, 
        RANK() OVER (PARTITION BY pt.category ORDER BY ROUND(SUM(p.price * od.quantity), 2) DESC) AS rn
    FROM pizza_types AS pt
    JOIN pizzas AS p ON p.pizza_type_id = pt.pizza_type_id
    JOIN order_details AS od ON od.pizza_id = p.pizza_id
    GROUP BY pt.name, pt.category
) AS RankedData
WHERE rn <= 3;


