USE escuela;

CREATE TABLE persona (
  id_persona INT PRIMARY KEY AUTO_INCREMENT,
  nif VARCHAR(60) NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) NOT NULL,
  ciudad VARCHAR(25) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(9) NOT NULL,
  fecha_nacimiento DATE,
  sexo ENUM('H', 'M'),
  tipo ENUM('A', 'B')
);

CREATE TABLE departamento (
  id_departamento INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE grado (
  id_grado INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE profesor (
  id_profesor INT PRIMARY KEY AUTO_INCREMENT,
  id_departamento INT,
  FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);

CREATE TABLE asignatura (
  id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  creditos VARCHAR(10),
  tipo ENUM('A', 'B'),
  curso TINYINT(3),
  cuatrimeste TINYINT(3),
  id_profesor INT,
  id_grado INT,
  FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor),
  FOREIGN KEY (id_grado) REFERENCES grado (id_grado)
);

CREATE TABLE curso_escolar (
  id_curso_escolar INT PRIMARY KEY AUTO_INCREMENT,
  anyo_inicio YEAR,
  anyo_fin YEAR
);

CREATE TABLE alumno_se_matricula_asignatura (
  id_alumno INT,
  id_asignatura INT,
  id_curso_escolar INT,
  FOREIGN KEY (id_alumno) REFERENCES persona (id_persona),
  FOREIGN KEY (id_asignatura) REFERENCES asignatura (id_asignatura),
  FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar (id_curso_escolar)
);

















