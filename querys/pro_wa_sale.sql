-- Esta consulta identifica proveedores cuyos productos no han sido vendidos.
-- Se selecciona el nombre del proveedor en mayúsculas, ordenados de forma descendente.
SELECT UPPER(p.nombre_proveedor) AS nombre_proveedor
FROM proveedores p
WHERE NOT EXISTS (
    SELECT 1
    FROM productos pr
    JOIN ventas v ON pr.id_producto = v.id_producto
    WHERE pr.id_proveedor = p.id_proveedor
)
ORDER BY nombre_proveedor DESC;

-- Probar la consulta:
-- SELECT UPPER(p.nombre_proveedor) AS nombre_proveedor
-- FROM proveedores p
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM productos pr
--     JOIN ventas v ON pr.id_producto = v.id_producto
--     WHERE pr.id_proveedor = p.id_proveedor
-- )
-- ORDER BY nombre_proveedor DESC;