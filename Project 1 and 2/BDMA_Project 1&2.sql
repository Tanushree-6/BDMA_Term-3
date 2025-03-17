-- Part A of Project (Creating database and Tables and then inserting dummy values in it and then creating ERD diagram for the same)
CREATE DATABASE rbtn_AgriMarketplace;
USE rbtn_AgriMarketplace;
-- Create table for Farmers
CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY AUTO_INCREMENT,
    FarmerName VARCHAR(40) NOT NULL,
    ContactNumber VARCHAR(40) NOT NULL,
    Address VARCHAR(30) NOT NULL
);
-- Create the Buyer table 
CREATE TABLE Buyer (
    BuyerID INT PRIMARY KEY AUTO_INCREMENT,
    BuyerName VARCHAR(40),
    BuyerEmail VARCHAR(40),
    BuyerPhone VARCHAR(30)
);
-- Create the Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(60),
    ProductCategory VARCHAR(80),
    ProductPrice INT
);
-- Create the Order table with OrderID, OrderDate, BuyerID, and ProductID
CREATE TABLE `Order` (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATETIME,
    BuyerID INT,
    ProductID INT,
    Quantity INT,
    TotalPrice INT,
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
-- Create the OrderDetails table 
CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    TotalPrice INT,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
-- Create the Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    TransactionAmount INT,
    TransactionDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);
-- Create the Reviews table 
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    BuyerID INT,
    ReviewText TEXT,
    Rating INT,
    ReviewDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);
