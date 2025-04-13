-- ======================================================
-- SECCIÓN 1: Creación de la base de datos y tablas para ventas_db
-- ======================================================

-- Conéctate a una base, por ejemplo "postgres", para crear la nueva base de datos:
CREATE DATABASE ventas_db;

-- Cambiar de conexión a ventas_db:
\c ventas_db

-- Crear tabla clientes: almacena los clientes que realizarán compras
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL
);

-- Crear tabla proveedores: almacena los proveedores de los productos
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_proveedor VARCHAR(255) NOT NULL
);

-- Crear tabla productos: almacena los productos disponibles, asociados a un proveedor
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    id_proveedor INTEGER REFERENCES proveedores(id_proveedor)
);

-- Crear tabla ventas: registra cada venta realizada, enlazando clientes y productos
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

-- Insertar datos en ventas
INSERT INTO ventas (id_cliente, id_producto, precio, fecha) VALUES 
    (1, 1, 1200.00, '2025-04-12'),
    (2, 2, 25.50, '2025-04-11'),
    (3, 3, 45.00, '2025-04-12'),
    (1, 3, 45.00, '2025-04-10');


-- ======================================================
-- SECCIÓN 2: Creación de la base de datos y tablas para universidad_db
-- ======================================================

-- Primero regresa a una base como "postgres" para crear la siguiente DB:
\c postgres

CREATE DATABASE universidad_db;

-- Cambiar de conexión a universidad_db:
\c universidad_db

-- Crear tabla programas: almacena los programas de estudio
CREATE TABLE programas (
    id_programa SERIAL PRIMARY KEY,
    nombre_programa VARCHAR(255) NOT NULL
);

-- Crear tabla cursos: almacena los cursos asociados a un programa y su estado
CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre_curso VARCHAR(255) NOT NULL,
    id_programa INTEGER REFERENCES programas(id_programa),
    estado VARCHAR(50)
);

-- Crear tabla estudiantes: almacena los datos de los estudiantes y su programa
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre_estudiante VARCHAR(255) NOT NULL,
    id_programa INTEGER REFERENCES programas(id_programa)
);

-- Crear tabla matriculas: almacena la relación de estudiantes y cursos
CREATE TABLE matriculas (
    id_estudiante INTEGER REFERENCES estudiantes(id_estudiante),
    id_curso INTEGER REFERENCES cursos(id_curso),
    PRIMARY KEY (id_estudiante, id_curso)
);

-- Crear tabla materias (opcional): almacena materias si los cursos están ligados a ellas
CREATE TABLE materias (
    id_materia SERIAL PRIMARY KEY,
    nombre_materia VARCHAR(255) NOT NULL
);

-- INSERTAR DATOS DE PRUEBA EN universidad_db

-- Insertar datos en programas
INSERT INTO programas (nombre_programa) VALUES 
    ('Ingeniería'),
    ('Medicina');

-- Insertar datos en cursos
INSERT INTO cursos (nombre_curso, id_programa, estado) VALUES
    ('Matemáticas', 1, 'abierto'),
    ('Física', 1, 'cerrado'),
    ('Anatomía', 2, 'abierto');

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

-- Insertar datos en materias (opcional)
INSERT INTO materias (nombre_materia) VALUES 
    ('Cálculo'),
    ('Biología');