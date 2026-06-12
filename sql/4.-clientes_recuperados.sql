WITH fechas AS 
    (SELECT MAX(fecha_pedido) AS hoy FROM orders)
SELECT DISTINCT c.customer_id, c.nombre
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    CROSS JOIN fechas f
WHERE
    o.status = 'entregado'
    AND o.fecha_pedido >= f.hoy - INTERVAL '30 days'
    AND NOT EXISTS (
        SELECT 1
        FROM orders o2
        WHERE
            o2.customer_id = c.customer_id
            AND o2.status = 'entregado'
            AND o2.fecha_pedido >= f.hoy - INTERVAL '60 days'
            AND o2.fecha_pedido < f.hoy - INTERVAL '30 days'
    )
ORDER BY c.customer_id;