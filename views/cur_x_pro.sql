-- Asegúrate de estar conectado a universidad_db:
\c universidad_db

-- Crear la vista cursos_por_programa que lista todos los cursos y el programa al que pertenecen.
CREATE VIEW cursos_por_programa AS
SELECT 
    cu.id_curso,
    cu.nombre_curso,
    p.nombre_programa
FROM cursos cu
JOIN programas p ON cu.id_programa = p.id_programa;

-- Probar la vista:
SELECT * FROM cursos_por_programa;