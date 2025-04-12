# SQL_for_Data_Analysis
Task 3: Elevate Labs

### Objective
Use SQL queries to analyze key aspects of an E-commerce dataset and uncover business insights using filtering, joining, aggregation, and subqueries.

---

### Tools
- MySQL / MySQL Workbench
- SQL script file (`ecommerce_db.sql`)

---

### Dataset Used
- **Olist E-commerce Dataset**

| Table | Description |
|-------|-------------|
| `orders` | Contains order-level metadata and timestamps |
| `order_items` | Details of products within each order |
| `order_payments` | Payment method and value per order |
| `order_reviews` | Customer feedback and review scores |
| `customers` | Customer location and unique IDs |
| `products` | Product info like category, weight, dimensions |
| `sellers` | Seller location and zip code |
| `geolocation` | Mapping of zip codes to geographic coordinates |
| `leads_qualified` / `leads_closed` | Lead funnel and business info |
| `product_category_name_translation` | Translates product category names to English |

---

### GitHub Structure

| Folder/File Name         | Description                                                         |
|--------------------------|---------------------------------------------------------------------|
| `README.md`              | Main guide with objective, tools, and brief description of datasets |
| `raw_data/README.md`     | Contains all uncleaned `.csv` files                                 |
| `sql_db/README.md`       | Includes `Ecommerce_DB.sql`, `Overview_of_Ecommerce_DB_Tables.sql` and ERD file (`ecommerce_erd.mwb`)/ All SQL queries used in the project with screenshot of output results |
| `sql_db_overview/`       | Step-by-step instructions for creating DB in MySQL Workbench        |
| `summary.md`             | Executive summary of findings and insights                          |
| `recommendation.md`      | Proposed recommendation                                              |

---

## SQL queries used:

| TYPES | QUERIES |
|-------|---------|
| Clauses | `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `GROUP BY`, `JOIN` (`INNER, LEFT, RIGHT`), `COMMON EXPRESSION TABLE (CTE)` |
| Aggregate Functions | `SUM`, `AVERAGE`, `COUNT` |
| Alias | `AS` |
| String Function | `ROUND`, `CONCAT` |
| Other Functions | `IF NULL, IS NULL, IS NOT NULL`, `CASE` |

---

## Learnings
- SQL provides a precise, scalable, and repeatable way to extract meaningful business insights.
- Using joins and aggregation, we uncovered customer habits, seller performance, and product-level insights.
- This task reinforces key SQL skills like filtering, joining, grouping, subqueries, and view creation.

## Bonus Tips
- Use EXPLAIN to optimize slow queries.
- Index foreign keys like customer_id, order_id, and product_id.
- Save commonly used queries as views or stored procedures.

---   

## Author
**Damanti Murmu**      
Aspiring Business and Data Analyst | 
[LinkedIn](https://www.linkedin.com/in/damantimurmu/)
