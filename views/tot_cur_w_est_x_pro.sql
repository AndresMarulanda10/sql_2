-- Asegúrate de estar conectado a universidad_db:
\c universidad_db

-- Crear la vista total_cursos_con_estudiantes_por_programa que cuenta cuántos cursos tienen estudiantes por cada programa.
CREATE VIEW total_cursos_con_estudiantes_por_programa AS
SELECT 
    p.nombre_programa,
    COUNT(DISTINCT m.id_curso) AS total_cursos_con_estudiantes
FROM matriculas m
JOIN cursos c ON m.id_curso = c.id_curso
JOIN programas p ON c.id_programa = p.id_programa
GROUP BY p.nombre_programa;

-- Probar la vista:
SELECT * FROM total_cursos_con_estudiantes_por_programa;