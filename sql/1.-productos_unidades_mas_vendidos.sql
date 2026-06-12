SELECT p.nombre_producto, p.categoria, SUM(oi.cantidad) AS unidades_vendidas
FROM
    order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'entregado'
GROUP BY p.nombre_producto, p.categoria
ORDER BY unidades_vendidas DESC
LIMIT 10;