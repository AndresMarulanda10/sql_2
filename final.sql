--------------------------------------------------------------------------------
-- PUNTO 1: CREACIÓN DE LAS BASES DE DATOS, TABLAS Y DATOS DE PRUEBA
--------------------------------------------------------------------------------

------------------------------
-- SECCIÓN 1.1: ventas_db
------------------------------
-- Conéctate a una base existente, por ejemplo "postgres", para crear la base de datos ventas_db.
CREATE DATABASE ventas_db;

-- Cambiar de conexión a ventas_db:
\c ventas_db

-- Crear tabla clientes: almacena los clientes que realizan compras.
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL
);

-- Crear tabla proveedores: almacena los proveedores de los productos.
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL
);

-- Crear tabla productos: almacena los productos disponibles y su proveedor.
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    id_proveedor INTEGER REFERENCES proveedores(id_proveedor)
);

-- Crear tabla ventas: registra cada venta realizada.
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    id_producto INTEGER REFERENCES productos(id_producto),
    precio NUMERIC(10,2) NOT NULL,
    fecha DATE NOT NULL
);

-- INSERTAR DATOS DE PRUEBA EN ventas_db
-- Insertar datos en clientes
INSERT INTO clientes (nombre_cliente) VALUES 
    ('Juan Perez'),
    ('Maria Gomez'),
    ('Carlos Sánchez');

-- Insertar datos en proveedores
INSERT INTO proveedores (nombre_proveedor) VALUES 
    ('Proveedor A'),
    ('Proveedor B');

-- Insertar datos en productos
INSERT INTO productos (nombre_producto, id_proveedor) VALUES 
    ('Laptop', 1),
    ('Mouse', 1),
    ('Teclado', 2);

-- Insertar datos en ventas (fechas en formato 'YYYY-MM-DD')
INSERT INTO ventas (id_cliente, id_producto, precio, fecha) VALUES 
    (1, 1, 1200.00, '2025-04-12'),
    (2, 2, 25.50, '2025-04-11'),
    (3, 3, 45.00, '2025-04-12'),
    (1, 3, 45.00, '2025-04-10');

--------------------------------------------------------------------------------
------------------------------
-- SECCIÓN 1.2: universidad_db
------------------------------
-- Regresa a la base "postgres" para crear la siguiente base de datos.
\c postgres

CREATE DATABASE universidad_db;

-- Cambiar de conexión a universidad_db:
\c universidad_db

-- Crear tabla programas: almacena los programas de estudio.
CREATE TABLE programas (
    id_programa SERIAL PRIMARY KEY,
    nombre_programa VARCHAR(255) NOT NULL
);

-- Crear tabla cursos: almacena los cursos asociados a un programa y su estado.
-- (Se ha ampliado la tabla para incluir id_materia que referencia a materias.)
CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre_curso VARCHAR(255) NOT NULL,
    id_programa INTEGER REFERENCES programas(id_programa),
    estado VARCHAR(50),
    id_materia INTEGER  -- Esta columna se usará para relacionar con la tabla materias.
);

-- Crear tabla estudiantes: almacena los datos de los estudiantes y su programa.
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre_estudiante VARCHAR(255) NOT NULL,
    id_programa INTEGER REFERENCES programas(id_programa)
);

