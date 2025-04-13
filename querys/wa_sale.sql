-- Esta consulta identifica los productos que no han sido vendidos.
-- Se seleccionan los productos cuyo id no aparece en ninguna venta registrada en la tabla ventas.
SELECT *
FROM productos
WHERE id_producto NOT IN (SELECT id_producto FROM ventas);

-- Probar la consulta:
-- SELECT * FROM productos WHERE id_producto NOT IN (SELECT id_producto FROM ventas);