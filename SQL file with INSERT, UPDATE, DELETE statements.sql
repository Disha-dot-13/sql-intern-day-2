use intern_1;
CREATE TABLE Superstore_Sales (
    Row_ID INT IDENTITY(1,1) PRIMARY KEY,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(20),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(50),
    Segment VARCHAR(20),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(20),
    Product_ID VARCHAR(20),
    Category VARCHAR(20),
    Sub_Category VARCHAR(20),
    Product_Name VARCHAR(200),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
INSERT INTO Superstore_Sales (
    Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, 
    Segment, Country, City, State, Postal_Code, Region, Product_ID, 
    Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit
)
VALUES

('CA-2020-100004', '2020-01-12', '2020-01-15', 'Standard Class', 'AB-10015', 'Adam Bell',
 'Consumer', 'United States', 'New York', 'New York', 10001, 'East', 'OFF-PA-10000122',
 'Office Supplies', 'Paper', 'Multi-purpose Printer Paper', 32.00, 4, 0.00, 9.50),

('CA-2020-100005', '2020-01-14', '2020-01-18', 'Second Class', 'KS-20045', 'Karen Smith',
 'Corporate', 'United States', 'Chicago', 'Illinois', 60601, 'Central', 'FUR-TA-10001584',
 'Furniture', 'Tables', 'Bretford Rectangular Table', 450.00, 1, 0.20, -50.00),

('US-2020-100006', '2020-01-17', '2020-01-20', 'Standard Class', 'GH-19851', 'George Hill',
 'Home Office', 'United States', 'Houston', 'Texas', 77001, 'South', 'TEC-CO-10001001',
 'Technology', 'Copiers', 'Canon Office Copier C-200', 899.00, 1, 0.00, 200.00),

('US-2020-100007', '2020-01-18', '2020-01-22', 'Standard Class', 'MC-14562', 'Mary Carter',
 'Consumer', 'United States', 'Boston', 'Massachusetts', 02108, 'East', 'OFF-AR-10000541',
 'Office Supplies', 'Art', 'Inkjet Graphic Pens - Pack of 12', 18.75, 3, 0.00, 4.25),

('CA-2020-100008', '2020-01-20', '2020-01-23', 'Standard Class', 'RR-20330', 'Ryan Russell',
 'Corporate', 'United States', 'Miami', 'Florida', 33101, 'South', 'TEC-AC-10004522',
 'Technology', 'Accessories', 'Wireless Keyboard & Mouse Combo', 49.99, 2, 0.05, 8.00);
 SELECT * FROM Superstore_Sales;

 INSERT INTO Superstore_Sales (
    Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name,
    Segment, Country, City, State, Postal_Code, Region, Product_ID,
    Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit
)
VALUES
('CA-2020-200002', '2020-03-02', '2020-03-06', 'Second Class', 'AR-13005', 'Alice Ray',
 'Consumer', 'United States', 'Chicago', 'Illinois', 60601, 'Central', 'TEC-AC-10004533',
 'Technology', 'Accessories', 'Wireless USB Adapter', 25.00, 1, 0.05, 2.80),

('US-2020-200003', '2020-03-03', '2020-03-07', 'Standard Class', 'BM-19875', 'Brian Morris',
 'Corporate', 'United States', 'Dallas', 'Texas', 75001, 'South', 'FUR-TA-10007800',
 'Furniture', 'Tables', 'Small Wooden Study Table', 149.00, 1, 0.00, 20.00);

 DELETE FROM Superstore_Sales
 WHERE Row_ID =6;

 ALTER TABLE Superstore_Sales
ALTER COLUMN Customer_Name VARCHAR(50) NULL;

ALTER TABLE Superstore_Sales
ALTER COLUMN City VARCHAR(50) NULL;

ALTER TABLE Superstore_Sales
ALTER COLUMN Postal_Code INT NULL;

ALTER TABLE Superstore_Sales
ALTER COLUMN Product_Name VARCHAR(200) NULL;

ALTER TABLE Superstore_Sales
ALTER COLUMN Sales DECIMAL(10,2) NULL;

ALTER TABLE Superstore_Sales
ALTER COLUMN Profit DECIMAL(10,2) NULL;

INSERT INTO Superstore_Sales
(Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name,
 Segment, Country, City, State, Postal_Code, Region,
 Product_ID, Category, Sub_Category, Product_Name,
 Sales, Quantity, Discount, Profit)
VALUES
('CA-2020-200100', '2020-03-15', '2020-03-20', 'Standard Class', 'AA-10010',
 NULL,   -- Missing Customer Name
 'Consumer', 'United States', 'Chicago', 'Illinois', NULL, 'Central',
 'OFF-PA-10002020', 'Office Supplies', 'Paper', NULL,  -- Missing Product Name
 140.50, 3, 0.05, NULL),                               -- Missing Profit

('US-2020-200101', '2020-03-18', '2020-03-22', 'Second Class', NULL,
 'John Carter', 'Corporate', 'United States', NULL, 'California', 90001, 'West',
 'TEC-AC-10003433', 'Technology', 'Accessories', 'Laptop Sleeve',
 NULL, 1, 0.00, 20.00);                               -- Missing Sales

 select * from Superstore_Sales
UPDATE Superstore_Sales SET Customer_Name = 'Unknown' WHERE Customer_Name IS NULL;
UPDATE Superstore_Sales SET Customer_ID = 'Unknown' WHERE Customer_ID IS NULL;
UPDATE Superstore_Sales SET City = 'Unknown' WHERE City IS NULL;

UPDATE Superstore_Sales SET Postal_Code = 0 WHERE Postal_Code IS NULL;
UPDATE Superstore_Sales SET Product_Name = 'Unknown Product' WHERE Product_Name IS NULL;
UPDATE Superstore_Sales
SET Sales = (SELECT AVG(Sales) FROM Superstore_Sales)
WHERE Sales IS NULL;
UPDATE Superstore_Sales
SET Profit = (SELECT AVG(Profit) FROM Superstore_Sales)
 WHERE Profit IS NULL;

 select * from Superstore_Sales;

 UPDATE Superstore_Sales
 SET State='NEW YORK'
 WHERE Row_ID=5;

 DELETE FROM Superstore_Sales
 WHERE Row_ID =4;

 select sales,Order_ID 
 from
 Superstore_Sales
 where sales>200;