# E-Commerce Sales Analysis (SQL Project)

## 📌 Project Overview
This SQL-based project analyzes sales trends, customer behavior, and product performance for an e-commerce business. The database includes customer orders, product details, and shipping information to generate valuable insights.

## 📂 Database Schema
The project consists of the following tables:
1. **Customers** – Stores customer information.
2. **Products** – Contains product details.
3. **Orders** – Records order transactions.
4. **OrderDetails** – Links orders with products.
5. **Shipping** – Tracks order shipments.

## 🔹 Features & Insights
- Identify **top-selling products** and sales trends.
- Analyze **customer spending patterns** and high-value customers.
- Track **monthly revenue** and order statistics.
- Optimize inventory management and marketing strategies.


## 📊 Sample SQL Queries
- **Retrieve all customers who placed an order**
   ```sql
   SELECT DISTINCT C.Name, C.Email FROM Customers C
   JOIN Orders O ON C.CustomerID = O.CustomerID;
   ``` 
📌 **GitHub:** [Your GitHub Profile](https://github.com/sasankchintham/)

