-- Crear la base de datos
CREATE DATABASE BD_FerreteriaChiqui2;
USE BD_FerreteriaChiqui2;


-- Crear la tabla 'Categoría'
CREATE TABLE Categoría (
    CategoriaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR(255)
);

-- Crear la tabla 'clientes'
CREATE TABLE clientes (
    ClienteID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreCliente VARCHAR(255),
    DireccionCliente VARCHAR(255)
    -- Otras columnas según sea necesario
);

-- Crear la tabla 'departamento'
CREATE TABLE departamento (
    DepartamentoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreDepartamento VARCHAR(255)
);

-- Crear la tabla 'distrito'
CREATE TABLE distrito (
    DistritoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreDistrito VARCHAR(255),
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES departamento(DepartamentoID)
);

-- Crear la tabla 'empleado'
CREATE TABLE empleado (
    EmpleadoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreEmpleado VARCHAR(255),
    PuestoEmpleado VARCHAR(255)
    -- Otras columnas según sea necesario
);

-- Crear la tabla 'local'
CREATE TABLE local (
    LocalID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreLocal VARCHAR(255),
    DireccionLocal VARCHAR(255),
    DistritoID INT,
    FOREIGN KEY (DistritoID) REFERENCES distrito(DistritoID)
);

-- Crear la tabla 'pedido'
CREATE TABLE pedido (
    PedidoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FechaPedido DATE,
    ClienteID INT,
    EmpleadoID INT,
    FOREIGN KEY (ClienteID) REFERENCES clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES empleado(EmpleadoID)
);

-- Crear la tabla 'proveedor'
CREATE TABLE proveedor (
    ProveedorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreProveedor VARCHAR(255)
    -- Otras columnas según sea necesario
);


-- Crear la tabla 'producto'
CREATE TABLE producto (
    ProductoID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    CategoriaID INT,
    ProveedorID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoría(CategoriaID),
    FOREIGN KEY (ProveedorID) REFERENCES proveedor(ProveedorID)
);

-- Crear la tabla 'pedidoDeproducto'
CREATE TABLE pedidoDeproducto (
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    PRIMARY KEY (PedidoID, ProductoID),
    FOREIGN KEY (PedidoID) REFERENCES pedido(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES producto(ProductoID)
);


-- Crear la tabla 'persona'
CREATE TABLE persona (
    PersonaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombrePersona VARCHAR(255)
    -- Otras columnas según sea necesario
);


-- Crear la tabla 'provincia'
CREATE TABLE provincia (
    ProvinciaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NombreProvincia VARCHAR(255),
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES departamento(DepartamentoID)
);

ALTER TABLE producto
ADD COLUMN  FechaExp DATE;

ALTER TABLE empleado
ADD COLUMN FechaIngreso DATE;

ALTER TABLE proveedor
ADD COLUMN nacionalidad VARCHAR(45);

-- Crear la tabla 'ventas'
CREATE TABLE ventas (
    VentaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FechaVenta DATE,
    MontoTotal DECIMAL(10, 2)
    );
    
-- Borrar la tabla 'ventas' si existe
DROP TABLE IF EXISTS ventas;

