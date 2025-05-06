# Carmotors-java
# Proyecto CarMotors

## Descripción General
El proyecto "CarMotors" es una aplicación desarrollada en Java que esta diseñada para gestionar un negocio de automóviles. Incluye módulos para controladores, modelos, acceso a datos (DAO), vistas y utilidades, sugiriendo una arquitectura MVC (Model-View-Controller). El proyecto está organizado en un entorno basado en Maven y utiliza un sistema de control de versiones (Git), como se evidencia por los archivos `.gitignore` y los commits registrados.

## Tecnologías Utilizadas
- **Lenguaje**: Java
- **Herramienta de Compilación**: Maven
- **Base de Datos**: MySQL
- **Control de Versiones**: Git (commits en inglés)
- **IDE**: IntelliJ IDEA

## Estructura del Proyecto
La estructura del proyecto está organizada en los siguientes directorios y archivos principales:

- **CarMotors/**
- ├── .idea/                           # Archivos de configuración de IntelliJ IDEA
- ├── .mvn/wrapper/                    # Wrapper de Maven para builds consistentes
- ├── documentation/                   # Archivos de documentación
- │   └── Modelo-Relacional-PrimerFormato.jpg  # Diagrama ER de la base de datos
- ├── src/main/java/com/carmotors/     # Código fuente principal
- │   ├── controller/                  # Controladores para manejar solicitudes
- │   │   ├── ActividadEspecialController.java
- │   │   ├── ClienteActividaController.java
- │   │   ├── ClienteController.java
- │   │   ├── DetalleTrabajoRepuestoController.java
- │   │   ├── LoteController.java
- │   │   ├── ProveedorController.java
- │   │   ├── RepuestoController.java
- │   │   ├── ServicioController.java
- │   │   ├── TrabajoController.java
- │   │   └── VehiculoController.java
- │   ├── model/                       # Clases de modelo que representan entidades
- │   │   ├── enums/                   # Enumeraciones para estados y tipos
- │   │   │   ├── EstadoLote.java
- │   │   │   ├── EstadoServicio.java
- │   │   │   ├── ResultadoActivida.java
- │   │   │   ├── ResultadoEspecial.java
- │   │   │   ├── TipoActividaEspecial.java
- │   │   │   ├── TipoMantenimiento.java
- │   │   │   └── TipoRepuesto.java
- │   │   ├── ActividadEspecial.java
- │   │   ├── Cliente.java
- │   │   ├── ClienteActivida.java
- │   │   ├── DetalleTrabajoRepuesto.java
- │   │   ├── Lote.java
- │   │   ├── Proveedor.java
- │   │   ├── Repuesto.java
- │   │   ├── Servicio.java
- │   │   ├── Trabajo.java
- │   │   └── Vehiculo.java
- │   ├── modelDAO/                    # Objetos de Acceso a Datos (DAO)
- │   │   ├── ActividadEspecialDAO.java
- │   │   ├── ClienteActividaDAO.java
- │   │   ├── ClienteDAO.java
- │   │   ├── CrudDAO.java
- │   │   ├── DetalleTrabajoRepuestoDAO.java
- │   │   ├── LoteDAO.java
- │   │   ├── ProveedorDAO.java
- │   │   ├── RepuestoDAO.java
- │   │   ├── ServicioDAO.java
- │   │   ├── TrabajoDAO.java
- │   │   └── VehiculoDAO.java
- │   ├── run/                         # Clase principal para ejecutar la aplicación (asumido)
- │   ├── util/                        # Clases de utilidad
- │   │   └── Conexion.java            # Manejador de conexión a la base de datos
- │   └── view/                        # Vistas y paneles de la interfaz
- │       ├── DateLabelFormatter.java
- │       ├── DetalleTableModel.java
- │       ├── PanelActividaEspecial.java
- │       ├── PanelCliente.java
- │       ├── PanelClienteActivida.java
- │       ├── PanelDetalleTrabajoRepuesto.java
- │       ├── PanelProveedor.java
- │       ├── PanelRepuesto.java
- │       ├── PanelServicio.java
- │       ├── PanelTrabajo.java
- │       ├── PanelVehiculo.java
- │       └── VentanaPrincipal.java
- ├── target/                          # Salida de compilación de Maven
- ├── .gitignore                       # Archivo de ignorados por Git
- ├── mvnw                             # Script de Maven Wrapper (Unix)
- ├── mvnw.cmd                         # Script de Maven Wrapper (Windows)
- └── pom.xml                          # Archivo de configuración de Maven

### 1. Gestión de Inventarios de Repuestos
- **Registro de Repuestos**:
  - Nombre, tipo (Mecánico, Eléctrico, Carrocería, Consumo), compatibilidad con marca/modelo, proveedor asociado, cantidad en stock, alertas de nivel mínimo, fecha de ingreso, vida útil estimada y estado (Disponible, Reservado, Fuera de Servicio).
- **Gestión de Lotes y Trazabilidad**:
  - Identificación única de lotes vinculada a fecha de ingreso y proveedor.
  - Registro del uso de repuestos en cada trabajo para garantizar trazabilidad.
  - Alertas automáticas para productos próximos a caducar o agotarse.
- **Control de Reabastecimiento**:
  - Generación automática de órdenes de compra basadas en niveles mínimos de stock.
  - Seguimiento de pedidos pendientes con proveedores.
- **Reportes de Inventario**:
  - Listados detallados por tipo, marca o estado.
  - Análisis de consumo por períodos.
  - Alertas para productos que han excedido su vida útil.

### 2. Gestión de Servicios de Mantenimiento
- **Registro de Servicios**:
  - Tipo de mantenimiento (Preventivo o Correctivo), detalles del vehículo (marca, modelo, placa, tipo), descripción del trabajo (repuestos utilizados, tiempo estimado), costo de mano de obra y estado (Pendiente, En Proceso, Completado, Entregado).
- **Flujos de Trabajo**:
  - **Recepción de Vehículo**: Registro de cliente y datos del vehículo, inspección inicial para identificar problemas y estimar costos.
  - **Ejecución del Mantenimiento**: Asignación de tareas a técnicos especializados, seguimiento en tiempo real.
  - **Entrega del Vehículo**: Verificación del trabajo, generación automática de orden de entrega firmada por el cliente.
- **Reportes de Mantenimiento**:
  - Servicios más solicitados por tipo de vehículo.
  - Productividad de técnicos (trabajos completados, tiempo empleado).
  - Historial detallado de mantenimientos por cliente o vehículo.

### 3. Gestión de Clientes
- **Registro de Clientes**:
  - Datos: Nombre, identificación, teléfono, correo electrónico.
  - Historial de servicios: Vehículos atendidos, mantenimientos realizados, facturación.
  - Recordatorios automáticos para mantenimientos preventivos o renovaciones.
- **Fidelización y Promociones**:
  - Descuentos por volumen de servicios contratados.
  - Programa de recompensas para clientes frecuentes.

### 4. Facturación Electrónica
- Genera facturas visuales en formato PDF o PNG, cumpliendo con la normativa de la DIAN (Resolución 042 de 2020) en Colombia.
- **Elementos de la Factura**:
  - Información del taller ("Motores & Ruedas"): Razón social, NIT, dirección, contacto.
  - Información del cliente: Nombre, documento, dirección.
  - Detalle del servicio: Descripción, repuestos utilizados, costos de mano de obra, subtotales, totales.
  - Número de factura, fecha de emisión, CUFE, código QR con enlace al comprobante fiscal y firma digital.
- **Generación de Factura**:
  - Datos auto-poblados desde módulos de inventario y mantenimiento.
  - Cálculo de impuestos según normativa colombiana.
  - Factura descargable o enviada por correo electrónico.

### 5. Gestión de Proveedores
- **Registro de Proveedores**:
  - Detalles: Nombre, NIT, contacto, frecuencia de visitas.
  - Productos suministrados: Tipos de repuestos, cantidades, fechas.
- **Evaluación de Proveedores**:
  - Calificación por puntualidad, calidad de productos y costos.
  - Reportes de desempeño para optimizar negociaciones futuras.

### 6. Gestión de Actividades Especiales
- **Campañas de Mantenimiento Preventivo**:
  - Promociones estacionales (e.g., descuentos por cambio de aceite).
  - Asignación automática de citas para clientes frecuentes.
  - Reportes para evaluar el éxito de las campañas.
- **Inspecciones Técnicas Especializadas**:
  - Registro de inspecciones específicas (e.g., pre-revisión técnico-mecánica).
  - Resultados: Aprobado, Reparaciones Necesarias, Rechazado.
  - Programación automática de revisiones futuras.

### 7. Interfaces de Usuario y Arquitectura
- **Interfaz Amigable**:
  - Menús: Gestión de Inventarios, Mantenimiento y Reparaciones, Clientes y Facturación, Proveedores y Compras, Reportes y Estadísticas.
  - Optimizada para dispositivos móviles, permitiendo acceso en tiempo real.
- **Arquitectura**:
  - Patrón MVC con paquetes separados por componentes (controller, model, modelDAO, view, util).

### 1. **Raíz del Proyecto**
- `.idea/`: Configuración del entorno de desarrollo.
- `.mvn/wrapper/`: Configuración del wrapper de Maven para asegurar consistencia en la versión de Maven.
- `documentation/`: Contiene Diagrama de base de datos (ER), Diagrama de clases.
- `src/main/java/com/carmotors/`: Directorio principal de código fuente.
- `target/`: Directorio de compilación generado por Maven.
- `.gitignore`: Archivo para especificar archivos y carpetas ignorados por Git.
- `README.md`: Este archivo de documentación.
- `mvnw`, `mvnw.cmd`: Scripts para ejecutar Maven en diferentes sistemas operativos.
- `pom.xml`: Archivo de configuración de Maven que define dependencias y plugins.

### 2. **Módulo `controller`**
Contiene los controladores que manejan la lógica de la aplicación:
- `ActividadEspecialController.java`
- `ClienteActividaController.java`
- `ClienteController.java`
- `DetalleTrabajoRepuestoController.java`
- `LoteController.java`
- `ProveedorController.java`
- `RepuestoController.java`
- `ServicioController.java`
- `TrabajoController.java`
- `VehiculoController.java`
  Estos archivos gestionan las solicitudes y respuestas, integrando la lógica de negocio con las vistas.

### 3. **Módulo `model`**
Incluye las clases que representan los datos y la lógica del modelo:
- `enums/`: Enumeraciones que definen estados o tipos:
    - `EstadoLote.java`
    - `EstadoServicio.java`
    - `ResultadoActivida.java`
    - `ResultadoEspecial.java`
    - `TipoActividaEspecial.java`
    - `TipoMantenimiento.java`
    - `TipoRepuesto.java`
- `ActividadEspecial.java`
- `Cliente.java`
- `ClienteActivida.java`
- `DetalleTrabajoRepuesto.java`
- `Lote.java`
- `Proveedor.java`
- `Repuesto.java`
- `Servicio.java`
- `Trabajo.java`
- `Vehiculo.java`
  Estas clases representan entidades como clientes, vehículos, repuestos, servicios, etc.

### 4. **Módulo `modelDAO`**
Contiene las clases de acceso a datos (DAO) para interactuar con la base de datos:
- `ActividadEspecialDAO.java`
- `ClienteActividaDAO.java`
- `ClienteDAO.java`
- `CrudDAO.java`
- `DetalleTrabajoRepuestoDAO.java`
- `LoteDAO.java`
- `ProveedorDAO.java`
- `RepuestoDAO.java`
- `ServicioDAO.java`
- `TrabajoDAO.java`
- `VehiculoDAO.java`
  Estas clases implementan la lógica de persistencia para las entidades del modelo.

### 5. **Módulo `run`**
Contiene la clase principal para ejecutar la aplicación.

### 6. **Módulo `util`**
Incluye utilidades generales:
- `Conexion.java`: Maneja la conexión a la base de datos.

### 7. **Módulo `view`**
Contiene las vistas o paneles de la interfaz de usuario:
- `DateLabelFormatter.java`
- `DetalleTableModel.java`
- `PanelActividaEspecial.java`
- `PanelCliente.java`
- `PanelClienteActivida.java`
- `PanelDetalleTrabajoRepuesto.java`
- `PanelProveedor.java`
- `PanelRepuesto.java`
- `PanelServicio.java`
- `PanelTrabajo.java`
- `PanelVehiculo.java`
- `VentanaPrincipal.java`

## Instalación
1. Clona el repositorio:
   ```bash
   git clone https://github.com/Ada2105/ProyectoJAVA_CarMotors_Anderson-Andres-Ada.git

## Navega al directorio del proyecto
  cd CarMotors

## Compila el proyecto usando Maven
  ./mvnw clean install
  mvnw.cmd clean install

## Ejecuta la aplicación (ajusta según la clase principal en run)
  java -jar target/CarMotors.jar

## USO
- `Clientes y sus actividades.`
- `Vehículos y servicios asociados.`
- `Repuestos, proveedores y lotes.`
- `Detalles de trabajos y mantenimientos.`
- `Los controladores y DAOs integración con una base de datos relacional, Modelo-Relacional-PrimerFormato.jpg.`

## Uso de Base de Datos y Clases por Componente
## Tablas de Base de Datos por Componente
- **Componente**	--------------   **Tablas Utilizadas**
- Gestión de Inventarios -----> Repuesto, Lote, Proveedor, DetalleTrabajoRepuesto
- Gestión de Servicios ----->	Servicio, Trabajo, Vehiculo, DetalleTrabajoRepuesto
- Gestión de Clientes -----> Cliente, ClienteActivida, Servicio
- Facturación Electrónica -----> Cliente, Servicio, DetalleTrabajoRepuesto, Repuesto
- Gestión de Proveedores -----> Proveedor, Repuesto, Lote
- Actividades Especiales ----> ActividadEspecial, Cliente, ClienteActivida

## Clases por Componente
- **Componente** ----------- **Clases Utilizadas**
- Gestión de Inventarios ----->	Repuesto, Lote, Proveedor, DetalleTrabajoRepuesto, RepuestoController, LoteController, ProveedorController, RepuestoDAO, LoteDAO, ProveedorDAO, PanelRepuesto, PanelProveedor
- Gestión de Servicios ----->	Servicio, Trabajo, Vehiculo, DetalleTrabajoRepuesto, ServicioController, TrabajoController, VehiculoController, ServicioDAO, TrabajoDAO, VehiculoDAO, PanelServicio, PanelTrabajo, PanelVehiculo
- Gestión de Clientes ----->	Cliente, ClienteActivida, Servicio, ClienteController, ClienteActividaController, ClienteDAO, ClienteActividaDAO, PanelCliente, PanelClienteActivida
- Facturación Electrónica ----->	Cliente, Servicio, DetalleTrabajoRepuesto, Repuesto (lógica de generación de facturas asumida en controladores/vistas)
- Gestión de Proveedores ----->	Proveedor, Repuesto, Lote, ProveedorController, ProveedorDAO, PanelProveedor
- Actividades Especiales ----->	ActividadEspecial, Cliente, ClienteActivida, ActividadEspecialController, ActividadEspecialDAO, PanelActividaEspecial

## Entregables
- **Diagrama ER de Base de Datos:** Ubicado en documentation/Modelo-Relacional-PrimerFormato.jpg.
- **Diagrama de Clases:** Generado con una herramienta UML y ubicado en documentation/class_diagram.png.
- **Scripts SQL:** Scripts MySQL para crear y poblar la base de datos en documentation/database.sql.
- **Tablas por Componente:** Listadas arriba.
- **Clases por Componente:** Listadas arriba.

## Estándares de Desarrollo
- **Principios SOLID:** Aplicados en el diseño de clases (e.g., responsabilidad única en DAOs, inversión de dependencia en controladores).
- **Manejo de Errores:** Excepciones manejadas con bloques try-catch, y errores registrados en archivos de texto (a implementar en el paquete util).
- **Commits:** Todos los commits en inglés con mensajes claros (e.g., "Add inventory management controllers").
- **Organización del Código:** Arquitectura MVC con paquetes separados por componente.

## Contribuciones
- **Autores:** Anderson Portilla, Ada Leal, Anderson.
- Progreso continuo en modelo, DAO, controladores y vistas.

## Notas Adicionales
- Revisar Modelo-Relacional-PrimerFormato.jpg para entender el diseño de la base de datos.
- Asegurarse de configurar las dependencias en pom.xml y las credenciales de la base de datos en Conexion.java.