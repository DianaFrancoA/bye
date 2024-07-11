create database SPA_NEW;
use SPA_NEW;
create table clientes (
    id_cliente varchar(10) primary key not null,
    nombre_cliente varchar(50) not null,
    telefono_cliente bigint,
    correo_cliente varchar(100)
);

create table categorias_s (
    id_cat_s varchar(10) primary key not null,
    nombre_cat_s varchar(50) not null
);

create table empleados (
    id_empleados varchar(10) primary key not null,
    nombre_empleado varchar(50) not null,
    telefono_empleado bigint,
    area varchar(50)
);

create table servicios (
    id_servicio varchar(10) primary key not null,
    nombre_servicio varchar(100) not null,
    descripcion varchar(200),
    duracion time,
    empleado varchar(10), -- foranea --
    categoria_servicio varchar(10), -- foranea
    precio_servicio decimal(10, 2),
    foreign key (empleado) references empleados (id_empleados),
    foreign key (categoria_servicio) references categorias_s (id_cat_s)
);

CREATE TABLE citas (
    registro VARCHAR(10) PRIMARY KEY NOT NULL,
    fecha_r DATE,
    cliente VARCHAR(10) NOT NULL,
    fecha_c DATE,
    hora_entrada TIME,
    tipo_pago VARCHAR(15),
    servicio_elegido VARCHAR(10), 
    FOREIGN KEY (cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (servicio_elegido) REFERENCES servicios (id_servicio)
);

create table detalle_servicio (
    folio_ds varchar(10) primary key not null,
    servicio varchar(10), -- foranea --
    fecha_ds date,
    hora_salida time,
    cita varchar(10), -- foranea--
    foreign key (servicio) references servicios (id_servicio),
    foreign key (cita) references citas (registro)
);

INSERT INTO clientes (id_cliente, nombre_cliente, telefono_cliente, correo_cliente)
VALUES 
('CL-0001', 'Juan García', 8711234567, 'juangarcia@example.com'),
('CL-0002', 'María Hernández', 8712345678, 'mariahernandez@example.com'),
('CL-0003', 'José Martínez', 8713456789, 'josemartinez@example.com'),
('CL-0004', 'Guadalupe González', 8714567890, 'guadalupegonzalez@example.com'),
('CL-0005', 'Ana López', 8715678901, 'analopez@example.com'),
('CL-0006', 'Francisco Rodríguez', 8716789012, 'franciscorodriguez@example.com'),
('CL-0007', 'Juana Martínez', 8717890123, 'juanamartinez@example.com'),
('CL-0008', 'Carlos Pérez', 8718901234, 'carlosperez@example.com'),
('CL-0009', 'Margarita Sánchez', 8719012345, 'margaritasanchez@example.com'),
('CL-0010', 'Pedro Ramírez', 8710123456, 'pedroramirez@example.com'),
('CL-0011', 'Rosa Reyes', 8711234567, 'rosareyes@example.com'),
('CL-0012', 'Luisa Flores', 8712345678, 'luisaflores@example.com'),
('CL-0013', 'Javier Díaz', 8713456789, 'javierdiaz@example.com'),
('CL-0014', 'Verónica Cruz', 8714567890, 'veronicacruz@example.com'),
('CL-0015', 'Roberto Torres', 8715678901, 'robertotorres@example.com');

INSERT INTO categorias_s (id_cat_s, nombre_cat_s)
VALUES 
('CT-0001', 'Masajes'),
('CT-0002', 'Tratamientos faciales'),
('CT-0003', 'Tratamientos corporales'),
('CT-0004', 'Depilación'),
('CT-0005', 'Pedicura y manicura');

INSERT INTO empleados (id_empleados, nombre_empleado, telefono_empleado, area)
VALUES 
('EM-0001','Karen Torres','871238406', 'Masajes'), 
('EM-0002','Carol Luevano','872665922', 'Facial'), 
('EM-0003','Eunice Castro','871233406', 'Masajes'), 
('EM-0004','Raul Figueroa','871233406', 'Facial'), 
('EM-0005','Brianda Castejano','871233406', 'Masajes'),
('EM-0006','Andres Chavez','871233406', 'Facial'),
('EM-0007','Jessica Castro','871283406', 'Masajes'), 
('EM-0008','Adrian Lira','871238306', 'Facial'),
('EM-0009','Sofia Torres','871238306', 'Masajes'), 
('EM-0010','Cristian Monrreal','871233406', 'Facial');

INSERT INTO servicios (id_servicio, nombre_servicio, descripcion, duracion, empleado, categoria_servicio, precio_servicio)
VALUES 
('SV-0001', 'Masaje relajante', 'Masaje de cuerpo completo para aliviar tensiones musculares.', '01:00:00', 'EM-0001', 'CT-0001', 80.00),
('SV-0002', 'Tratamiento facial básico', 'Limpieza facial profunda para revitalizar la piel.', '00:45:00', 'EM-0002', 'CT-0002', 60.00),
('SV-0003', 'Exfoliación corporal', 'Tratamiento para eliminar células muertas y suavizar la piel.', '00:30:00', 'EM-0005', 'CT-0003', 50.00),
('SV-0004', 'Depilación de piernas completas', 'Eliminación del vello en piernas mediante cera tibia.', '00:45:00', 'EM-0004', 'CT-0004', 45.00),
('SV-0005', 'Pedicura completa', 'Cuidado integral de pies que incluye corte, limado, exfoliación y esmaltado.', '01:00:00', 'EM-0009', 'CT-0005', 40.00),
('SV-0006', 'Masaje terapéutico', 'Masaje enfocado en aliviar dolores musculares específicos.', '00:50:00', 'EM-0003', 'CT-0001', 90.00),
('SV-0007', 'Tratamiento facial antiarrugas', 'Tratamiento especializado para reducir arrugas y líneas de expresión.', '01:15:00', 'EM-0006', 'CT-0002', 80.00),
('SV-0008', 'Envoltura de algas', 'Tratamiento para nutrir la piel con propiedades regenerativas de las algas.', '01:30:00', 'EM-0007', 'CT-0003', 70.00),
('SV-0009', 'Depilación de axilas', 'Eliminación del vello en las axilas con cera tibia.', '00:20:00', 'EM-0004', 'CT-0004', 25.00),
('SV-0010', 'Manicura express', 'Cuidado rápido de las uñas que incluye limado, esmaltado y aplicación de crema hidratante.', '00:30:00', 'EM-0010', 'CT-0005', 30.00);


INSERT INTO citas (registro, fecha_r, cliente, fecha_c, hora_entrada, tipo_pago, servicio_elegido)
VALUES 
('CS-0001', '2024-05-23', 'CL-0001', '2024-05-25', '15:00:00', 'efectivo', 'SV-0001'),
('CS-0002', '2024-05-23', 'CL-0002', '2024-05-25', '15:30:00', 'tarjeta', 'SV-0002'),
('CS-0003', '2024-05-23', 'CL-0003', '2024-05-25', '16:00:00', 'efectivo', 'SV-0003'),
('CS-0004', '2024-05-24', 'CL-0004', '2024-05-25', '17:30:00', 'tarjeta', 'SV-0004'),
('CS-0005', '2024-05-24', 'CL-0005', '2024-05-25', '18:00:00', 'efectivo', 'SV-0005'),
('CS-0006', '2024-05-24', 'CL-0006', '2024-05-25', '18:30:00', 'tarjeta', 'SV-0006'),
('CS-0007', '2024-05-25', 'CL-0007', '2024-05-26', '15:30:00', 'efectivo', 'SV-0007'),
('CS-0008', '2024-05-25', 'CL-0008', '2024-05-26', '15:30:00', 'tarjeta', 'SV-0008'),
('CS-0009', '2024-05-25', 'CL-0009', '2024-05-26', '17:30:00', 'efectivo', 'SV-0009'),
('CS-0010', '2024-05-26', 'CL-0010', '2024-05-27', '18:30:00', 'tarjeta', 'SV-0010'),
('CS-0011', '2024-05-26', 'CL-0011', '2024-05-27', '19:00:00', 'efectivo', 'SV-0001'),
('CS-0012', '2024-05-26', 'CL-0012', '2024-05-27', '20:00:00', 'tarjeta', 'SV-0002'),
('CS-0013', '2024-05-27', 'CL-0013', '2024-05-30', '21:00:00', 'efectivo', 'SV-0003'),
('CS-0014', '2024-05-28', 'CL-0014', '2024-05-30', '19:00:00', 'tarjeta', 'SV-0004'),
('CS-0015', '2024-05-28', 'CL-0015', '2024-05-30', '20:00:00', 'efectivo', 'SV-0005'),
('CS-0016', '2024-05-23', 'CL-0001', '2024-05-25', '16:00:00', 'efectivo', 'SV-0004'),
('CS-0017', '2024-05-25', 'CL-0007', '2024-05-26', '16:45:00', 'efectivo', 'SV-0003'),
('CS-0018', '2024-05-26', 'CL-0011', '2024-05-27', '20:00:00', 'efectivo', 'SV-0003');

INSERT INTO detalle_servicio (folio_ds, servicio, fecha_ds, hora_salida, cita) VALUES 
('DS-0001', 'SV-0001', '2024-05-25', '16:00:00', 'CS-0001'),
('DS-0002', 'SV-0002', '2024-05-25', '16:15:00', 'CS-0002'),
('DS-0003', 'SV-0003', '2024-05-25', '16:30:00', 'CS-0003'),
('DS-0004', 'SV-0004', '2024-05-25', '18:15:00', 'CS-0004'),
('DS-0005', 'SV-0005', '2024-05-25', '18:45:00', 'CS-0005'),
('DS-0006', 'SV-0006', '2024-05-25', '19:20:00', 'CS-0006'),
('DS-0007', 'SV-0007', '2024-05-26', '16:45:00', 'CS-0007'),
('DS-0008', 'SV-0008', '2024-05-26', '16:45:00', 'CS-0008'),
('DS-0009', 'SV-0009', '2024-05-26', '19:00:00', 'CS-0009'),
('DS-0010', 'SV-0010', '2024-05-27', '20:00:00', 'CS-0010'),
('DS-0011', 'SV-0001', '2024-05-27', '20:00:00', 'CS-0011'),
('DS-0012', 'SV-0002', '2024-05-27', '20:45:00', 'CS-0012'),
('DS-0013', 'SV-0003', '2024-05-30', '22:15:00', 'CS-0013'),
('DS-0014', 'SV-0004', '2024-05-30', '20:45:00', 'CS-0014'),
('DS-0015', 'SV-0005', '2024-05-30', '21:45:00', 'CS-0015'),
('DS-0016', 'SV-0006', '2024-05-25', '19:20:00', 'CS-0016'),
('DS-0017', 'SV-0003', '2024-05-26', '17:35:00', 'CS-0017'),
('DS-0018', 'SV-0003', '2024-05-27', '21:45:00', 'CS-0018');


/*crear indice*/
 create INDEX  IDX_EMPLEADOS ON EMPLEADOS (NOMBRE_EMPLEADO);
 
 SHOW INDEX FROM EMPLEADOS; 

/*CREAR UNA VISTA DONDE MUESTRE LOS EMPLEADOS Y EL AREA Q TIENEN*/
CREATE VIEW EMPLEADOS_AREA AS
SELECT EMPLEADOS.NOMBRE_EMPLEADO AS EMPLEADO, EMPLEADOS.AREA
AS AREA
FROM EMPLEADOS;

/*una vita donde muestre los servicios y el empleado que lo realizA*/
CREATE VIEW SERVICIOS_EMPLEADOS AS 
SELECT SERVICIOS.NOMBRE_SERVICIO,EMPLEADOS.NOMBRE_EMPLEADO 
FROM EMPLEADOS INNER JOIN SERVICIO ON EMPLEADOS.ID_EMPLEADOS=SERVICIOS.EMPLEADOS;
 