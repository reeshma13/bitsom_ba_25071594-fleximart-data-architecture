# Part 1: Database Design and ETL Pipeline

## Overview

This part of the project focuses on building a complete ETL (Extract, Transform, Load) pipeline for FlexiMart using Python and MySQL. The goal is to clean raw customer, product, and sales data that contains multiple data quality issues and load the cleaned data into a relational database.

The ETL pipeline reads raw CSV files, applies data cleaning and transformation rules, and inserts the processed data into normalized database tables. This part also includes database schema documentation and business-oriented SQL queries for analysis.

---

## Input Data Files

The ETL pipeline processes the following raw CSV files:

- **customers_raw.csv**
  - Issues: missing emails, duplicate records, inconsistent phone formats
- **products_raw.csv**
  - Issues: missing prices, inconsistent category names, null stock values
- **sales_raw.csv**
  - Issues: duplicate transactions, missing customer/product IDs, inconsistent date formats

---

## ETL Pipeline Steps

### 1. Extract
- Reads all raw CSV files using Python.
- Loads data into memory for processing.

### 2. Transform
- Removes duplicate records.
- Handles missing values using default values or logical imputation.
- Standardizes phone numbers and product categories.
- Converts all dates into `YYYY-MM-DD` format.
- Resolves missing foreign keys using documented assumptions.
- Generates clean datasets for customers, products, and sales.

### 3. Load
- Inserts cleaned data into MySQL tables:
  - `customers`
  - `products`
  - `orders`
  - `order_items`
- Ensures referential integrity using foreign keys.
- Logs errors and warnings during execution.

---

## Output Files

- **customers_clean.csv** – Cleaned customer data
- **products_clean.csv** – Cleaned product data
- **sales_clean.csv** – Cleaned sales data
- **data_quality_report.txt** – Summary of data issues handled
- **etl_log.txt** – Execution logs generated during ETL run

---

## How to Run

1. Make sure MySQL is running and the `fleximart` database exists.
2. Install required Python dependencies.
3. Run the ETL pipeline:

```bash
python etl_pipeline.py
