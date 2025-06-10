# 🍕 Pizza Sales Analysis with MySQL

## 📌 Overview
This project analyzes pizza sales using MySQL queries ranging from basic to advanced. It provides insights into orders, revenue, pizza popularity, and more.

## 📂 Dataset
The database consists of four main tables, defining pizza sales transactions:

1. **orders**  
   - `order_id` (INT) – Unique identifier for each order  
   - `od_date` (DATE) – Order date  
   - `od_time` (TIME) – Order time  

2. **order_details**  
   - `order_details_id` (INT) – Unique identifier for each order detail  
   - `order_id` (INT) – Links to the orders table  
   - `pizza_id` (VARCHAR) – Identifies the pizza ordered  
   - `quantity` (INT) – Number of pizzas ordered  

3. **pizzas**  
   - `pizza_id` (VARCHAR) – Unique identifier for the pizza  
   - `pizza_type_id` (VARCHAR) – Links to the pizza_types table  
   - `size` (VARCHAR) – Pizza size (Small, Medium, Large)  
   - `price` (FLOAT) – Price of the pizza  

4. **pizza_types**  
   - `pizza_type_id` (VARCHAR) – Unique identifier for the pizza type  
   - `name` (VARCHAR) – Name of the pizza  
   - `category` (VARCHAR) – Category of the pizza (Veg, Non-Veg, etc.)  
   - `ingredients` (VARCHAR) – List of ingredients  

These tables are **linked through foreign keys**, ensuring relational integrity while enabling comprehensive analysis of orders, revenue, and pizza popularity.

## 🛠️ Queries Implemented
The project contains SQL queries categorized into **basic**, **intermediate**, and **advanced** levels, solving different business questions:
- **Basic:** Total orders, revenue, highest-priced pizza, most common pizza size, etc.
- **Intermediate:** Orders by hour, category-wise distribution, average pizza orders per day, etc.
- **Advanced:** Percentage contribution to revenue, cumulative revenue over time, top-selling pizzas per category.

## 💡 Insights
Some interesting findings from the queries:
- The **most common pizza size** ordered.
- The **top 3 highest revenue-generating pizzas**.
- The **distribution of orders by time of day**.
- The **category-wise contribution to total revenue**.

## 🚀 Getting Started
To run the queries:
1. Set up MySQL.
2. Import the dataset.
3. Run the SQL scripts provided.

## 🤝 Contributions
Feel free to fork this repository, suggest improvements, and contribute!

---
Happy coding! 🍕🚀
