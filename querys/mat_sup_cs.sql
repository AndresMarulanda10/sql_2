-- Esta consulta identifica las materias que tienen mayor número de cursos con estudiantes matriculados.
-- Se asume que la tabla cursos cuenta con la columna id_materia que referencia a materias(id_materia).
SELECT 
    m.id_materia, 
    m.nombre_materia,
    COUNT(DISTINCT c.id_curso) AS total_cursos_con_estudiantes
FROM materias m
JOIN cursos c ON m.id_materia = c.id_materia
JOIN matriculas mat ON c.id_curso = mat.id_curso
GROUP BY m.id_materia, m.nombre_materia
ORDER BY total_cursos_con_estudiantes DESC;

-- Probar la consulta:
-- SELECT 
--     m.id_materia, 
--     m.nombre_materia,
--     COUNT(DISTINCT c.id_curso) AS total_cursos_con_estudiantes
-- FROM materias m
-- JOIN cursos c ON m.id_materia = c.id_materia
-- JOIN matriculas mat ON c.id_curso = mat.id_curso
-- GROUP BY m.id_materia, m.nombre_materia
-- ORDER BY total_cursos_con_estudiantes DESC;