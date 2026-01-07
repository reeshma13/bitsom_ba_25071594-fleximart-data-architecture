# NoSQL Analysis – MongoDB for FlexiMart
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Section A: Limitations of RDBMS (Relational Databases)  


- Relational databases such as MySQL are designed to store structured and fixed data, but they struggle when product data becomes highly diverse. In the FlexiMart system, different products have different attributes. For example, laptops include RAM, processor, and storage, while shoes include size, color, and material. In a relational database, storing all products in a single table leads to many unused or NULL columns. Creating separate tables for each product type also increases complexity and makes queries harder to manage.

- Another major limitation is frequent schema changes. Whenever a new product type is added, the database schema must be modified using ALTER TABLE operations. These changes can be slow and risky, especially when the database contains large amounts of data.

- Storing customer reviews is also difficult in relational databases. Reviews usually contain nested information such as ratings, comments, and timestamps. To store this data, multiple tables and joins are required, which increases query complexity and can negatively affect performance.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Section B: Benefits of MongoDB (NoSQL)  


- MongoDB addresses these challenges by using a flexible, document-based data model. Unlike relational databases, MongoDB does not require a fixed schema. Each product is stored as a document, and different products can have different fields. For example, a laptop document can store processor and RAM details, while a shoe document can store size and color, without impacting other product documents. This flexibility allows new product types to be added quickly without changing the existing database structure.

- MongoDB also supports embedded documents. Customer reviews can be stored directly inside the product document as an array. This allows product details and reviews to be retrieved together without using complex joins. As a result, queries become simpler, application logic is easier to manage, and read performance improves.

- Another important advantage of MongoDB is horizontal scalability. MongoDB supports sharding, which allows data to be distributed across multiple servers. This makes it easier for FlexiMart to handle a growing product catalog, increased traffic, and large data volumes efficiently. MongoDB is therefore well suited for modern applications that require flexibility and scalability.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Section C: Trade-offs of Using MongoDB  

- One disadvantage of using MongoDB instead of MySQL is weaker support for complex transactions. Relational databases provide strong ACID compliance and are better suited for transaction-heavy operations such as payments, refunds, and financial reporting.

- Another disadvantage is data consistency. MongoDB allows flexible schemas, but without strict structure enforcement, documents may have inconsistent fields. If validation is not properly handled at the application level, this can lead to data quality issues over time.

- Additionally, relational databases often excel at complex joins and analytics, which may require more effort or specialized tools in MongoDB.

- Because of these limitations, MongoDB is best used for flexible and scalable product catalogs, while MySQL remains more suitable for systems that require strong consistency and complex transactions.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

