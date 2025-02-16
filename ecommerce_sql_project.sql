-- Create Database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Customers Table
CREATE TABLE Customers (
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100),
    SignupDate DATE,
    Email VARCHAR(100) UNIQUE
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Shipping Table
CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ShippingDate DATE,
    DeliveryStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Sample Data
INSERT INTO Customers (Name, Location, SignupDate, Email) VALUES
('John Doe', 'New York', '2023-01-15', 'john.doe@email.com'),
('Jane Smith', 'Los Angeles', '2023-02-20', 'jane.smith@email.com');

INSERT INTO Products (Name, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 599.99, 100);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, PaymentMethod) VALUES
(1, '2024-01-05', 999.99, 'Credit Card'),
(2, '2024-01-10', 599.99, 'PayPal');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1, 999.99),
(2, 2, 1, 599.99);

INSERT INTO Shipping (OrderID, ShippingDate, DeliveryStatus) VALUES
(1, '2024-01-07', 'Delivered'),
(2, '2024-01-12', 'Shipped');

-- SQL Queries for Analysis

-- Retrieve all customers who placed an order
SELECT DISTINCT C.Name, C.Email FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

-- Top-selling products
SELECT P.Name, SUM(OD.Quantity) AS TotalSold FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.Name
ORDER BY TotalSold DESC
LIMIT 5;

-- Monthly Revenue Trends
SELECT MONTH(OrderDate) AS Month, SUM(TotalAmount) AS Revenue FROM Orders
GROUP BY Month
ORDER BY Month;

-- High-value customers
SELECT C.Name, SUM(O.TotalAmount) AS TotalSpent FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.Name
ORDER BY TotalSpent DESC
LIMIT 5;
