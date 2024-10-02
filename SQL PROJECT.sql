-- create database pizzahut;

-- SELECT * FROM pizzahut.pizzas;

-- SELECT * FROM pizzahut.pizza_types;

/*CREATE TABLE pizzahut.orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));*/

 -- SELECT * FROM pizzahut.orders;
 
/*CREATE TABLE pizzahut.order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id));
SELECT * FROM pizzahut.order_details;*/

-- 1) Retrieve the total number of orderplaced
 -- SELECT COUNT(order_id) AS total_orders FROM pizzahut.orders ;

-- 2) Calculate the total revenue generated from pizza sales.
/*SELECT ROUND(SUM(P.price * O.quantity),2) AS total_sales 
FROM pizzahut.pizzas AS P
JOIN pizzahut.order_details AS O
ON P.pizza_id=O.pizza_id;*/

-- 3) Identify the highest-priced pizza.
/*SELECT pizza_types.name , pizzas.price
FROM pizza_types 
JOIN pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;*/

-- 4) Identify the most common pizza size ordered.
/*SELECT quantity, count(order_details_id)
from order_details
group by quantity;*/

/*SELECT pizzas.size , COUNT(order_details.order_details_id)
FROM pizzas JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
Group by pizzas.size;*/

-- 5) List the top 5 most ordered pizza types along with their quantities.
# quantiy = order_details table
# most ordered pizza = pizza_types table
# pizza table is common for both tables

/*SELECT pizza_types.name ,
sum(order_details.quantity) AS quantity
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
Join order_details
ON order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
*/


-- 6) Join the necessary tables to find the total quantity of each pizza category ordered.
/*SELECT  pizza_types.category AS category ,
SUM(order_details.quantity) AS quantity
FROM pizza_types JOIN pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
On order_details.pizza_id = pizzas.pizza_id
Group by category
Order by quantity DESC;*/


-- 7) Determine the distribution of orders by hour of the day.
-- SELECT * From orders

/*Select hour(order_time) AS hour, count(order_id) As order_count From orders
group by hour(order_time);*/


-- 8) Join relevant tables to find the category-wise distribution of pizzas.
/*SELECT category , count(name)
from pizza_types
group by category;*/



-- -- 9) Group the orders by date and
--  calculate the average number of pizzas ordered per day.

/*select round(AVG(quantity),0) From 
(SELECT orders.order_date , sum(order_details.quantity) AS quantity
FROM orders Join order_details
ON orders.order_id = order_details.order_id
group by orders.order_date) AS data ;*/




-- 10) Determine the top 3 most ordered pizza types based on revenue.

/*select pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name 
order by revenue desc
limit 3;*/











































