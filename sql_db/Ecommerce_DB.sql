CREATE DATABASE Ecommerce_DB;
USE Ecommerce_DB;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q1. Top Selling Products by Revenue.
       Query: Total revenue generated per product_id (join order_items and products)
       Concepts: JOIN, SUM(), GROUP BY, ORDER BY */

SELECT 
    pct.product_category_name_english AS Product,
    ROUND(SUM(oi.price), 2) AS Total_Revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
        JOIN
    product_category_name_translation pct ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 5;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q2. Yearly Order Volume
       Query: Number of orders placed per year
       Concepts: DATE_FORMAT(), GROUP BY, time-based aggregation     */

SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y') AS Year,
    COUNT(order_id) AS Total_Orders
FROM 
    orders
GROUP BY 
    DATE_FORMAT(order_purchase_timestamp, '%Y')
ORDER BY 
    Year;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q3. Top Customers by Delivered Orders
       Query: Which customers have the highest number of delivered orders?
       Concepts: WHERE, GROUP BY, COUNT(), ORDER BY                         */

SELECT 
    customer_id AS Customer_ID,
    COUNT(order_id) AS Total_Delivered_Orders
FROM 
    orders
WHERE 
    order_status = 'delivered'
GROUP BY 
    customer_id
ORDER BY 
    total_delivered_orders DESC LIMIT 10;
    
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q4. Rank Product Categories by Average Delivery Time
       Query: Calculate and rank product categories by their average delivery time (in days) between order_approved_at and order_delivered_customer_date.
	   Concepts: DATEDIFF(), AVG(), DENSE_RANK(), GROUP BY, JOIN, ORDER BY, LIMIT                                    */
    
SELECT
    product_category_name_english AS Product,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_approved_at)),
		  2) AS Avg_Delivery_Days,
    DENSE_RANK() OVER (ORDER BY AVG(DATEDIFF(o.order_delivered_customer_date, o.order_approved_at))
		  DESC) AS Delivery_Time_Rank
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
JOIN
    product_category_name_translation pct ON p.product_category_name = pct.product_category_name
WHERE 
    o.order_delivered_customer_date IS NOT NULL
    AND o.order_approved_at IS NOT NULL
    AND pct.product_category_name_english IS NOT NULL
GROUP BY 
    product_category_name_english
ORDER BY 
    delivery_time_rank
LIMIT 10;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q5. Top 5 States by Sales Volume
        Query: Find the top 5 states with the highest total sales volume
        Concepts: JOIN, GROUP BY, SUM(), ORDER BY, LIMIT                            */

SELECT 
    c.customer_state AS state,
    ROUND(SUM(oi.price), 2) AS total_sales_volume
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_state
ORDER BY 
    total_sales_volume DESC
LIMIT 5;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q6. Products with Lowest Review Scores
       Query: Products with average review score < 3
       Concepts: JOIN, AVG(), HAVING, ORDER BY                         */

SELECT 
    product_category_name_english AS Product,
    ROUND(AVG(r.review_score), 2) AS Avg_Review_Score
FROM 
    order_items oi
JOIN 
    orders o ON oi.order_id = o.order_id
JOIN 
    order_reviews r ON o.order_id = r.order_id
JOIN 
    products p ON oi.product_id = p.product_id
JOIN
    product_category_name_translation pct ON p.product_category_name = pct.product_category_name
WHERE 
    r.review_score IS NOT NULL
GROUP BY 
    Product
HAVING 
    AVG(r.review_score) < 3
ORDER BY 
    avg_review_score ASC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Q7. Revenue Contribution by Payment Type
       Query: Total revenue grouped by payment_type
       Concepts: GROUP BY, SUM()                                        */
       
SELECT 
    p.payment_type AS Payment_Type,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS Total_Revenue
FROM 
    order_payments p
JOIN 
    orders o ON p.order_id = o.order_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    p.payment_type
ORDER BY 
    total_revenue DESC;
    
-- ------------------------------------------------------------------------END-OF-TASK-3------------------------------------------------------------------------------------------