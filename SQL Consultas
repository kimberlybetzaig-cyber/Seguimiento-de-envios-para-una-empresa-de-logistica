-- CONSULTAS ESPECÍFICAS
-- =======================================

-- 1. Envíos en tránsito con cliente
SELECT e.id_envío, c.nombre AS cliente, e.estado_actual, e.fecha_envío, e.fecha_estimada_entrega
FROM envíos e
JOIN clientes c ON e.id_cliente_remitente = c.id_cliente
WHERE e.estado_actual = 'En tránsito';

-- 2. Paquetes de un envío específico
SELECT p.id_paquete, p.descripcion, p.peso, p.valor
FROM paquetes p
JOIN envíos e ON p.id_paquete = e.id_paquete
WHERE e.id_envío = 1; -- Cambia el número por el ID del envío

-- 3. Historial de envíos de un cliente específico
SELECT e.id_envío, e.fecha_envío, e.estado_actual, e.fecha_estimada_entrega
FROM envíos e
JOIN clientes c ON e.id_cliente_remitente = c.id_cliente
WHERE c.nombre = 'Juan Pérez'
ORDER BY e.fecha_envío DESC;

-- 4. Total de envíos asignados por transportista
SELECT t.nombre AS transportista, COUNT(s.id_envío) AS total_envíos
FROM transportistas t
JOIN seguimiento s ON t.id_transportista = s.id_transportista
GROUP BY t.nombre;

-- 5. Peso total de un envío
SELECT e.id_envío, SUM(p.peso) AS peso_total
FROM envíos e
JOIN paquetes p ON e.id_paquete = p.id_paquete
WHERE e.id_envío = 1 -- Cambia por el ID del envío que quieras consultar
GROUP BY e.id_envío;
