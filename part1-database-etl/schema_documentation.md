# Database Schema Documentation – FlexiMart

=============================================

## 1. Entity–Relationship Description

### ENTITY: customers  
**Purpose:**  
This table stores information about customers who register and place orders on the FlexiMart platform.

**Attributes:**
- `customer_id`: Unique identifier for each customer (Primary Key)
- `first_name`: Customer’s first name
- `last_name`: Customer’s last name
- `email`: Customer’s email address (must be unique)
- `phone`: Customer’s phone number
- `city`: City where the customer lives
- `registration_date`: Date when the customer registered

**Relationships:**
- One customer can place **many orders**  
  (One-to-Many relationship with the orders table)

---

### ENTITY: products  
**Purpose:**  
This table stores details of products that are available for sale.

**Attributes:**
- `product_id`: Unique identifier for each product (Primary Key)
- `product_name`: Name of the product
- `category`: Category of the product (Electronics, Fashion, Groceries)
- `price`: Price of one unit of the product
- `stock_quantity`: Number of units available in stock

**Relationships:**
- One product can be part of **many order items**  
  (One-to-Many relationship with the order_items table)

---

### ENTITY: orders  
**Purpose:**  
This table stores information about orders placed by customers.

**Attributes:**
- `order_id`: Unique identifier for each order (Primary Key)
- `customer_id`: Customer who placed the order (Foreign Key)
- `order_date`: Date when the order was placed
- `total_amount`: Total cost of the order
- `status`: Status of the order (Completed, Pending, Cancelled)

**Relationships:**
- Each order belongs to **one customer**
- One order can have **many order items**

---

### ENTITY: order_items  
**Purpose:**  
This table stores detailed information about products included in each order.

**Attributes:**
- `order_item_id`: Unique identifier for each order item (Primary Key)
- `order_id`: Order to which the item belongs (Foreign Key)
- `product_id`: Product that was ordered (Foreign Key)
- `quantity`: Number of units ordered
- `unit_price`: Price per unit at the time of order
- `subtotal`: Total cost for the item (quantity × unit_price)

**Relationships:**
- Each order item belongs to **one order**
- Each order item is linked to **one product**

---

## 2. Normalization Explanation (Third Normal Form – 3NF)

The FlexiMart database is designed using **Third Normal Form (3NF)** to avoid data duplication and maintain data accuracy.

In this design, each table has a **primary key**, and all other columns depend only on that primary key.

- In the **customers** table, all customer details depend only on `customer_id`.
- In the **products** table, product details depend only on `product_id`.
- In the **orders** table, order details depend only on `order_id`.
- In the **order_items** table, quantity and price depend only on `order_item_id`.

There are **no partial dependencies** because each table has a single primary key.  
There are also **no transitive dependencies**, meaning non-key columns do not depend on other non-key columns.

### How this design avoids anomalies:
- **Update anomaly:** Customer or product details are stored only once, so updates do not cause inconsistency.
- **Insert anomaly:** New customers or products can be added without creating an order.
- **Delete anomaly:** Deleting an order does not remove customer or product information.

Because of this structure, the database is well-organized and free from redundancy.

---

## 3. Sample Data Representation

### customers

| customer_id | first_name | last_name |          email         |    phone   |  city   | registration_date |
|-------------|------------|-----------|------------------------|------------|---------|-------------------|
|      1      |    Rahul   |   Sharma  | rahul.sharma@gmail.com | 9876543210 |Bangalore|     2023-01-15    |
|      2      |    Priya   |   Patel   | priya.patel@yahoo.com  | 9988776655 |Mumbai   |     2023-02-20    |

---

### products

| product_id |    product_name    |   category  |   price   | stock_quantity |
|------------|--------------------|-------------|-----------|----------------|
|     1      | Samsung Galaxy S21 | Electronics |  45999.00 |      150       |
|     2      | Nike Running Shoes | Fashion     |  3499.00  |       80       |

---

### orders

| order_id | customer_id | order_date | total_amount | status    |
|----------|-------------|------------|--------------|-----------|
|     1    |      1      | 2024-01-15 | 45999.00     | Completed |
|     2    |      2      | 2024-01-16 | 5998.00      | Completed |

---

### order_items

| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|---------------|----------|------------|----------|------------|----------|
|       1       |     1    |      1     |     1    |  45999.00  | 45999.00 |
|       2       |     2    |      2     |     2    |   2999.00  |  5998.00 |

---

## Final Note

This database schema is simple, well-structured, and follows normalization rules.  
It clearly explains all tables, relationships, and data flow in an easy-to-understand way.