-- Crear tabla matriculas: almacena la relación de estudiantes y cursos.
CREATE TABLE matriculas (
    id_estudiante INTEGER REFERENCES estudiantes(id_estudiante),
    id_curso INTEGER REFERENCES cursos(id_curso),
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Crear tabla materias (opcional): almacena materias si los cursos están ligados a ellas.
CREATE TABLE materias (
    id_materia SERIAL PRIMARY KEY,
    nombre_materia VARCHAR(255) NOT NULL
);

-- INSERTAR DATOS DE PRUEBA EN universidad_db
-- Insertar datos en programas
INSERT INTO programas (nombre_programa) VALUES 
    ('Ingeniería'),
    ('Medicina');

-- Insertar datos en materias
INSERT INTO materias (nombre_materia) VALUES 
    ('Cálculo'),
    ('Biología');

-- Insertar datos en cursos
-- Se asigna id_materia arbitrario para relacionar con materias. Por ejemplo, 1 para 'Cálculo', 2 para 'Biología'.
INSERT INTO cursos (nombre_curso, id_programa, estado, id_materia) VALUES
    ('Matemáticas', 1, 'abierto', 1),
    ('Física', 1, 'cerrado', 2),
    ('Anatomía', 2, 'abierto', 2);

-- Insertar datos en estudiantes
INSERT INTO estudiantes (nombre_estudiante, id_programa) VALUES
    ('Ana Torres', 1),
    ('Luis Ramírez', 1),
    ('Carla Díaz', 2);

-- Insertar datos en matriculas
INSERT INTO matriculas (id_estudiante, id_curso) VALUES
    (1, 1),
    (2, 1),
    (3, 3);

--------------------------------------------------------------------------------
-- PUNTO 2: CREACIÓN DE VISTAS
--------------------------------------------------------------------------------

------------------------------
-- VISTAS EN ventas_db
------------------------------
-- Cambiar conexión a ventas_db:
\c ventas_db

-- Vista: ventas_clientes_proveedores
-- Muestra todas las ventas con el nombre del cliente y del proveedor.
CREATE VIEW ventas_clientes_proveedores AS 
SELECT 
    v.id_venta,
    c.nombre_cliente,
    pr.nombre_proveedor,
    v.precio,
    v.fecha
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor;

-- Vista: ventas_hoy
-- Muestra solo las ventas con fecha igual a la fecha actual.
CREATE VIEW ventas_hoy AS
SELECT *
FROM ventas
WHERE fecha = CURRENT_DATE;

------------------------------
-- VISTAS EN universidad_db
------------------------------
-- Cambiar conexión a universidad_db:
\c universidad_db

-- Vista: cursos_por_programa
-- Lista todos los cursos y el programa al que pertenecen.
CREATE VIEW cursos_por_programa AS
SELECT 
    cu.id_curso,
    cu.nombre_curso,
    p.nombre_programa
FROM cursos cu
JOIN programas p ON cu.id_programa = p.id_programa;

-- Vista: estudiantes_matriculados_con_programa
-- Muestra estudiantes, cursos en los que están matriculados y el programa de cada curso.
CREATE VIEW estudiantes_matriculados_con_programa AS
SELECT 
    e.id_estudiante,
    e.nombre_estudiante,
    c.id_curso,
    c.nombre_curso,
    p.nombre_programa
FROM matriculas m
JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
JOIN cursos c ON m.id_curso = c.id_curso
JOIN programas p ON c.id_programa = p.id_programa;

-- Vista: total_cursos_con_estudiantes_por_programa
-- Cuenta cuántos cursos tienen estudiantes por cada programa.
CREATE VIEW total_cursos_con_estudiantes_por_programa AS
SELECT 
    p.nombre_programa,
    COUNT(DISTINCT m.id_curso) AS total_cursos_con_estudiantes
FROM matriculas m
JOIN cursos c ON m.id_curso = c.id_curso
JOIN programas p ON c.id_programa = p.id_programa
GROUP BY p.nombre_programa;

--------------------------------------------------------------------------------
-- PUNTO 3: SENTENCIAS SQL (CONSULTAS)
--------------------------------------------------------------------------------

------------------------------
-- Consultas en ventas_db
------------------------------
-- Cambiar a ventas_db:
\c ventas_db

-- Consulta: Productos que no han sido vendidos.
-- Se seleccionan los productos cuyo id no aparece en la tabla ventas.
SELECT *
FROM productos
WHERE id_producto NOT IN (SELECT id_producto FROM ventas);

-- Consulta: Proveedores cuyos productos no han sido vendidos, mostrando el nombre en mayúsculas y ordenados descendentemente.
SELECT UPPER(p.nombre_proveedor) AS nombre_proveedor
FROM proveedores p
WHERE NOT EXISTS (
    SELECT 1
    FROM productos pr
    JOIN ventas v ON pr.id_producto = v.id_producto
    WHERE pr.id_proveedor = p.id_proveedor
)
ORDER BY nombre_proveedor DESC;

-- Consulta: Clientes que no han comprado ningún producto.
SELECT *
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM ventas v
    WHERE v.id_cliente = c.id_cliente
);

