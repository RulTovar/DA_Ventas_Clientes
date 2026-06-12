SELECT TRIM(TO_CHAR (o.fecha_pedido, 'Month')) AS mes, p.categoria, SUM(oi.cantidad) AS unidades_vendidas, SUM(oi.cantidad * oi.precio_unitario) AS ingresos_totales
FROM
    products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'entregado'
GROUP BY mes, p.categoria
HAVING SUM(oi.cantidad) > 210
ORDER BY MIN(EXTRACT(MONTH FROM o.fecha_pedido)), p.categoria ASC;
-- =========================
SELECT TRIM(TO_CHAR (o.fecha_pedido, 'Month')) AS mes, p.categoria, SUM(oi.cantidad) AS unidades_vendidas, SUM(oi.cantidad * oi.precio_unitario) AS ingresos_totales
FROM
    products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'entregado'
GROUP BY mes, p.categoria
ORDER BY unidades_vendidas DESC;