-- Insert 20 dummy entries into the Farmers table
INSERT INTO Farmers (FarmerName, ContactNumber, Address)
VALUES
('Rajesh Kumar', '9876543210', 'Rewari'),
('Suresh Yadav', '9123456789', 'Mirzapur'),
('Amit Singh', '9234567890', 'Barnala'),
('Vikram Patel', '9456781234', 'Surendranagar'),
('Shivani Sharma', '9988776655', 'Bundi'),
('Deepak Chauhan', '9776654433', 'Ujjain'),
('Ravi Kumar', '9345678901', 'Gaya'),
('Sushila Devi', '9123456780', 'Ludhiana'),
('Kiran Thakur', '9998887777', 'Solan'),
('Mahesh Yadav', '9876541230', 'Patiala'),
('Sunita Rani', '9900112233', 'Aligarh'),
('Narendra Singh', '9666887777', 'Hisar'),
('Preeti Verma', '9222334455', 'Kota'),
('Kailash Kumar', '9638527410', 'Varanasi'),
('Geeta Devi', '9456784567', 'Bhopal'),
('Anil Yadav', '9532277889', 'Muzaffarpur'),
('Shankar Prasad', '9774455667', 'Bhavnagar'),
('Laxmi Kumari', '9056342978', 'Ajmer'),
('Jitendra Rathi', '9765321809', 'Panipat');
-- Insert 20 dummy entries into the Buyer table
INSERT INTO Buyer (BuyerName, BuyerEmail, BuyerPhone)
VALUES 
('Amit Kumar', 'amit.kumar@gmail.com', '9876543210'),
('Priya Sharma', 'priya.sharma@gmail.com', '8765432109'),
('Rahul Verma', 'rahul.verma@gmail.com', '7654321098'),
('Neha Patel', 'neha.patel@gmail.com', '6543210987'),
('Suresh Reddy', 'suresh.reddy@gmail.com', '5432109876'),
('Anjali Gupta', 'anjali.gupta@gmail.com', '4321098765'),
('Vikram Singh', 'vikram.singh@gmail.com', '3210987654'),
('Kavita Desai', 'kavita.desai@gmail.com', '2109876543'),
('Rajesh Yadav', 'rajesh.yadav@gmail.com', '1098765432'),
('Rina Joshi', 'rina.joshi@gmail.com', '0987654321'),
('Manoj Mehta', 'manoj.mehta@gmail.com', '9876543211'),
('Simran Kaur', 'simran.kaur@gmail.com', '8765432108'),
('Ajay Sharma', 'ajay.sharma@gmail.com', '7654321097'),
('Sunita Verma', 'sunita.verma@gmail.com', '6543210986'),
('Karan Kapoor', 'karan.kapoor@gmail.com', '5432109875'),
('Pooja Iyer', 'pooja.iyer@gmail.com', '4321098764'),
('Arvind Rao', 'arvind.rao@gmail.com', '3210987653'),
('Divya Nair', 'divya.nair@gmail.com', '2109876542'),
('Sandeep Bansal', 'sandeep.bansal@gmail.com', '1098765431'),
('Sonal Jain', 'sonal.jain@gmail.com', '0987654320');
-- Insert 20 dummy entries into the Product table 
INSERT INTO Product (ProductID, ProductName, ProductCategory, ProductPrice)
VALUES 
(1, 'Tractor', 'Machinery', 500000),
(2, 'Rotavator', 'Machinery', 120000),
(3, 'Drip Irrigation Kit', 'Irrigation', 15000),
(4, 'Sprinkler System', 'Irrigation', 20000),
(5, 'Organic Fertilizer', 'Fertilizers', 2500),
(6, 'Pesticide Spray', 'Pesticides', 1800),
(7, 'Hybrid Seeds Wheat', 'Seeds', 3000),
(8, 'Hybrid Seeds Rice', 'Seeds', 3500),
(9, 'Greenhouse Net', 'Farming Supplies', 12000),
(10, 'Soil Testing Kit', 'Farming Supplies', 5000),
(11, 'Farm Tools Set', 'Tools', 4500),
(12, 'Manual Seeder', 'Machinery', 8000),
(13, 'Harvesting Sickle', 'Tools', 1200),
(14, 'Electric Water Pump', 'Irrigation', 25000),
(15, 'Animal Feed Cattle', 'Animal Husbandry', 2000),
(16, 'Poultry Feeder', 'Animal Husbandry', 3000),
(17, 'Beekeeping Starter Kit', 'Beekeeping', 7000),
(18, 'Solar Dryer', 'Post Harvest Equipment', 18000),
(19, 'Cold Storage Unit', 'Post Harvest Equipment', 75000),
(20, 'Milk Chilling Machine', 'Dairy Equipment', 90000);
-- Insert 20 dummy entries into the Order table
INSERT INTO `Order` (OrderDate, BuyerID, ProductID, Quantity, TotalPrice)
VALUES 
('2025-01-10', 1, 1, 1, 500000),  -- Tractor
('2025-01-11', 2, 2, 1, 120000),  -- Rotavator
('2025-01-12', 3, 3, 3, 45000),  -- Drip Irrigation Kit
('2025-01-13', 4, 4, 2, 40000),  -- Sprinkler System
('2025-01-14', 5, 5, 5, 12500),  -- Organic Fertilizer
('2025-01-15', 6, 6, 2, 3600),   -- Pesticide Spray
('2025-01-16', 7, 7, 10, 30000), -- Hybrid Seeds - Wheat
('2025-01-17', 8, 8, 8, 28000),  -- Hybrid Seeds - Rice
('2025-01-18', 9, 9, 1, 12000),  -- Greenhouse Net
('2025-01-19', 10, 10, 1, 5000), -- Soil Testing Kit
('2025-01-20', 11, 11, 2, 9000), -- Farm Tools Set
('2025-01-21', 12, 12, 3, 24000),-- Manual Seeder
('2025-01-22', 13, 13, 4, 4800), -- Harvesting Sickle
('2025-01-23', 14, 14, 1, 25000),-- Electric Water Pump
('2025-01-24', 15, 15, 3, 6000), -- Animal Feed - Cattle
('2025-01-25', 16, 16, 2, 6000), -- Poultry Feeder
('2025-01-26', 17, 17, 1, 7000), -- Beekeeping Starter Kit
('2025-01-27', 18, 18, 1, 18000),-- Solar Dryer
('2025-01-28', 19, 19, 1, 75000),-- Cold Storage Unit
('2025-01-29', 20, 20, 1, 90000);-- Milk Chilling Machine
-- Insert 20 dummy entries into the OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, TotalPrice)
VALUES
(1, 1, 1, 500000),  -- Tractor
(1, 2, 1, 120000),  -- Rotavator
(2, 3, 3, 45000),   -- Drip Irrigation Kit
(2, 4, 2, 40000),   -- Sprinkler System
(3, 5, 5, 12500),   -- Organic Fertilizer
(3, 6, 2, 3600),    -- Pesticide Spray
(4, 7, 10, 30000),  -- Hybrid Seeds - Wheat
(5, 8, 8, 28000),   -- Hybrid Seeds - Rice
(5, 9, 1, 12000),   -- Greenhouse Net
(6, 10, 1, 5000),   -- Soil Testing Kit
(7, 11, 2, 9000),   -- Farm Tools Set
(8, 12, 3, 24000),  -- Manual Seeder
(9, 13, 4, 4800),   -- Harvesting Sickle
(9, 14, 1, 25000),  -- Electric Water Pump
(10, 15, 3, 6000),  -- Animal Feed - Cattle
(11, 16, 2, 6000),  -- Poultry Feeder
(12, 17, 1, 7000),  -- Beekeeping Starter Kit
(13, 18, 1, 18000), -- Solar Dryer
(14, 19, 1, 75000), -- Cold Storage Unit
(15, 20, 1, 90000); -- Milk Chilling Machine
-- Insert 20 dummy entries into the Transaction table
INSERT INTO Transaction (OrderID, PaymentMethod, TransactionAmount, TransactionDate)
VALUES
(1, 'Credit Card', 500000, '2025-01-10'),  -- Tractor
(2, 'Debit Card', 120000, '2025-01-11'),  -- Rotavator
(3, 'UPI', 45000, '2025-01-12'),  -- Drip Irrigation Kit
(4, 'Credit Card', 40000, '2025-01-13'),  -- Sprinkler System
(5, 'Cash', 12500, '2025-01-14'),  -- Organic Fertilizer
(6, 'Credit Card', 3600, '2025-01-15'),  -- Pesticide Spray
(7, 'Debit Card', 30000, '2025-01-16'),  -- Hybrid Seeds - Wheat
(8, 'UPI', 28000, '2025-01-17'),  -- Hybrid Seeds - Rice
(9, 'Credit Card', 12000, '2025-01-18'),  -- Greenhouse Net
(10, 'Cash', 5000, '2025-01-19'),  -- Soil Testing Kit
(11, 'Debit Card', 9000, '2025-01-20'),  -- Farm Tools Set
(12, 'UPI', 24000, '2025-01-21'),  -- Manual Seeder
(13, 'Credit Card', 4800, '2025-01-22'),  -- Harvesting Sickle
(14, 'Cash', 25000, '2025-01-23'),  -- Electric Water Pump
(15, 'Debit Card', 6000, '2025-01-24'),  -- Animal Feed - Cattle
(16, 'Credit Card', 6000, '2025-01-25'),  -- Poultry Feeder
(17, 'UPI', 7000, '2025-01-26'),  -- Beekeeping Starter Kit
(18, 'Cash', 18000, '2025-01-27'),  -- Solar Dryer
(19, 'Debit Card', 75000, '2025-01-28'),  -- Cold Storage Unit
(20, 'Credit Card', 90000, '2025-01-29');  -- Milk Chilling Machine
-- Insert 20 dummy entries into the Reviews table
INSERT INTO Reviews (ProductID, BuyerID, ReviewText, Rating, ReviewDate)
VALUES
(1, 1, 'Tractor is powerful and easy to operate. Great for large farms.', 5, '2025-01-10'),
(2, 2, 'Rotavator does a good job, but maintenance is a bit costly.', 4, '2025-01-11'),
(3, 3, 'Drip irrigation kit is effective but requires careful installation.', 4, '2025-01-12'),
(4, 4, 'Sprinkler system covers a large area, but the pipes could be sturdier.', 3, '2025-01-13'),
(5, 5, 'Organic fertilizer improved soil quality, highly recommended.', 5, '2025-01-14'),
(6, 6, 'Pesticide spray works well, but the sprayer nozzle could be better.', 4, '2025-01-15'),
(7, 7, 'Hybrid wheat seeds have a high germination rate.', 5, '2025-01-16'),
(8, 8, 'Hybrid rice seeds yielded good output, but need proper soil prep.', 4, '2025-01-17'),
(9, 9, 'Greenhouse net is durable and provides good temperature control.', 5, '2025-01-18'),
(10, 10, 'Soil testing kit is useful, but instructions should be clearer.', 3, '2025-01-19'),
(11, 11, 'Farm tools set is sturdy and covers all basic farming needs.', 5, '2025-01-20'),
(12, 12, 'Manual seeder saves time, but needs practice for best results.', 4, '2025-01-21'),
(13, 13, 'Harvesting sickle is sharp and comfortable to use.', 4, '2025-01-22'),
(14, 14, 'Electric water pump is powerful, but consumes a lot of energy.', 3, '2025-01-23'),
(15, 15, 'Cattle feed is nutritious, and my cows love it.', 5, '2025-01-24'),
(16, 16, 'Poultry feeder is easy to clean and holds enough feed for a day.', 4, '2025-01-25'),
(17, 17, 'Beekeeping starter kit is good for beginners, but protective gear could be better.', 4, '2025-01-26'),
(18, 18, 'Solar dryer helps preserve produce well, but takes time to dry.', 4, '2025-01-27'),
(19, 19, 'Cold storage unit keeps produce fresh, but initial setup is costly.', 5, '2025-01-28'),
(20, 20, 'Milk chilling machine works great, but requires regular cleaning.', 5, '2025-01-29');

