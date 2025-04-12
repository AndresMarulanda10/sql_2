-- Esta consulta muestra los clientes que han realizado más de N compras.
-- La cláusula HAVING se usa para filtrar los grupos de resultados generados por la función de agregación.
-- En este caso, se filtran los clientes cuya cantidad de compras (ventas) es mayor a N (se usa 2 como ejemplo).
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    COUNT(v.id_venta) AS total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(v.id_venta) > 2;

-- Probar la consulta:
-- SELECT 
--     c.id_cliente,
--     c.nombre_cliente,
--     COUNT(v.id_venta) AS total_compras
-- FROM clientes c
-- JOIN ventas v ON c.id_cliente = v.id_cliente
-- GROUP BY c.id_cliente, c.nombre_cliente
-- HAVING COUNT(v.id_venta) > 2;