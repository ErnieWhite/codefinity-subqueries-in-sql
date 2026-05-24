SELECT (SELECT p.category FROM products p WHERE p.product_id = o.product_id) AS category, SUM(o.quantity) AS total_quantity
FROM orders o
GROUP BY category
HAVING SUM(o.quantity) = (SELECT SUM(o.quantity) as total FROM orders o GROUP BY (SELECT p.category FROM products p WHERE p.product_id = o.product_id) ORDER BY total DESC LIMIT 1);