-- Alter the Transaction table by adding a new column 'TransactionStatus'
ALTER TABLE Transaction
ADD COLUMN TransactionStatus VARCHAR(60) NOT NULL DEFAULT 'Pending';

-- Insert 20 dummy entries into the Transaction table with TransactionStatus
INSERT INTO Transaction (OrderID, PaymentMethod, TransactionAmount, TransactionDate, TransactionStatus)
VALUES
(1, 'UPI', 250000, '2025-01-10', 'Completed'), -- Tractor purchase
(2, 'Credit Card', 75000, '2025-01-11', 'Completed'), -- Rotavator
(3, 'Cash', 12000, '2025-01-12', 'Pending'), -- Drip irrigation kit
(4, 'Debit Card', 18000, '2025-01-13', 'Completed'), -- Sprinkler system
(5, 'UPI', 5000, '2025-01-14', 'Completed'), -- Organic fertilizer
(6, 'Cash', 7000, '2025-01-15', 'Pending'), -- Pesticide spray
(7, 'Debit Card', 25000, '2025-01-16', 'Completed'), -- Hybrid wheat seeds
(8, 'UPI', 30000, '2025-01-17', 'Completed'), -- Hybrid rice seeds
(9, 'Credit Card', 22000, '2025-01-18', 'Completed'), -- Greenhouse net
(10, 'UPI', 8000, '2025-01-19', 'Pending'), -- Soil testing kit
(11, 'Cash', 15000, '2025-01-20', 'Completed'), -- Farm tools set
(12, 'Debit Card', 20000, '2025-01-21', 'Completed'), -- Manual seeder
(13, 'UPI', 5000, '2025-01-22', 'Completed'), -- Harvesting sickle
(14, 'Credit Card', 35000, '2025-01-23', 'Completed'), -- Electric water pump
(15, 'Cash', 12000, '2025-01-24', 'Pending'), -- Cattle feed
(16, 'UPI', 9000, '2025-01-25', 'Completed'), -- Poultry feeder
(17, 'Debit Card', 18000, '2025-01-26', 'Pending'), -- Beekeeping starter kit
(18, 'Cash', 25000, '2025-01-27', 'Completed'), -- Solar dryer
(19, 'Credit Card', 75000, '2025-01-28', 'Completed'), -- Cold storage unit
(20, 'UPI', 50000, '2025-01-29', 'Pending'); -- Milk chilling machine

