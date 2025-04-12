-- Asegúrate de estar conectado a universidad_db:
\c universidad_db

-- Crear la vista estudiantes_matriculados_con_programa que muestra estudiantes, cursos en los que están matriculados y el programa de cada curso.
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

-- Probar la vista:
SELECT * FROM estudiantes_matriculados_con_programa;