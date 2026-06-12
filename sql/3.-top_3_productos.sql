WITH ranking_productos AS (
    SELECT
        p.categoria,
        p.nombre_producto,
        SUM(oi.cantidad) AS unidades_vendidas,
        RANK() OVER (PARTITION BY p.categoria ORDER BY SUM(oi.cantidad) DESC) AS ranking
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'entregado'
    GROUP BY p.categoria, p.nombre_producto
)
SELECT *
FROM ranking_productos
WHERE ranking <= 3
ORDER BY ranking ASC, categoria ASC;