-- Part B of Project (Making alterations in the table and checking the First normal form and then doing stress test)

-- Add a CHECK constraint to ensure Rating is between 1 and 5
ALTER TABLE Reviews
ADD CONSTRAINT check_rating CHECK (Rating BETWEEN 1 AND 5);
-- Drop the CHECK constraint from the Reviews table
ALTER TABLE Reviews
DROP CONSTRAINT check_rating;
-- Modify data types in the Farmers table
ALTER TABLE Farmers
MODIFY COLUMN FarmerName VARCHAR(50),
MODIFY COLUMN ContactNumber VARCHAR(20),
MODIFY COLUMN Address VARCHAR(70);

-- Insert 20 dummy entries into the Farmers table
INSERT INTO Farmers (FarmerName, ContactNumber, Address)
VALUES
('Ramesh Yadav', '9876543210', 'Ludhiana'),
('Suresh Patil', '9123456789', 'Pune'),
('Manoj Singh', '9988776655', 'Allahabad'),
('Anil Kumar', '9678456321', 'Gaya'),
('Rajesh Sharma', '9786543210', 'Ajmer'),
('Harish Verma', '9871204567', 'Hisar'),
('Ganesh Rao', '9356781234', 'Nizamabad'),
('Kishore Naidu', '9994561230', 'Guntur'),
('Mahesh Babu', '9801234567', 'Belgaum'),
('Surya Pratap', '9678123456', 'Indore'),
('Venkatesh Reddy', '9564738291', 'Madurai'),
('Sunil Mehta', '9456123789', 'Rajkot'),
('Dinesh Choudhary', '9321678456', 'Raipur'),
('Arun Dev', '9785463210', 'Bardhaman'),
('Lokesh Rana', '9876132456', 'Solan'),
('Mukesh Tiwari', '9764312589', 'Dhanbad'),
('Shiv Kumar', '9678321456', 'Cuttack'),
('Yogesh Thakur', '9567412389', 'Jorhat'),
('Ajay Sharma', '9456214789', 'Nainital'),
('Naresh Gupta', '9897654321', 'Kollam');

