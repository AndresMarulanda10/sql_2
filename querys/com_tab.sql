-- Esta consulta combina datos de las tablas programas, estudiantes, cursos, matriculas y materias.
-- Se visualiza la relación entre:
-- • Los programas de estudio (programas)
-- • Los estudiantes inscritos en cada programa (estudiantes)
-- • Los cursos en los que estos estudiantes se matriculan (cursos y matriculas)
-- • Las materias asociadas a los cursos (materias)
-- Se asume que la tabla cursos cuenta con la columna id_materia que referencia a materias(id_materia).

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

-- Probar la consulta:
-- SELECT 
--     p.id_programa,
--     p.nombre_programa,
--     e.id_estudiante,
--     e.nombre_estudiante,
--     c.id_curso,
--     c.nombre_curso,
--     c.estado,
--     ma.id_materia,
--     ma.nombre_materia
-- FROM programas p
-- JOIN estudiantes e ON e.id_programa = p.id_programa
-- JOIN matriculas m ON m.id_estudiante = e.id_estudiante
-- JOIN cursos c ON c.id_curso = m.id_curso
-- LEFT JOIN materias ma ON c.id_materia = ma.id_materia;