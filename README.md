# Actividad 6 – SQL

Este repositorio contiene el entregable para la Actividad 6, donde se trabajaron dos bases de datos: **ventas_db** y **universidad_db**.

## ¿Qué se hizo?

1. **Creación de las Bases de Datos y Tablas**  
   - Se crearon dos bases de datos: `ventas_db` y `universidad_db`.
   - En `ventas_db` se crearon las tablas: `clientes`, `proveedores`, `productos` y `ventas`.
   - En `universidad_db` se crearon las tablas: `programas`, `cursos` (con columna opcional `id_materia`), `estudiantes`, `matriculas` y `materias`.

2. **Inserción de Datos de Prueba**  
   - Se insertaron registros de ejemplo en todas las tablas de ambas bases de datos, de modo que se puedan validar las consultas.

3. **Creación de Vistas**  
   - Se desarrollaron vistas en cada base de datos para facilitar reportes.  
     Ejemplos:  
     - En `ventas_db`: `ventas_clientes_proveedores` y `ventas_hoy`.  
     - En `universidad_db`: `cursos_por_programa`, `estudiantes_matriculados_con_programa` y `total_cursos_con_estudiantes_por_programa`.

4. **Consultas SQL (Sentencias SQL)**  
   - Se realizaron diversas consultas que incluyen cláusulas `JOIN`, `HAVING` y subconsultas para obtener datos específicos:
     - Productos que no han sido vendidos.
     - Proveedores con productos sin ventas (nombre en mayúsculas, orden descendente).
     - Clientes sin compras.
     - Clientes que compraron en más de un día distinto.
     - Clientes cuyo precio de pedido supera el promedio de todas las ventas.
     - Clientes que realizaron más de N compras (usando `HAVING`).
     - En `universidad_db`: cursos con estado “abierto” y cantidad de estudiantes, programas con estudiantes sin curso, materias con mayor número de cursos con estudiantes y una consulta JOIN que combina los datos de todas las tablas relevantes.

## ¿Cómo utilizar el entregable?

El archivo **final.sql** contiene, en orden, todas las sentencias requeridas para la actividad (estructura, datos, vistas y consultas). Para ejecutarlo en un entorno PostgreSQL nuevo sigue estos pasos:

1. **Abrir la Terminal**  
   - Asegúrate de tener PostgreSQL instalado y en funcionamiento.
   - Si utilizas macOS y Homebrew, puedes iniciar PostgreSQL con:
     ```bash
     brew services start postgresql
     ```

2. **Acceder a psql**  
   - Inicia la consola de PostgreSQL con:
     ```bash
     psql postgres
     ```

3. **Ejecutar el Script**  
   - Desde psql, ejecuta el script completo. **Nota:** Asegúrate de estar en la carpeta raíz del proyecto o ajusta la ruta relativa al archivo `final.sql`. Por ejemplo:
     ```sql
     \i ./final.sql
     ```
   - Esto creará las bases de datos, las tablas, insertará los datos, creará las vistas y realizará las consultas según el orden especificado.

## Notas Adicionales

- El archivo está organizado en secciones, cada una con comentarios claros (por ejemplo, `-- PUNTO 1: CREACIÓN DE LAS BASES DE DATOS, TABLAS Y DATOS DE PRUEBA`) para facilitar su comprensión y ejecución.
- Se han utilizado comandos de conexión (`\c ventas_db`, `\c universidad_db`) para garantizar que cada sentencia se ejecute en la base de datos correcta.
- La ruta especificada para ejecutar el script es relativa. Se recomienda ubicarte en la carpeta donde se encuentre `final.sql` o modificar la ruta en el comando `\i` de acuerdo a la ubicación real del archivo.

Con estos pasos y la documentación del archivo **final.sql**, cualquier integrante del equipo podrá replicar el entorno y validar visualmente las consultas.

¡Listo para validar y entregar la actividad!