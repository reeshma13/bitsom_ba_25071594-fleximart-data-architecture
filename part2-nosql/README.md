# Part 2: NoSQL Database – MongoDB

## Overview

This part of the FlexiMart Data Architecture project focuses on understanding and implementing a NoSQL database using MongoDB. The goal is to analyze why a NoSQL database is suitable for handling flexible and diverse product data and to perform basic MongoDB operations using a real product catalog dataset.

This part is divided into two tasks:
- Task 2.1: NoSQL Justification Report (Theory)
- Task 2.2: MongoDB Implementation (Practical)

---

## Task 2.1: NoSQL Justification Report

### Objective
To explain why a traditional relational database is not ideal for a highly diverse product catalog and how MongoDB solves these limitations.

### File
- `nosql_analysis.md`

### Sections Covered
1. **Limitations of RDBMS**
   - Handling products with different attributes
   - Difficulty with frequent schema changes
   - Challenges in storing nested data like customer reviews

2. **Benefits of MongoDB**
   - Flexible, schema-less document structure
   - Embedded documents for reviews
   - Horizontal scalability using sharding

3. **Trade-offs**
   - Disadvantages of MongoDB compared to MySQL

---

## Task 2.2: MongoDB Implementation

### Objective
To perform basic MongoDB operations using a product catalog stored in JSON format.

### Files
- `mongodb_operations.js`
- `products_catalog.json`

### Dataset
The dataset contains products from multiple categories such as Electronics and Fashion.  
Each product includes:
- Basic product details
- Flexible specifications
- An array of customer reviews

---

### MongoDB Operations Implemented

1. **Load Data**
   - Import the JSON file into the `products` collection

2. **Basic Query**
   - Retrieve all Electronics products priced below ₹50,000
   - Display only name, price, and stock

3. **Review Analysis**
   - Use aggregation to calculate average rating
   - Filter products with average rating ≥ 4.0

4. **Update Operation**
   - Add a new customer review to product `ELEC001`

5. **Complex Aggregation**
   - Calculate average price by category
   - Display product count per category
   - Sort results by average price in descending order

Each operation is clearly commented in the script for easy understanding.

---

## How to Run (MongoDB)

1. Open MongoDB Shell:

 ```bash
   mongosh
```

2. Run the MongoDB operations script:

```bash
mongosh mongodb_operations.js
```


Make sure MongoDB is installed and running before executing the script.

## Key Learnings

- Understood why NoSQL databases are better for flexible and evolving data models

- Learned how MongoDB stores nested and unstructured data

- Gained hands-on experience with MongoDB queries, updates, and aggregations

- Compared relational and NoSQL databases from a real business perspective

## Files Summary

| File Name               | Description                                   |
|-------------------------|-----------------------------------------------|
| nosql_analysis.md       | Theory report explaining NoSQL justification  |
| mongodb_operations.js   | MongoDB queries and operations                |
| products_catalog.json   | Product catalog dataset                       |

## Conclusion

This part demonstrates how MongoDB can efficiently handle diverse product data and nested customer reviews, making it suitable for modern e-commerce platforms like FlexiMart.


----------------------------------------------------------------------------------------------------------------


