-- Inicio de las Tablas de la BD de papeleria.sql



CREATE TABLE IF NOT EXISTS usuario (
    cliente_ID int(10) AUTO_INCREMENT,
    dni VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    domicilio VARCHAR(60) NOT NULL,
    CPostal VARCHAR(10) NOT NULL,
    Nacionalidad VARCHAR(3) NOT NULL,
    Fnacimiento DATE NOT NULL,
    poblacion VARCHAR(50) NOT NULL DEFAULT 'palma',
    email VARCHAR(50) UNIQUE,
    Telefono varchar(50) NOT NULL,
    Estado TINYINT(1) NOT NULL DEFAULT 1,
    alta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Comentario TEXT,
    PRIMARY KEY (cliente_ID)
);

CREATE TABLE IF NOT EXISTS inventario (
    producto_ID int(20)AUTO_INCREMENT,
    tipoProducto ENUM ('revista', 'Material escolar', 'Material Oficina', 'Material Diseño') NOT NULL,
    nombreProducto VARCHAR(30) NOT NULL,
    Cantidad INT(3),
    Estado TINYINT(1) NOT NULL DEFAULT 1,
    alta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    precio DOUBLE(6,2) NOT NULL,
    Comentario TEXT,
    PRIMARY KEY (producto_ID)
);

CREATE TABLE IF NOT EXISTS empleado (
    empleado_ID int(20) AUTO_INCREMENT,
    dni VARCHAR(10) NOT NULL UNIQUE,
    NSS VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    domicilio VARCHAR(60) NOT NULL,
    CPostal VARCHAR(10) NOT NULL,
    Nacionalidad VARCHAR(3) NOT NULL,
    Fnacimiento DATE NOT NULL,
    poblacion VARCHAR(50) NOT NULL DEFAULT 'palma',
    email VARCHAR(50) UNIQUE,
    Telefono varchar(50) NOT NULL,
    Estado TINYINT(1) NOT NULL DEFAULT 1,
    alta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Comentario TEXT,
    PRIMARY KEY (empleado_ID)
);

CREATE TABLE IF NOT EXISTS transaccion (
    transaccion_ID int(10) AUTO_INCREMENT,
    cliente_ID int(10), -- debemos tener en cuenta que los fk's deben tener el mismo nombre que en el original, ademas el fk debe tener su tipo de dado que originalmente es.\
    producto_ID int(20),
    tipoProducto ENUM ('revista', 'Material escolar', 'Material Oficina', 'Material Diseño') NOT NULL,
    nombreProducto VARCHAR(30) NOT NULL,
    fCompra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    precio DOUBLE(6,2) NOT NULL,
    tipoPago ENUM('Targeta', 'Efectivo'),
    PRIMARY KEY (transaccion_ID),
    FOREIGN KEY (cliente_ID) REFERENCES usuario(cliente_ID),
    FOREIGN KEY (producto_ID) REFERENCES inventario(producto_ID)
);

CREATE TABLE proveedores (
    proveedor_ID int(10) AUTO_INCREMENT,
    nEmpresa VARCHAR(20) NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    direccion VARCHAR(100) NOT NULL, 
    poblacion VARCHAR(20) NOT NULL DEFAULT 'Palma',
    Codpostal VARCHAR(5) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Especialidad VARCHAR(15),
    email VARCHAR(40) NOT NULL UNIQUE,
    fAlta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que inicamos con la empresa',
    descripcion TEXT,
    PRIMARY KEY (proveedor_ID)
);