-- Rename the Buyer table to a new name
RENAME TABLE Buyer TO Purchaser;
-- Rename the ProductCategory column to NewCategoryName in the Product table
ALTER TABLE Product
CHANGE COLUMN ProductCategory ProductType VARCHAR(40);

-- Check for first normal form (1NF)
-- Check if any column contains comma-separated or multiple values (potential violations of atomicity)
SELECT FarmerID, FarmerName FROM Farmers WHERE FarmerName LIKE '%,%'; 
SELECT ProductID, ProductName FROM Product WHERE ProductName LIKE '%,%'; 
SELECT OrderID, OrderDate FROM `Order` WHERE OrderDate LIKE '%,%'; 
SELECT TransactionID, PaymentMethod FROM Transaction WHERE PaymentMethod LIKE '%,%'; 

-- Show the primary keys of all tables
SELECT TABLE_NAME, COLUMN_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'rbtn_AgriMarketplace' AND CONSTRAINT_NAME = 'PRIMARY';

-- Count duplicate Product Names (should be unique in the Product table)
SELECT ProductName, COUNT(*) FROM Product GROUP BY ProductName HAVING COUNT(*) > 1;

-- Count duplicate Buyer Names (should be unique in the Purchaser table)
SELECT BuyerName, COUNT(*) FROM Purchaser GROUP BY BuyerName HAVING COUNT(*) > 1;

-- Check if ContactNumber column contains non-numeric characters (should contain only numbers)
SELECT ContactNumber FROM Farmers WHERE ContactNumber REGEXP '[^0-9]';  

-- Check if Price columns contain only numbers (ensuring no textual values)
SELECT ProductPrice FROM Product WHERE ProductPrice REGEXP '[^0-9]';  
SELECT TotalPrice FROM `Order` WHERE TotalPrice REGEXP '[^0-9]';  

-- Check if dates are stored properly
SELECT OrderDate FROM `Order` WHERE OrderDate REGEXP '[^0-9- :]';  
SELECT TransactionDate FROM Transaction WHERE TransactionDate REGEXP '[^0-9- :]';

-- Check if OrderDetails table has duplicate OrderID-ProductID pairs (should be unique)
SELECT OrderID, ProductID, COUNT(*) FROM OrderDetails GROUP BY OrderID, ProductID HAVING COUNT(*) > 1;

-- Stress Test
-- Insert a new farmer
INSERT INTO Farmers (FarmerName, ContactNumber, Address)
VALUES ('Arjun Mehta', '9876543210', 'Bikaner');

-- Insert a new product
INSERT INTO Product (ProductName, ProductType, ProductPrice)
VALUES ('Organic Pesticide', 'Pesticides', 2200);

-- Insert a new buyer (Purchaser table after renaming)
INSERT INTO Purchaser (BuyerName, BuyerEmail, BuyerPhone)
VALUES ('Raj Malhotra', 'raj.malhotra@gmail.com', '8765432109');

-- Insert a new order
INSERT INTO `Order` (OrderDate, BuyerID, ProductID, Quantity, TotalPrice)
VALUES ('2025-02-01', 1, 1, 2, 4400);

-- Insert a new transaction
INSERT INTO Transaction (OrderID, PaymentMethod, TransactionAmount, TransactionDate, TransactionStatus)
VALUES (1, 'UPI', 4400, '2025-02-01', 'Completed');

-- Insert a new review
INSERT INTO Reviews (ProductID, BuyerID, ReviewText, Rating, ReviewDate)
VALUES (1, 1, 'Great organic pesticide, very effective.', 5, '2025-02-01');

-- Update farmer’s contact number
UPDATE Farmers AS f
JOIN (SELECT FarmerID FROM Farmers WHERE FarmerName = 'Arjun Mehta' LIMIT 1) AS sub
ON f.FarmerID = sub.FarmerID
SET f.ContactNumber = '9998887776';

