USE carmotors;

-- Inserciones para la tabla Cliente
INSERT INTO cliente (nombre, identificacion, telefono, correo_electronico) VALUES
('Ana Pérez', '123456789', '3001112222', 'ana.perez@email.com'),
('Carlos López', '987654321', '3103334444', 'carlos.lopez@email.com'),
('Sofía Gómez', '456789123', '3205556666', 'sofia.gomez@email.com');

-- Inserciones para la tabla Vehiculo
INSERT INTO vehiculo (id_cliente, marca, modelo, placa, tipo_vehiculo) VALUES
(1, 'Toyota', 'Corolla', 'ABC-123', 'Sedan'),
(2, 'Mazda', 'CX-5', 'DEF-456', 'SUV'),
(1, 'Renault', 'Sandero', 'GHI-789', 'Hatchback'),
(3, 'Nissan', 'Frontier', 'JKL-012', 'Camioneta');

-- Inserciones para la tabla Proveedor
INSERT INTO proveedor (nombre, NIT, contacto, frecuencia_visitas) VALUES
('Distribuidora XYZ', '800111222-3', 'Juan Rodríguez', 'Semanal'),
('Importadora ABC', '900222333-4', 'María González', 'Mensual'),
('Lubricantes SAS', '890333444-5', 'Pedro Vargas', 'Quincenal');

-- Inserciones para la tabla Repuesto
INSERT INTO repuesto (nombre_repuesto, tipo_repuesto, marca, modelo_compatible, vida_util_estimada, precio) VALUES
('Filtro de aceite', 'Mecanico', 'FRAM', 'Toyota Corolla', '2026-05-06', 15.50),
('Bujía de encendido', 'Electrico', 'NGK', 'Mazda CX-5', '2027-05-06', 8.75),
('Parachoques delantero', 'Carroceria', 'Generico', 'Renault Sandero', NULL, 120.00),
('Aceite de motor 10W-40', 'Consumo', 'Mobil', 'Todos', NULL, 35.99);

-- Inserciones para la tabla Lote
INSERT INTO lote (id_repuesto, id_proveedor, fecha_ingreso, cantidad_inicial, cantidad_disponible) VALUES
(1, 1, '2024-12-15', 100, 95),
(2, 2, '2025-01-20', 50, 48),
(3, 1, '2025-03-10', 20, 20),
(4, 3, '2025-04-01', 200, 180);

-- Inserciones para la tabla Orden_Compra
INSERT INTO orden_compra (id_proveedor, fecha_orden, estado, observaciones) VALUES
(1, '2025-04-25', 'Recibida', 'Pedido de rutina'),
(2, '2025-05-01', 'Enviada', 'Urgente por falta de stock'),
(3, '2025-05-05', 'Pendiente', 'Revisar precios');

-- Inserciones para la tabla Detalle_Orden_Compra
INSERT INTO detalle_orden_compra (id_orden_compra, id_repuesto, cantidad_solicitada, precio_unitario) VALUES
(1, 1, 10, 14.00),
(1, 3, 2, 110.00),
(2, 2, 5, 8.00),
(3, 4, 15, 32.50);

-- Inserciones para la tabla Servicio
INSERT INTO servicio (tipo_mantenimiento, descripcion, costo_mano_obra, estado_servicio, tiempo_estimado) VALUES
('PREVENTIVO', 'Cambio de aceite y filtro', 45.00, 'COMPLETADO', 60),
('CORRECTIVO', 'Reparación de motor', 150.00, 'EN_PROCESO', 180),
('PREVENTIVO', 'Revisión de frenos', 30.00, 'PENDIENTE', 45);

-- Inserciones para la tabla Trabajo
INSERT INTO trabajo (id_vehiculo, id_servicio, fecha_recepcion, fecha_entrega, tecnico_asignado) VALUES
(1, 1, '2025-05-02', '2025-05-02', 'Andrés Gómez'),
(2, 2, '2025-05-05', NULL, 'Laura Vargas'),
(3, 3, '2025-05-06', NULL, 'Carlos Pérez');

-- Inserciones para la tabla Detalle_Trabajo_Repuesto
INSERT INTO detalle_trabajo_repuesto (id_trabajo, id_lote, cantidad_usada) VALUES
(1, 1, 1),
(2, 2, 2),
(1, 4, 5);

-- Inserciones para la tabla Factura
INSERT INTO factura (id_cliente, id_trabajo, fecha_emision, numero_factura, subtotal, impuestos, total) VALUES
(1, 1, '2025-05-02', 'FAC-001', 60.50, 11.49, 71.99),
(2, 2, '2025-05-06', 'FAC-002', 166.50, 31.64, 198.14);

-- Inserciones para la tabla Detalle_Factura
INSERT INTO detalle_factura (id_factura, concepto, descripcion, cantidad, precio_unitario, subtotal) VALUES
(1, 'Servicio', 'Cambio de aceite y filtro', 1, 45.00, 45.00),
(1, 'Repuesto', 'Filtro de aceite', 1, 15.50, 15.50),
(2, 'Servicio', 'Reparación de motor', 1, 150.00, 150.00),
(2, 'Repuesto', 'Bujía de encendido', 2, 8.25, 16.50);

-- Inserciones para la tabla Actividad_Especial
INSERT INTO actividad_especial (tipo_actividad, descripcion, fecha_inicio, fecha_fin) VALUES
('Campaña', 'Revisión gratuita de frenos', '2025-05-10', '2025-05-31'),
('Inspeccion', 'Inspección de seguridad anual', '2025-06-01', '2025-06-30');

-- Inserciones para la tabla Cliente_Actividad
INSERT INTO cliente_actividad (id_cliente, id_actividad, resultado) VALUES
(1, 1, 'APROBADO'),
(2, 2, 'REPARACIONES_NECESARIAS'),
(3, 1, 'RECHAZADO');

-- Inserciones para la tabla Evaluacion_Proveedor
INSERT INTO evaluacion_proveedor (id_proveedor, fecha_evaluacion, puntualidad, calidad_producto, costo, observaciones) VALUES
(1, '2025-05-03', 5, 4, 3, 'Buen proveedor en general'),
(2, '2025-05-06', 4, 5, 2, 'Calidad excelente pero precios altos');
