-- Asegúrate de estar conectado a ventas_db:
\c ventas_db

-- Crear la vista ventas_hoy que muestra solo las ventas con fecha igual a la actual.
CREATE VIEW ventas_hoy AS
SELECT *
FROM ventas
WHERE fecha = CURRENT_DATE;

-- Probar la vista:
SELECT * FROM ventas_hoy;