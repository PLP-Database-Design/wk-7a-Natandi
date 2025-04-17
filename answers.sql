-- Question 1: Transform the products column into 1NF ensuring that each row represents a single product for an order

SELECT 
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n), ',', -1)) AS Product
FROM 
    ProductDetail
JOIN 
    numbers ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n - 1
ORDER BY OrderID;


-- Question 2: Write an SQL query to transform the orderDetails table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
