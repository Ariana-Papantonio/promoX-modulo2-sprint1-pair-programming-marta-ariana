CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;

CREATE TABLE zapatillas (
id_zapatilla INT AUTO_INCREMENT NOT NULL,
modelo VARCHAR (45) NOT NULL,
color VARCHAR (45) NOT NULL,
PRIMARY KEY (id_zapatilla)
);

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR (45) NOT NULL,
numero_telefono INTEGER NOT NULL,
email VARCHAR (45) NOT NULL,
direccion VARCHAR (45) NOT NULL,
ciudad VARCHAR (45),
provincia VARCHAR (45) NOT NULL,
pais VARCHAR (45) NOT NULL,
codigo_postal VARCHAR (45) NOT NULL,
PRIMARY KEY (id_cliente)
);

CREATE TABLE empleados (
id_empleado INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR (45) NOT NULL,
tienda VARCHAR (45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado)
);

CREATE TABLE facturas(
id_factura INT AUTO_INCREMENT NOT NULL,
numero_factura VARCHAR (45) NOT NULL,
fecha DATE NOT NULL,
id_zapatilla INT NOT NULL,
id_empleado INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_factura),
CONSTRAINT fk_foreing
	FOREIGN KEY (id_zapatilla)
    REFERENCES zapatillas (id_zapatilla),
	FOREIGN KEY (id_empleado)
    REFERENCES empleados (id_empleado),
	FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente)
    );
    
-- Pair programming Modificación e Inserción de Datos

ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL; 

ALTER TABLE zapatillas
ADD COLUMN talla INT NOT NULL; 

ALTER TABLE empleados
MODIFY salario FLOAT; 

ALTER TABLE clientes 
DROP COLUMN pais; 

ALTER TABLE facturas
ADD COLUMN total FLOAT; 

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'negro', 'Nike', 42) ,
('UOPNM', 'rosa', 'Nike', 39), 
('OPNYT', 'verde', 'Adidas', 35); 

INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
VALUES (1, 'Laura', 'Alcobendas', 25987, '2010-03-09'), 
(2, 'Maria', 'Sevilla', NULL, '2001-04-11'), 
(3, 'Ester', 'Oviedo', 30165.98, '2000-11-29'); 


ALTER TABLE empleados
MODIFY salario DOUBLE; 

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Juan', 'Madrid', 30564.55, '2011-06-09'); 

DELETE FROM empleados; 

INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ('Mónica', '123456789', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'), 
('Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'), 
('Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');

INSERT INTO facturas (numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
VALUES ('123', '2001-11-12', 1, 2 ,1 , 54.98), 
('1234', '2005-05-23', 1, 1, 3, 89.91), 
('12345', '2015-09-18', 2, 3, 3, 76.23); 

UPDATE zapatillas
SET color = 'amarillo'
WHERE id_zapatilla = 2; 

UPDATE empleados 
SET tienda = 'A Coruña'
WHERE id_empleado = 1;

UPDATE clientes 
SET numero_telefono = '123456728'
WHERE id_cliente = 1; 

UPDATE facturas 
SET total = 89.91
WHERE id_zapatilla = 2;

UPDATE facturas 
SET total = 76.23
WHERE id_zapatilla = 2;  