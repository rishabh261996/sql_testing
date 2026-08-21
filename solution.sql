-- Task 1: total spend on completed orders for the 2025 signup cohort
SELECT
    c.customer_id,
    c.name,
    ROUND(COALESCE(SUM(oi.quantity * oi.unit_price), 0), 2) AS total_spent
FROM customers c
LEFT JOIN orders o
       ON o.customer_id = c.customer_id
      AND o.status = 'completed'
LEFT JOIN order_items oi
       ON oi.order_id = o.order_id
WHERE c.signup_date >= DATE '2025-01-01'
  AND c.signup_date <  DATE '2026-01-01'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC, c.customer_id ASC;

-- Task 2: customers who have never had a cancelled order
SELECT c.customer_id, c.name
FROM customers c
WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.customer_id = c.customer_id
          AND o.status = 'cancelled'
      )
ORDER BY c.customer_id ASC;
