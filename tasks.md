---

# **✅ Lista de Tareas Técnicas — Actividad 6 (SQL)**

---

## **🔧 CONFIGURACIÓN INICIAL**

1. Instalar y configurar uno de los siguientes motores de base de datos: PostgreSQL, MySQL o MariaDB.
2. Crear dos bases de datos vacías:
    - ventas_db
    - universidad_db
3. Crear las siguientes tablas en ventas_db:
    - clientes (id_cliente, nombre_cliente)
    - productos (id_producto, nombre_producto, id_proveedor)
    - proveedores (id_proveedor, nombre_proveedor)
    - ventas (id_venta, id_cliente, id_producto, precio, fecha)
4. Crear las siguientes tablas en universidad_db:
    - programas (id_programa, nombre_programa)
    - cursos (id_curso, nombre_curso, id_programa, estado)
    - estudiantes (id_estudiante, nombre_estudiante, id_programa)
    - matriculas (id_estudiante, id_curso)
    - materias (id_materia, nombre_materia) *(opcional: si cursos están ligados a materias)*
5. Insertar datos de prueba suficientes en ambas bases de datos para permitir validación visual de las consultas.

---

## **📌 PUNTO 1: CREACIÓN DE VISTAS**

> Todas las vistas deben crearse con CREATE VIEW nombre_vista AS (...) y probarse con SELECT * FROM nombre_vista;.
> 
1. Crear la vista ventas_clientes_proveedores que muestre todas las ventas con el nombre del cliente y del proveedor.
2. Crear la vista ventas_hoy que muestre solo las ventas con fecha igual a la actual (CURRENT_DATE o CURDATE()).
3. Crear la vista cursos_por_programa que liste todos los cursos y el programa al que pertenecen.
4. Crear la vista estudiantes_matriculados_con_programa que muestre estudiantes, cursos en los que están matriculados y el programa de cada curso.
5. Crear la vista total_cursos_con_estudiantes_por_programa que cuente cuántos cursos tienen estudiantes por cada programa.

---

## **📌 PUNTO 2: SENTENCIAS SQL**

> Todas las consultas deben guardarse con comentarios -- explicando lo que hacen.
> 
1. Escribir una consulta que identifique productos que no han sido vendidos.
2. Escribir una consulta que identifique proveedores cuyos productos no han sido vendidos, mostrar el nombre en mayúsculas y ordenarlos de forma descendente.
3. Escribir una consulta que identifique clientes que no han comprado ningún producto.
4. Escribir una consulta que identifique clientes que han comprado en más de un día distinto, ordenados de forma descendente.
5. Escribir una consulta que identifique clientes cuyo precio de pedido es superior al promedio de todas las ventas.
6. Escribir una consulta que identifique cursos con estado “abierto” y el número de estudiantes matriculados en cada uno.
7. Escribir una consulta que identifique programas que tienen estudiantes sin ningún curso matriculado.
8. Escribir una consulta que identifique materias con mayor número de cursos con estudiantes matriculados.
9. Escribir una consulta que use HAVING en ventas_db, por ejemplo para mostrar clientes con más de N compras. Explicar en comentario qué se busca con la condición HAVING.
10. Escribir una consulta en universidad_db que use JOIN para combinar datos de todas las tablas relevantes (programas, estudiantes, cursos, matriculas, materias). Explicar en comentario qué relación se está visualizando.

---

## **💾 EXPORTACIÓN Y ENTREGA**

1. Exportar estructura y datos de ambas bases de datos (ventas_db y universidad_db) en formato SQL.
2. Incluir en el archivo final .sql todas las sentencias CREATE, INSERT, CREATE VIEW y SELECT, en orden.
3. Comentar claramente cada sección en el script con -- PUNTO X: DESCRIPCIÓN.
4. Guardar el archivo como actividad6_taller.sql.
5. Validar que el archivo se puede ejecutar sin errores desde un entorno nuevo.

---

¿Te gustaría que convierta esta lista directamente en un archivo .md o .txt para compartir con tu equipo? También puedo ayudarte con las estructuras de tablas y datos de prueba si lo necesitas.