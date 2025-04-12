-- Esta consulta identifica los clientes que no han comprado ningún producto.
SELECT *
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM ventas v
    WHERE v.id_cliente = c.id_cliente
);

-- Probar la consulta:
-- SELECT *
-- FROM clientes c
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM ventas v
--     WHERE v.id_cliente = c.id_cliente
-- );