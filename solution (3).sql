-- Task 1: total spend on completed orders for the 2025 signup cohort
SELECT c.customer_id, c.name, SUM(oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.name;

-- Task 2: customers who have never had a cancelled order
SELECT c.customer_id, c.name
FROM customers c
ORDER BY c.customer_id ASC;
