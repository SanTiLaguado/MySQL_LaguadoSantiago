-- #############################
-- ###### EJERCICIO DIA 4 ######
-- ###########################

-- Uso de la base de datos

USE dia4

-- Creacion de la tabla pais

CREATE TABLE pais (
id_pais INT PRIMARY KEY,
nombre VARCHAR(20),
continente VARCHAR(50),
poblacion INT
);

-- Creacion de la tabla ciudad

CREATE TABLE ciudad (
id_ciudad INT PRIMARY KEY,
nombre VARCHAR(20),
id_pais INT,
FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

-- Creacion de la tabla idioma

CREATE TABLE idioma (
id_idioma INT PRIMARY KEY,
idioma VARCHAR(50)
);

-- Creacion de la tabla idioma_pais

CREATE TABLE idioma_pais (
id_idioma INT,
id_pais INT,
es_oficial TINYINT(1),
FOREIGN KEY (id_idioma) REFERENCES idioma (id_idioma),
FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

-- Insercion de datos a pais

INSERT INTO pais (id_pais, nombre, continente, poblacion) VALUES
(1, 'Colombia', 'America', '50000000'),
(2, 'Brasil', 'America', '40000000'),
(3, 'Chile', 'America', '60000000'),
(4, 'Estados Unidos', 'America', '500000000'),
(5, 'Canada', 'America', '10000000'),
(6, 'Espanya', 'Europa', '10000000'),
(7, 'Italia', 'Europa', '5000000'),
(8, 'Alemania', 'Europa', '1000000'),
(9, 'Francia', 'Europa', '10000000'),
(10,'Rusia', 'Europa', '100000000');
(11, 'China', 'Asia', '1000000'),
(12, 'Japon', 'Asia', '10000000'),
(13,'Arabia Saudita', 'Asia', '100000000');

-- Insercion de datos a ciudad

INSERT INTO ciudad (id_ciudad, nombre, id_pais) VALUES
(1, 'Bogota', 1),
(2, 'Rio', 2),
(3, 'Santiago', 3),
(4, 'Los Angeles', 4),
(5, 'Toronto', 5),
(6, 'Madrid', 6),
(7, 'Roma', 7),
(8, 'Berlin', 8),
(9, 'Paris', 9),
(10,'Moscu', 10);}

-- Insercion de datos a idioma

INSERT INTO idioma (id_idioma, idioma) VALUES
(1, 'Espanyol'),
(2, 'Ingles'),
(3, 'Portugues'),
(4, 'Aleman'),
(5, 'Italiano'),
(6, 'Ruso'),
(7, 'Frances'),
(8, 'Chino'),
(9, 'Japones'),
(10,'Arabe');

-- Insercion de datos a idioma_pais

INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 2, 1),
(4, 8, 1),
(5, 7, 1),
(6, 10, 1),
(7, 9, 1),
(8, 11, 1),
(9, 12, 1),
(10, 13, 1);

-- Ejercicio realizado por Santiago Laguado Osorio CC. 1.***.***.826

-- Consulta general a ciudad
select * from ciudad;

-- Consulta general a paises
select * from pais;

-- Consulta de tipo INNER JOIN para obtener las ciudades
-- que están específicamente asignadas a un país
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais inner join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id_pais = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse

-- Consulta de tipo LEFT JOIN para obtener todas las ciudades
-- junto con su país, incluso si alguna ciudad no está asignada a esta misma
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais left join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id_pais = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
... (Quedan 20 líneas)










