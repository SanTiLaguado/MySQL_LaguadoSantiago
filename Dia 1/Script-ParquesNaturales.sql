CREATE TABLE departamento (
	id_departamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_entidad INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	FOREIGN KEY (id_entidad) REFERENCES entidad_responsable(id_entidad)
);

CREATE TABLE entidad_responsable (
	id_entidad INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(20) NOT NULL
);

CREATE TABLE departamento_identidad (
    id_departamento INT NOT NULL,
    id_entidad INT NOT NULL,
    PRIMARY KEY (id_departamento, id_entidad),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    FOREIGN KEY (id_entidad) REFERENCES entidad_responsable(id_entidad)
);

CREATE TABLE parque_natural (
    id_parque INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha_declaracion DATETIME NOT NULL,
    superficie VARCHAR(10) NOT NULL,
    id_entidad INT NOT NULL,
    FOREIGN KEY (id_entidad) REFERENCES entidad_responsable(id_entidad)
);

CREATE TABLE area (
    id_area INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    superficie VARCHAR(10) NOT NULL,
    id_parque INT NOT NULL,
    FOREIGN KEY (id_parque) REFERENCES parque_natural(id_parque)
);

CREATE TABLE especie (
    id_especie INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_cientifico VARCHAR(50) NOT NULL,
    nombre_vulgar VARCHAR(50) NOT NULL,
    inv_individuos INT NOT NULL,
    id_area INT NOT NULL,
    FOREIGN KEY (id_area) REFERENCES area(id_area)
);

CREATE TABLE tipo_de_persona (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    funcion VARCHAR(200) NOT NULL
);

CREATE TABLE persona (
    id_persona INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero_cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefonos VARCHAR(30) NOT NULL,
    sueldo VARCHAR(10) NOT NULL,
    titulacion VARCHAR(30) NULL,
    tipo_pers INT NOT NULL,
    id_parque INT NOT NULL,
    FOREIGN KEY (id_parque) REFERENCES parque_natural(id_parque),
    FOREIGN KEY (tipo_pers) REFERENCES tipo_de_persona(id_tipo)
);

CREATE TABLE proyecto_investigacion (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    presupuesto VARCHAR(10) NOT NULL,
    periodo VARCHAR(30) NOT NULL
);

CREATE TABLE proyecto_investigacion_especie (
	PRIMARY KEY (id_proyecto, id_especie),
    id_proyecto INT NOT NULL,
    id_especie INT NOT NULL,
    FOREIGN KEY (id_proyecto) REFERENCES proyecto_investigacion(id_proyecto),
    FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);

CREATE TABLE investigador_proyecto (
    PRIMARY KEY (id_investigador, id_proyecto),
    id_investigador INT NOT NULL,
    id_proyecto INT NOT NULL,
    FOREIGN KEY (id_investigador) REFERENCES persona(id_persona),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto_investigacion(id_proyecto)
);

CREATE TABLE alojamiento (
    id_alojamiento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE visitante (
    id_visitante INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    identificacion VARCHAR(10) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    profesion VARCHAR(30) NULL,
    id_alojamiento INT NOT NULL,
    FOREIGN KEY (id_alojamiento) REFERENCES alojamiento(id_alojamiento)
);





