CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE
);
CREATE TABLE transportistas (
    id_transportista SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    vehiculo VARCHAR(50)
);
CREATE TABLE envios (
    id_envio SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    codigo_rastreo VARCHAR(50) UNIQUE NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    direccion_origen TEXT NOT NULL,
    direccion_destino TEXT NOT NULL,
    estado VARCHAR(50) DEFAULT 'En proceso',
    CONSTRAINT fk_envio_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON DELETE CASCADE
);
CREATE TABLE paquetes (
    id_paquete SERIAL PRIMARY KEY,
    id_envio INT NOT NULL,
    descripcion TEXT,
    peso DECIMAL(10,2),
    dimensiones VARCHAR(50),
    CONSTRAINT fk_paquete_envio FOREIGN KEY (id_envio)
        REFERENCES envios (id_envio)
        ON DELETE CASCADE
);
CREATE TABLE seguimiento (
    id_seguimiento SERIAL PRIMARY KEY,
    id_envio INT NOT NULL,
    id_transportista INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ubicacion VARCHAR(200) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    CONSTRAINT fk_seguimiento_envio FOREIGN KEY (id_envio)
        REFERENCES envios (id_envio)
        ON DELETE CASCADE,
    CONSTRAINT fk_seguimiento_transportista FOREIGN KEY (id_transportista)
        REFERENCES transportistas (id_transportista)
        ON DELETE SET NULL
);
