SELECT 
    o.customer_id,
    (SELECT c.name
     FROM customers c
     WHERE c.customer_id = o.customer_id),
    COUNT(*) AS order_count
FROM orders o 
GROUP BY o.customer_id
ORDER BY order_count DESC, customer_id
LIMIT 3;
