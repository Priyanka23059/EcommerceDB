CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(255));
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- customers 
INSERT INTO Customers (Name, Email, Address) VALUES
('Priya Sharma', 'priya@example.com', 'Kakinada'),
('Ravi Kumar', 'ravi@example.com', 'Hyderabad');

-- Products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Laptop', 55000.00, 10),
('Mobile Phone', 20000.00, 25),
('Headphones', 1500.00, 50);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2025-09-20'),
(2, '2025-09-21');

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 3, 2),   
(2, 2, 1);  

SELECT o.OrderID, c.Name AS CustomerName, p.ProductName, od.Quantity, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID; 



    
    