-- Update product price
UPDATE Product AS p
JOIN (SELECT ProductID FROM Product WHERE ProductName = 'Organic Pesticide' LIMIT 1) AS sub
ON p.ProductID = sub.ProductID
SET p.ProductPrice = 2500;

-- Update order quantity and total price
UPDATE `Order` AS o
JOIN (SELECT OrderID FROM `Order` WHERE OrderID = 1 LIMIT 1) AS sub
ON o.OrderID = sub.OrderID
SET o.Quantity = 3, o.TotalPrice = 7500;

-- Update transaction status
UPDATE Transaction AS t
JOIN (SELECT TransactionID FROM Transaction WHERE OrderID = 1 LIMIT 1) AS sub
ON t.TransactionID = sub.TransactionID
SET t.TransactionStatus = 'Refunded';

-- Update review text and rating
UPDATE Reviews AS r
JOIN (SELECT ReviewID FROM Reviews WHERE ReviewID = 1 LIMIT 1) AS sub
ON r.ReviewID = sub.ReviewID
SET r.ReviewText = 'Very effective and safe to use.', r.Rating = 4;

-- Step 3: Delete Related Records First (Avoid Foreign Key Issues)
DELETE FROM Reviews WHERE ProductID = (SELECT ProductID FROM Product WHERE ProductName = 'Organic Pesticide' LIMIT 1);
DELETE FROM Transaction WHERE OrderID = (SELECT OrderID FROM `Order` WHERE BuyerID = 1 LIMIT 1);
DELETE FROM `Order` WHERE BuyerID = (SELECT BuyerID FROM Purchaser WHERE BuyerName = 'Raj Malhotra' LIMIT 1);

-- Step 4: Delete Main Records
-- Store the FarmerID in a variable before deleting
SET @farmer_id = (SELECT FarmerID FROM Farmers WHERE FarmerName = 'Arjun Mehta' LIMIT 1);
-- Now delete the farmer using the variable
DELETE FROM Farmers WHERE FarmerID = @farmer_id;

-- Store the ProductID in a variable before deleting
SET @product_id = (SELECT ProductID FROM Product WHERE ProductName = 'Organic Pesticide' LIMIT 1);
-- Now delete the product using the variable
DELETE FROM Product WHERE ProductID = @product_id;

-- Store the BuyerID in a variable before deleting
SET @buyer_id = (SELECT BuyerID FROM Purchaser WHERE BuyerName = 'Raj Malhotra' LIMIT 1);
-- Now delete the buyer using the variable
DELETE FROM Purchaser WHERE BuyerID = @buyer_id;

-- Step 5: Disable Foreign Key Checks (Forcing Deletion, Use Caution)
SET FOREIGN_KEY_CHECKS = 0;

DELETE t FROM Transaction t
JOIN `Order` o ON t.OrderID = o.OrderID
WHERE o.BuyerID = (SELECT BuyerID FROM Purchaser WHERE BuyerName = 'Raj Malhotra' LIMIT 1);

DELETE o FROM `Order` o
JOIN Purchaser p ON o.BuyerID = p.BuyerID
WHERE p.BuyerName = 'Raj Malhotra';

SET FOREIGN_KEY_CHECKS = 1;

-- Measure Execution Time of INSERT Query
SET @start_time = NOW();
INSERT INTO `Order` (OrderDate, BuyerID, ProductID, Quantity, TotalPrice)
VALUES (NOW(), 1, 3, 2, 5000);
SELECT TIMEDIFF(NOW(), @start_time) AS InsertExecutionTime;

-- Measure Execution Time of UPDATE Query
SET @start_time = NOW();
UPDATE `Order`
SET Quantity = 5, TotalPrice = 12000
WHERE OrderID = 1;
SELECT TIMEDIFF(NOW(), @start_time) AS UpdateExecutionTime;

-- Measure Execution Time of DELETE Query
-- Start Time Capture
SET @start_time = NOW();
-- Step 1: Delete dependent records in Transaction table
DELETE FROM Transaction WHERE OrderID = 10;
-- Step 2: Delete dependent records in OrderDetails table
DELETE FROM OrderDetails WHERE OrderID = 10;
-- Step 3: Delete the main order from Order table
DELETE FROM `Order` WHERE OrderID = 10;
-- Measure Execution Time
SELECT TIMEDIFF(NOW(), @start_time) AS DeleteExecutionTime;
