# Star Schema Design – FlexiMart Data Warehouse

---

## Section 1: Schema Overview

FlexiMart uses a **star schema** to support historical sales analysis and business reporting.  
The design consists of one central fact table connected to multiple dimension tables. This structure simplifies analytical queries and improves performance.

---

### FACT TABLE: fact_sales

**Grain:**  
One row per product per order line item.

**Business Process:**  
Sales transactions.

**Purpose:**  
Stores measurable sales data used for reporting and analysis.

**Measures (Numeric Facts):**
- `quantity_sold`: Number of units sold
- `unit_price`: Price per unit at the time of sale
- `discount_amount`: Discount applied on the product
- `total_amount`: Final amount after discount  
  *(quantity_sold × unit_price − discount_amount)*

**Foreign Keys:**
- `date_key` → dim_date
- `product_key` → dim_product
- `customer_key` → dim_customer

---

### DIMENSION TABLE: dim_date

**Purpose:**  
Supports time-based analysis such as daily, monthly, quarterly, and yearly sales trends.

**Type:**  
Conformed dimension.

**Attributes:**
- `date_key` (PK): Surrogate key (YYYYMMDD format)
- `full_date`: Actual calendar date
- `day_of_week`: Day name (Monday, Tuesday, etc.)
- `month`: Month number (1–12)
- `month_name`: Month name (January, February, etc.)
- `quarter`: Quarter (Q1, Q2, Q3, Q4)
- `year`: Calendar year
- `is_weekend`: Boolean value (true/false) *Indicates whether the date is a weekend*

---
### DIMENSION TABLE: dim_product

**Purpose:**  
Stores descriptive information about products sold by FlexiMart. This dimension allows sales analysis based on product attributes such as category, brand, and subcategory.

**Attributes:**
- `product_key (Primary Key)`: Surrogate key used in the data warehouse
- `product_id`: Original product identifier from the source system
- `product_name`: Name of the product
- `category`: High-level product category (e.g., Electronics, Fashion)
- `subcategory`: More detailed product classification
- `brand`: Manufacturer or brand name

The dim_product table enables analysis of sales by product, category, and brand.

---

### DIMENSION TABLE: dim_customer

**Purpose:**  
Stores descriptive information about customers. This dimension supports customer-based analysis such as sales by city or customer behavior.

**Attributes:**
- `customer_key (Primary Key)`: Surrogate key used in the data warehouse
- `customer_id`: Original customer identifier from the source system
- `customer_name`: Full name of the customer
- `email`: Customer email address
- `city`: City where the customer resides
- `registration_date`: Date when the customer registered

The dim_customer table enables analysis of sales across different customer locations and customer segments.

---

## Section 2: Design Decisions


-- Why you chose this granularity (transaction line-item level)

The granularity of the fact table is defined at the **transaction line-item level**, where each row represents one product sold in an order. This level of detail provides maximum flexibility for analysis, allowing sales to be examined at the product, customer, or time level without losing information. It also supports accurate aggregation of quantities and revenue.


-- Why surrogate keys instead of natural keys

Surrogate keys are used instead of natural keys to improve performance and maintain consistency. Natural keys from source systems may change, be duplicated, or have business meaning that evolves over time. Surrogate keys are system-generated, stable, and ensure efficient joins between fact and dimension tables.

-- How this design supports drill-down and roll-up operations

This star schema design supports both **drill-down and roll-up operations**. Analysts can roll up data from daily sales to monthly or yearly summaries using the date dimension. They can also drill down from category-level sales to individual products or customers. The separation of facts and dimensions makes analytical queries simpler and faster.

The chosen granularity for the fact table is the transaction line-item level, where each row represents one product sold in an order. This level of detail provides maximum flexibility for analysis, allowing sales to be examined at the product, customer, or time level without losing information. It also supports accurate aggregation of quantities and revenue.





---

## Section 3: Sample Data Flow
-------------------------------------
-------------------------------------
### Source Transaction
In the source transactional system, the following order is recorded:

Order Number: 101

Customer Name: John Doe

Product Name: Laptop

Quantity: 2

Unit Price: ₹50,000

Order Date: 15-01-2024

This data is originally stored across multiple normalized tables such as customers, orders, and order_items.


Order #101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50000  

---

### Data Warehouse Representation
After the ETL process, the same transaction is stored in the data warehouse as follows:

fact_sales
The fact table captures the measurable sales values:

**fact_sales**
{
date_key: 20240115,
product_key: 5,
customer_key: 12,
quantity_sold: 2,
unit_price: 50000,
discount_amount: 0,
total_amount: 100000
}


The total amount is calculated as quantity × unit price (2 × 50000).

**dim_date**

The date dimension stores detailed time information:

{
date_key: 20240115,
full_date: "2024-01-15",
day_of_week: "Monday",
month: 1,
month_name: "January",
quarter: "Q1",
year: 2024,
is_weekend: false
}


**dim_product**

The product dimension stores descriptive product details:


{
product_key: 5,
product_name: "Laptop",
category: "Electronics",
brand: "Dell"
}


**dim_customer**

The customer dimension stores customer-related information:

{
customer_key: 12,
customer_name: "John Doe",
city: "Mumbai"
}


---

## Conclusion

This star schema design enables efficient historical analysis, supports business intelligence reporting, and allows flexible aggregation across time, product, and customer dimensions. It is well suited for FlexiMart’s analytical and decision-making needs.

This example shows how a single transaction from the source system is broken into facts and dimensions in the data warehouse. The fact table stores numerical measures, while the dimension tables store descriptive attributes. This structure supports efficient reporting, aggregation, and historical analysis.
