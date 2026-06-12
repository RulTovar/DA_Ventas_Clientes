WITH
    fechas AS (SELECT MAX(fecha_pedido) AS hoy FROM orders)
SELECT DISTINCT ON (c.customer_id) c.customer_id, c.nombre, p.nombre_producto, o.fecha_pedido AS fecha_primera_compra_reactivacion
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    CROSS JOIN fechas f
WHERE
    o.status = 'entregado'
    AND o.fecha_pedido >= f.hoy - INTERVAL '30 days'
    AND NOT EXISTS (
        SELECT
            1
        FROM
            orders o2
        WHERE
            o2.customer_id = c.customer_id
            AND o2.status = 'entregado'
            AND o2.fecha_pedido >= f.hoy - INTERVAL '60 days'
            AND o2.fecha_pedido < f.hoy - INTERVAL '30 days'
    )
ORDER BY c.customer_id, o.fecha_pedido ASC;