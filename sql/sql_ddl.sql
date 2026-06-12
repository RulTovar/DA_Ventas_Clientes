-- Creamos base de datos en postgresql
CREATE DATABASE db_data_analyst;

-- Seleccionamos la base de datos para crear las tablas
\c db_data_analyst;

-- Creamos tabla de clientes
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE,
    segmento VARCHAR(20)
);

-- Creamos tabla de productos
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    costo NUMERIC(10,2)
);

-- Creamos tabla de órdenes
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    fecha_pedido DATE,
    status VARCHAR(20),
    total NUMERIC(10,2)
);

-- Creamos tabla de items de orden
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    cantidad INTEGER,
    precio_unitario NUMERIC(10,2)
);

-- Creamos tabla de pagos
CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    metodo_pago VARCHAR(30),
    cuotas INTEGER
);

-- Importamos datos desde CSV
COPY customers FROM 'DA_Ventas_Clientes/datos/raw/customers.csv' DELIMITER ',' CSV HEADER;
COPY order_items FROM  'DA_Ventas_Clientes/datos/raw/order_items.csv' DELIMITER ',' CSV HEADER;
COPY orders FROM  'DA_Ventas_Clientes/datos/raw/orders.csv' DELIMITER ',' CSV HEADER;
COPY payments FROM  'DA_Ventas_Clientes/datos/raw/payments.csv' DELIMITER ',' CSV HEADER;
COPY products FROM  'DA_Ventas_Clientes/datos/raw/products.csv' DELIMITER ',' CSV HEADER;

