-- Crear base de datos
CREATE DATABASE IF NOT EXISTS carmotors;

-- Usar la base de datos
USE carmotors;

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
);

-- Tabla Vehiculo
CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(20) UNIQUE NOT NULL,
    tipo_vehiculo VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    NIT VARCHAR(20) UNIQUE NOT NULL,
    contacto VARCHAR(100),
    frecuencia_visitas ENUM('Diaria', 'Semanal', 'Mensual', 'Trimestral', 'Quincenal', 'Anual')
);

-- Tabla Repuesto
CREATE TABLE Repuesto (
    id_repuesto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_repuesto VARCHAR(100) NOT NULL,
    tipo_repuesto ENUM('Mecanico', 'Electrico', 'Carroceria', 'Consumo') NOT NULL,
    marca VARCHAR(50),
    modelo_compatible VARCHAR(50),
    vida_util_estimada DATE,
    precio DECIMAL(10,2)
);

-- Tabla Lote
CREATE TABLE Lote (
    id_lote INT PRIMARY KEY AUTO_INCREMENT,
    id_repuesto INT NOT NULL,
    id_proveedor INT NOT NULL,
    fecha_ingreso DATE,
    cantidad_inicial INT,
    cantidad_disponible INT,
    estado ENUM('DISPONIBLE', 'RESERVADO', 'FUERA_DE_SERVICIO') DEFAULT 'DISPONIBLE',
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Tabla Orden_Compra
CREATE TABLE Orden_Compra (
    id_orden_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT NOT NULL,
    fecha_orden DATE NOT NULL,
    estado ENUM('Pendiente', 'Enviada', 'Recibida', 'Cancelada') DEFAULT 'Pendiente',
    observaciones TEXT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

-- Tabla Detalle_Orden_Compra
CREATE TABLE Detalle_Orden_Compra (
    id_detalle_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_orden_compra INT NOT NULL,
    id_repuesto INT NOT NULL,
    cantidad_solicitada INT NOT NULL,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_orden_compra) REFERENCES Orden_Compra(id_orden_compra),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    tipo_mantenimiento ENUM('PREVENTIVO', 'CORRECTIVO') NOT NULL,
    descripcion TEXT,
    costo_mano_obra DECIMAL(10,2),
    estado_servicio ENUM('PENDIENTE', 'EN_PROCESO', 'COMPLETADO', 'CANCELADO') DEFAULT 'PENDIENTE',
    tiempo_estimado INT
);

-- Tabla Trabajo
CREATE TABLE Trabajo (
    id_trabajo INT PRIMARY KEY AUTO_INCREMENT,
    id_vehiculo INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_recepcion DATE,
    fecha_entrega DATE,
    tecnico_asignado VARCHAR(100),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- Tabla Detalle_Trabajo_Repuesto
CREATE TABLE Detalle_Trabajo_Repuesto (
    id_detalle_trabajo_repuesto INT PRIMARY KEY AUTO_INCREMENT,
    id_trabajo INT NOT NULL,
    id_lote INT NOT NULL,
    cantidad_usada INT NOT NULL,
    FOREIGN KEY (id_trabajo) REFERENCES Trabajo(id_trabajo),
    FOREIGN KEY (id_lote) REFERENCES Lote(id_lote)
);

-- Tabla Factura
CREATE TABLE Factura (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_trabajo INT NOT NULL,
    fecha_emision DATE,
    numero_factura VARCHAR(50) UNIQUE,
    CUFE VARCHAR(100) UNIQUE,
    subtotal DECIMAL(10,2),
    impuestos DECIMAL(10,2),
    total DECIMAL(10,2),
    qr_codigo TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_trabajo) REFERENCES Trabajo(id_trabajo)
);

-- Tabla Detalle_Factura
CREATE TABLE Detalle_Factura (
    id_detalle_factura INT PRIMARY KEY AUTO_INCREMENT,
    id_factura INT NOT NULL,
    concepto ENUM('Servicio', 'Repuesto') NOT NULL,
    descripcion TEXT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura)
);

-- Tabla Actividad_Especial
CREATE TABLE Actividad_Especial (
    id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    tipo_actividad ENUM('Campaña', 'Inspeccion') NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla Cliente_Actividad
CREATE TABLE Cliente_Actividad (
    id_cliente_actividad INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_actividad INT NOT NULL,
    resultado ENUM('APROBADO', 'REPARACIONES_NECESARIAS', 'RECHAZADO'),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_actividad) REFERENCES Actividad_Especial(id_actividad)
);

-- Tabla Evaluacion_Proveedor
CREATE TABLE Evaluacion_Proveedor (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT NOT NULL,
    fecha_evaluacion DATE,
    puntualidad INT,
    calidad_producto INT,
    costo INT,
    observaciones TEXT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);
