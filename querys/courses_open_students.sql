-- Esta consulta identifica cursos con estado "abierto" y el número de estudiantes matriculados en cada uno.
SELECT 
    c.id_curso,
    c.nombre_curso,
    COUNT(m.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN matriculas m ON c.id_curso = m.id_curso
WHERE c.estado = 'abierto'
GROUP BY c.id_curso, c.nombre_curso;

-- Probar la consulta:
-- SELECT 
--     c.id_curso,
--     c.nombre_curso,
--     COUNT(m.id_estudiante) AS total_estudiantes
-- FROM cursos c
-- LEFT JOIN matriculas m ON c.id_curso = m.id_curso
-- WHERE c.estado = 'abierto'
-- GROUP BY c.id_curso, c.nombre_curso;
```-- filepath: ./courses_open_students.sql
-- Esta consulta identifica cursos con estado "abierto" y el número de estudiantes matriculados en cada uno.
SELECT 
    c.id_curso,
    c.nombre_curso,
    COUNT(m.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN matriculas m ON c.id_curso = m.id_curso
WHERE c.estado = 'abierto'
GROUP BY c.id_curso, c.nombre_curso;

-- Probar la consulta:
-- SELECT 
--     c.id_curso,
--     c.nombre_curso,
--     COUNT(m.id_estudiante) AS total_estudiantes
-- FROM cursos c
-- LEFT JOIN matriculas m ON c.id_curso = m.id_curso
-- WHERE c.estado = 'abierto'
-- GROUP BY c.id_curso, c.nombre_curso;