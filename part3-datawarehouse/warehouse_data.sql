/* =========================================================
   Task 3.2: Star Schema Implementation
   Data Warehouse: fleximart_dw
   ========================================================= */

-----------------------INSERT statements-----------------------

/*=======================================================================

-----------Minimum Data Requirements-------------

dim_date: 30 dates (January-February 2024)
dim_product: 15 products across 3 categories
dim_customer: 12 customers across 4 cities
fact_sales: 40 sales transactions
-----------------Data Guidelines------------------

Dates should include both weekdays and weekends
Products should have varied prices (₹100 to ₹100,000)
Customers should represent different cities/states
Sales should show realistic patterns (higher on weekends, varied quantities)

============================================================================*/

---1️⃣ Insert into dim_date (30 dates)


INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);


--- 2️⃣ Insert into dim_product (15 products, 3 categories)

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Samsung Galaxy','Electronics','Smartphone',79999),
('P002','Apple MacBook','Electronics','Laptop',99999),
('P003','Sony Headphones','Electronics','Audio',2999),
('P004','Dell Monitor','Electronics','Monitor',32999),
('P005','OnePlus Nord','Electronics','Smartphone',26999),
('P006','Nike Shoes','Fashion','Footwear',12995),
('P007','Adidas T-Shirt','Fashion','Clothing',1499),
('P008','Levis Jeans','Fashion','Clothing',3499),
('P009','Puma Sneakers','Fashion','Footwear',8999),
('P010','H&M Shirt','Fashion','Clothing',1999),
('P011','Basmati Rice','Groceries','Food',650),
('P012','Organic Honey','Groceries','Food',450),
('P013','Almonds 1kg','Groceries','Dry Fruits',899),
('P014','Masoor Dal','Groceries','Pulses',120),
('P015','Cooking Oil','Groceries','Essentials',210);

--- 3️⃣ Insert into dim_customer (12 customers, 4+ cities)

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','Retail'),
('C002','Priya Patel','Mumbai','Maharashtra','Retail'),
('C003','Amit Kumar','Delhi','Delhi','Corporate'),
('C004','Sneha Reddy','Hyderabad','Telangana','Retail'),
('C005','Vikram Singh','Chennai','Tamil Nadu','Retail'),
('C006','Anjali Mehta','Mumbai','Maharashtra','Corporate'),
('C007','Ravi Verma','Delhi','Delhi','Retail'),
('C008','Pooja Iyer','Bangalore','Karnataka','Corporate'),
('C009','Karthik Nair','Kochi','Kerala','Retail'),
('C010','Deepa Gupta','Delhi','Delhi','Corporate'),
('C011','Arjun Rao','Hyderabad','Telangana','Retail'),
('C012','Lakshmi Krishnan','Chennai','Tamil Nadu','Retail');


--- 4️⃣ Insert into fact_sales (40 transactions)

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
-- JANUARY (Weekdays – moderate sales)
(20240101,1,1,1,79999,0,79999),
(20240102,5,2,1,26999,0,26999),
(20240103,7,3,2,1499,0,2998),
(20240104,10,4,1,1999,0,1999),
(20240105,11,5,3,650,0,1950),

-- JANUARY WEEKEND (HIGH SALES)
(20240106,1,6,2,79999,5000,154998),
(20240106,2,7,1,99999,7000,92999),
(20240107,3,8,3,2999,0,8997),
(20240107,4,9,2,32999,2000,63998),

-- JANUARY (Post weekend)
(20240108,8,10,2,3499,0,6998),
(20240109,9,11,1,8999,0,8999),
(20240110,12,12,4,450,0,1800),
(20240111,13,1,3,899,0,2697),
(20240112,14,2,6,120,0,720),

-- JANUARY WEEKEND (HIGH SALES)
(20240113,1,3,1,79999,0,79999),
(20240113,5,4,2,26999,0,53998),
(20240114,6,5,1,12995,0,12995),
(20240114,7,6,4,1499,0,5996),

-- JANUARY END
(20240115,10,7,2,1999,0,3998),

-- FEBRUARY (Weekdays)
(20240201,11,8,5,650,0,3250),
(20240202,12,9,4,450,0,1800),

-- FEBRUARY WEEKEND (HIGH SALES)
(20240203,2,10,1,99999,10000,89999),
(20240203,3,11,2,2999,0,5998),
(20240204,4,12,2,32999,3000,62998),

-- FEBRUARY (Weekdays)
(20240205,7,1,3,1499,0,4497),
(20240206,8,2,2,3499,0,6998),
(20240207,9,3,1,8999,0,8999),
(20240208,13,4,2,899,0,1798),
(20240209,14,5,5,120,0,600),

-- FEBRUARY WEEKEND (HIGH SALES)
(20240210,1,6,2,79999,8000,151998),
(20240210,6,7,1,12995,0,12995),
(20240211,3,8,3,2999,0,8997),
(20240211,5,9,2,26999,0,53998),
(20240114,2,11,1,99999,9000,90999),
(20240211,8,3,3,3499,0,10497),

-- FEBRUARY (Final days)
(20240212,10,10,3,1999,0,5997),
(20240213,11,11,4,650,0,2600),
(20240214,12,12,6,450,0,2700),
(20240215,7,1,2,1499,0,2998),
(20240215,15,2,3,210,0,630);





