-- Esta consulta identifica programas que tienen estudiantes sin ningún curso matriculado.
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

-- Probar la consulta:
-- SELECT DISTINCT 
--     p.id_programa,
--     p.nombre_programa
-- FROM programas p
-- JOIN estudiantes e ON p.id_programa = e.id_programa
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM matriculas m
--     WHERE m.id_estudiante = e.id_estudiante
-- );