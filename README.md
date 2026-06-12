# Proyecto 2: Análisis de Ventas y Clientes con SQL

## 📌 Descripción
Análisis de 2,000 órdenes de una tienda e-commerce usando PostgreSQL. 
Se responden preguntas de negocio sobre productos más vendidos, 
estacionalidad por categoría, ranking de productos y clientes recuperados.

## 🛠️ Tecnologías
- PostgreSQL
- Datos simulados en CSV

## 📊 Consultas y resultados

### 1. Top 10 productos más vendidos
**Pregunta de negocio:** ¿Cuáles son los productos que más unidades han vendido?

**Resultado:**
| nombre_producto | unidades_vendidas |
| --------------- | ----------------- |
| Producto_23     | 261               |
| Producto_6      | 232               |
| Producto_19     | 231               |

**Insight:** El producto más vendido es `Producto_23` con 261 unidades. 
La categoría `Deportes` domina el top 10 con 4 productos.

**Recomendación:** Asegurar inventario suficiente en categoría Deportes.

---

### 2. Ventas mensuales por categoría
**Pregunta de negocio:** ¿Cuál es el comportamiento de ventas mensuales por categoría?

**Resultado (primeras filas):**
| mes | categoria   | unidades_vendidas | ingresos_totales |
| --- | ----------- | ----------------- | ---------------- |
| 1   | Electrónica | 312               | 98,450.00        |
| 1   | Deportes    | 245               | 45,230.50        |

**Insight:** Electrónica lidera en ingresos, especialmente en enero y noviembre. 
Deportes tiene picos en verano.

**Recomendación:** Planificar campañas promocionales en meses de baja venta.

---

### 3. Top 3 productos por categoría (RANK)
**Pregunta de negocio:** ¿Cuáles son los 3 productos más vendidos dentro de cada categoría?

**Resultado (primeras filas):**
| categoria   | nombre_producto | unidades_vendidas | ranking |
| ----------- | --------------- | ----------------- | ------- |
| Electrónica | Producto_18     | 189               | 1       |
| Electrónica | Producto_42     | 156               | 2       |
| Electrónica | Producto_7      | 134               | 3       |

**Insight:** `Producto_18` domina la categoría Electrónica con 189 unidades, 
seguido de lejos por `Producto_42` (156).

**Recomendación:** Evaluar por qué `Producto_18` vende tanto (precio, calidad, 
marketing) y replicar estrategia en otros productos.

---

### 4. Clientes recuperados (reactivados)
**Pregunta de negocio:** ¿Qué clientes volvieron a comprar después de al menos 30 días sin actividad?

**Resultado:** 94 clientes identificados.

**Insight:** El 19% de los clientes (94/500) se reactivaron en el último mes. 
Esto representa una oportunidad de campaña de fidelización.

**Recomendación:** Enviar cupones de descuento o emails personalizados a estos 
94 clientes para consolidar su regreso.

---

### 5. Primer producto comprado después de reactivación (Bonus)
**Pregunta de negocio:** ¿Qué producto compró primero cada cliente recuperado?

**Resultado (primeras filas):**
| customer_id | nombre     | nombre_producto | fecha_primera_compra |
| ----------- | ---------- | --------------- | -------------------- |
| 1           | Cliente_1  | Producto_33     | 2024-12-7            |
| 13          | Cliente_13 | Producto_11     | 2024-12-2            |

**Insight:** Los productos más comunes en la primera compra post-reactivación 
son de la categoría `Deportes` y `Electrónica`.

**Recomendación:** Incluir estos productos en la campaña de reactivación.

---
