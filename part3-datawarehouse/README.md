# Part 3: Data Warehouse and Analytics

## Overview

This part of the project focuses on building a **Data Warehouse** for FlexiMart to analyze historical sales data.  
A **star schema** is designed to support analytical queries, followed by loading realistic sample data and running **OLAP-style analytics queries**.

The goal is to demonstrate understanding of **dimensional modeling**, **data warehousing concepts**, and **business analytics using SQL**.

---

## Tasks Covered

### Task 3.1: Star Schema Design Documentation
- Designed a **star schema** with one fact table and multiple dimension tables
- Documented:
  - Fact table grain and business process
  - Dimension tables and their attributes
  - Design decisions such as granularity and surrogate keys
  - Sample data flow from source system to data warehouse

📄 File: `star_schema_design.md`

---

### Task 3.2: Star Schema Implementation
- Implemented the provided schema exactly as given
- Created and populated:
  - `dim_date` (30 dates for Jan–Feb 2024)
  - `dim_product` (15 products across 3 categories)
  - `dim_customer` (12 customers across 4 cities)
  - `fact_sales` (40+ realistic sales transactions)
- Ensured:
  - No foreign key violations
  - Realistic pricing and sales patterns
  - Higher sales on weekends

📄 Files:
- `warehouse_schema.sql`
- `warehouse_data.sql`

---

### Task 3.3: OLAP Analytics Queries
Implemented analytical SQL queries to answer real business questions:

1. **Monthly Sales Drill-Down**
   - Year → Quarter → Month analysis
   - Shows total sales and quantities

2. **Product Performance Analysis**
   - Top 10 products by revenue
   - Revenue contribution percentage calculated

3. **Customer Segmentation Analysis**
   - Customers grouped into High, Medium, and Low value segments
   - Shows customer count and revenue per segment

📄 File: `analytics_queries.sql`

---

## Folder Structure

```text

part3-datawarehouse/
├── README.md
├── star_schema_design.md
├── warehouse_schema.sql
├── warehouse_data.sql
└── analytics_queries.sql

```

### How to Run (MYSQL)

#### Create Data Warehouse database
```bash
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"
```
#### Create schema
```bash
mysql -u root -p fleximart_dw < warehouse_schema.sql
```
#### Load dimension and fact data
```bash
mysql -u root -p fleximart_dw < warehouse_data.sql
```
#### Run analytics queries
```bash
mysql -u root -p fleximart_dw < analytics_queries.sql
```


## Key Learnings

--- Understood how star schemas simplify analytical queries

--- Learned how fact and dimension tables work together

--- Gained hands-on experience with OLAP queries, drill-down analysis, and aggregations

--- Learned the importance of data quality and referential integrity in data warehouses

## Notes

- Dimension tables must always be loaded before the fact table

- All sample data follows realistic business behavior

- Queries are written for MySQL 8+ compatibility
