##  Key SQL Questions and Insights

### Q1. Top Selling Products by Revenue.
        Query: Total revenue generated per product_id (join order_items and products)
        Concepts: JOIN, SUM(), GROUP BY, ORDER BY
#### Input Query:
![image](https://github.com/user-attachments/assets/886e6acf-71c9-43dd-8b93-59636b4bd8f0)

#### Result Output:
![image](https://github.com/user-attachments/assets/1f419744-c444-4406-9743-7f3cfd04190e)

-  Identify products with the highest revenue by joining `order_items` and `products`.

---

### Q2. Yearly Order Volume
        Query: Number of orders placed per year
        Concepts: DATE_FORMAT(), GROUP BY, time-based aggregation

#### Input Query:
![image](https://github.com/user-attachments/assets/6e74b98c-579a-491d-89af-7508e7f0babf)

#### Output Result:
![image](https://github.com/user-attachments/assets/56153cd0-3fec-4853-a848-a6b8e7adfdaa)

- Track the number of orders placed per year using `order_purchase_timestamp`.

---

### Q3. Top Customers by Delivered Orders
        Query: Which customers have the highest number of delivered orders?
        Concepts: WHERE, GROUP BY, COUNT(), ORDER BY
        
#### Input Query:
![image](https://github.com/user-attachments/assets/5bb453af-f213-4392-8ebb-b7cbdb967981)

#### Output Result:
![image](https://github.com/user-attachments/assets/a8ca1522-0677-4218-ae3b-59ac3a87d8b7)

- Top customers whose order is placed and delivered using `GROUP BY` and `COUNT()`.

---

### Q4. Rank Product Categories by Average Delivery Time
       Query: Calculate and rank product categories by their average delivery time (in days) 
              between order_approved_at and order_delivered_customer_date.
	     Concepts: DATEDIFF(), AVG(), DENSE_RANK(), GROUP BY, JOIN, ORDER BY, LIMIT

#### Input Query:
![image](https://github.com/user-attachments/assets/8da74eb2-6963-4abc-8284-6ca26e8111de)

#### Output Result:
![image](https://github.com/user-attachments/assets/440b40fd-1c9c-429a-bfdb-4d25a7c4ceba)

- Calculate the difference between `order_approved_at` and `order_delivered_customer_date` and rank them.

---

### Q5. Top 5 States by Sales Volume
        Query: Find the top 5 states with the highest total sales volume
        Concepts: JOIN, GROUP BY, SUM(), ORDER BY, LIMIT
        
#### Input Query:
![image](https://github.com/user-attachments/assets/e6ca59c8-6bdf-43a5-8e70-ec9b8191c78a)

#### Output Result:
![image](https://github.com/user-attachments/assets/929f2770-f56b-4a69-9bec-ffd8d25852fc)

- Total sales value grouped by `customer_state` using joins.

---

### Q6. Products with Lowest Review Scores
        Query: Products with average review score < 3
        Concepts: JOIN, AVG(), HAVING, ORDER BY
        
#### Input Query:
![image](https://github.com/user-attachments/assets/210f7ba0-394f-4715-9f5e-d6a8afa0183c)

#### Output Result:
![image](https://github.com/user-attachments/assets/35f8211f-26c7-4e6d-9149-38d17b9652ce)

- Products with an average review score below 3.

---

### Q7. Revenue Contribution by Payment Type
       Query: Total revenue grouped by payment_type
       Concepts: GROUP BY, SUM(), JOIN                                        

#### Input Query:
![image](https://github.com/user-attachments/assets/57eed708-c5b3-42b0-b3e8-01e73484161a)

#### Output Result:
![image](https://github.com/user-attachments/assets/04bb38dc-dfb3-44fd-806b-bdae7ed447c8)

- Group total `payment_value` by `payment_type`.