-- Consulta: Clientes que han comprado en más de un día distinto, ordenados de forma descendente.
SELECT 
    c.id_cliente, 
    c.nombre_cliente, 
    COUNT(DISTINCT v.fecha) AS dias_compra
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(DISTINCT v.fecha) > 1
ORDER BY c.nombre_cliente DESC;

-- Consulta: Clientes cuyo precio de pedido (promedio de sus compras) es superior al promedio de todas las ventas.
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    AVG(v.precio) AS avg_precio_cliente
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING AVG(v.precio) > (SELECT AVG(precio) FROM ventas);

-- Consulta: Clientes que han realizado más de N compras (se usa 2 como ejemplo) usando HAVING.
-- La cláusula HAVING filtra los grupos generados por la agregación, mostrando sólo los clientes que cumplen la condición.
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    COUNT(v.id_venta) AS total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(v.id_venta) > 2;


------------------------------
-- Consultas en universidad_db
------------------------------
-- Cambiar a universidad_db:
\c universidad_db

-- Consulta: Cursos con estado "abierto" y número de estudiantes matriculados en cada uno.
SELECT 
    c.id_curso,
    c.nombre_curso,
    COUNT(m.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN matriculas m ON c.id_curso = m.id_curso
WHERE c.estado = 'abierto'
GROUP BY c.id_curso, c.nombre_curso;

-- Consulta: Programas que tienen estudiantes sin ningún curso matriculado.
SELECT DISTINCT 
    p.id_programa,
    p.nombre_programa
FROM programas p
JOIN estudiantes e ON p.id_programa = e.id_programa
WHERE NOT EXISTS (
    SELECT 1
    FROM matriculas m
    WHERE m.id_estudiante = e.id_estudiante
);

-- Consulta: Materias con mayor número de cursos con estudiantes matriculados.
-- Se asume que la columna id_materia en cursos referencia a materias(id_materia).
SELECT 
    m.id_materia, 
    m.nombre_materia,
    COUNT(DISTINCT c.id_curso) AS total_cursos_con_estudiantes
FROM materias m
JOIN cursos c ON m.id_materia = c.id_materia
JOIN matriculas mat ON c.id_curso = mat.id_curso
GROUP BY m.id_materia, m.nombre_materia
ORDER BY total_cursos_con_estudiantes DESC;

-- Consulta: JOIN para combinar datos de todas las tablas relevantes (programas, estudiantes, cursos, matriculas, materias).
-- Se muestra la relación entre:
-- • Programas (programas),
-- • Estudiantes inscritos (estudiantes),
-- • Cursos en los que se matriculan (cursos y matriculas) y,
-- • Materias asociadas a los cursos (materias).
SELECT 
    p.id_programa,
    p.nombre_programa,
    e.id_estudiante,
    e.nombre_estudiante,
    c.id_curso,
    c.nombre_curso,
    c.estado,
    ma.id_materia,
    ma.nombre_materia
FROM programas p
JOIN estudiantes e ON e.id_programa = p.id_programa
JOIN matriculas m ON m.id_estudiante = e.id_estudiante
JOIN cursos c ON c.id_curso = m.id_curso
LEFT JOIN materias ma ON c.id_materia = ma.id_materia;

--------------------------------------------------------------------------------
-- FIN DEL SCRIPT
--------------------------------------------------------------------------------

-- Nota: Este archivo único integra la estructura, los datos de prueba, las vistas y las consultas
-- requeridas en la actividad. Asegúrate de ejecutar cada sección secuencialmente y de tener los permisos adecuados.