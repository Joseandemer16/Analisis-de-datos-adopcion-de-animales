
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS adopcion_animales;
USE adopcion_animales;

-- Tabla Refugios
CREATE TABLE refugios (
    id_refugio INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    capacidad INT
);

INSERT INTO refugios (id_refugio, nombre, ciudad, capacidad) VALUES
(1, 'Refugio Huellitas', 'Lima', 120),
(2, 'Refugio Patitas Felices', 'Arequipa', 80),
(3, 'Refugio Esperanza Animal', 'Cusco', 60);

-- Tabla Animales
CREATE TABLE animales (
    id_animal INT PRIMARY KEY,
    nombre VARCHAR(50),
    tipo ENUM('Perro','Gato','Otro'),
    raza VARCHAR(50),
    edad_categoria ENUM('Cachorro','Adulto','Senior'),
    genero ENUM('Macho','Hembra'),
    estado_salud ENUM('Vacunado','Esterilizado','Con tratamiento','Sano'),
    fecha_ingreso DATE,
    id_refugio INT,
    FOREIGN KEY (id_refugio) REFERENCES refugios(id_refugio)
);

INSERT INTO animales (id_animal, nombre, tipo, raza, edad_categoria, genero, estado_salud, fecha_ingreso, id_refugio) VALUES
(1,'Firulais','Perro','Mestizo','Cachorro','Macho','Vacunado','2025-01-05',1),
(2,'Luna','Gato','Siames','Adulto','Hembra','Esterilizado','2025-01-12',1),
(3,'Max','Perro','Labrador','Adulto','Macho','Vacunado','2025-02-01',2),
(4,'Misha','Gato','Persa','Senior','Hembra','Con tratamiento','2025-02-15',2),
(5,'Rocky','Perro','Pitbull','Cachorro','Macho','Sano','2025-03-10',1),
(6,'Nala','Gato','Mestizo','Adulto','Hembra','Vacunado','2025-03-20',3),
(7,'Bobby','Perro','Beagle','Adulto','Macho','Esterilizado','2025-04-01',3),
(8,'Kira','Gato','Mestizo','Cachorro','Hembra','Vacunado','2025-04-15',1),
(9,'Zeus','Perro','Pastor Alemán','Adulto','Macho','Vacunado','2025-05-05',2),
(10,'Coco','Gato','Mestizo','Senior','Macho','Con tratamiento','2025-05-22',3);

-- Tabla Adopciones
CREATE TABLE adopciones (
    id_adopcion INT PRIMARY KEY,
    id_animal INT,
    fecha_adopcion DATE,
    ciudad VARCHAR(50),
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal)
);

INSERT INTO adopciones (id_adopcion, id_animal, fecha_adopcion, ciudad) VALUES
(1,1,'2025-02-10','Lima'),
(2,2,'2025-03-05','Lima'),
(3,3,'2025-03-20','Arequipa'),
(4,4,'2025-04-01','Cusco'),
(5,5,'2025-04-15','Lima'),
(6,6,'2025-05-10','Cusco'),
(7,7,'2025-05-25','Arequipa'),
(8,8,'2025-06-05','Lima'),
(9,9,'2025-06-15','Arequipa'),
(10,10,'2025-07-01','Cusco');
