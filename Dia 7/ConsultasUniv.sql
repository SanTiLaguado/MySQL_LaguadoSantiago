# Estas son las consultas del examen 1 de MYSQL ya corregidas correctamente


#1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
#El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado.
#El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
#El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

SELECT d.nombre as nombre_departamento, p.nombre, p.apellido1, p.apellido2 
FROM profesor p
LEFT JOIN departamento d ON p.id_departamento = d.id_departamento
ORDER BY nombre_departamento ASC, nombre ASC, apellido1 ASC, apellido2 ASC;

#2. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT * FROM profesor p where p.id_departamento IS NULL;

#3. Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT * from departamento d LEFT JOIN profesor p ON p.id_departamento = d.id_departamento 
WHERE p.id_profesor IS NULL;

#4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

SELECT * FROM profesor p LEFT JOIN asignatura a	on p.id_profesor = a.id_profesor
where a.id_profesor IS NULL;

#5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT * FROM asignatura a WHERE a.id_profesor IS NULL;

#6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
# El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

SELECT DISTINCT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura
FROM asignatura a
JOIN profesor p ON a.id_profesor = p.id_profesor
JOIN departamento d ON p.id_departamento = d.id_departamento
LEFT JOIN alumno_se_matricula_asignatura ama ON a.id_asignatura = ama.id_asignatura
WHERE ama.id_curso_escolar IS NULL;

#7. Devuelve el número total de **alumnas** que hay.

SELECT count(*) FROM alumno WHERE sexo = ('M');

#8. Calcula cuántos alumnos nacieron en `1999`.

SELECT count(*) FROM alumno WHERE YEAR(alumno.fecha_nacimiento) = 1999;

#9. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento
# y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores
# asociados y deberá estar ordenado de mayor a menor por el número de profesores.

SELECT d.nombre AS nombre_departamento, COUNT(*) AS cantidad FROM profesor p 
INNER JOIN departamento d ON p.id_departamento = d.id_departamento 
GROUP BY d.nombre ORDER BY cantidad DESC;

#10. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir 
# departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS cantidad 
FROM departamento d 
LEFT JOIN profesor p ON d.id_departamento = p.id_departamento 
GROUP BY d.nombre 
ORDER BY cantidad DESC;

#12. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que 
# tengan más de `40` asignaturas asociadas.

SELECT g.nombre AS nombre_grado, COUNT(a.id_asignatura) as cantidad_asignaturas
FROM asignatura a LEFT JOIN grado g on a.id_grado = g.id_grado
GROUP BY g.nombre HAVING cantidad_asignaturas >40;

#13. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
# El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
# Ordene el resultado de mayor a menor por el número total de crédidos.

SELECT a.tipo as tipo, count(a.creditos) as numero, g.nombre AS nombre_grado
FROM asignatura a LEFT JOIN grado g on a.id_grado = g.id_grado
GROUP BY a.tipo, g.nombre ORDER BY numero ASC;

# 14. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
# El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT COUNT(asm.id_alumno) as alumnos, c.anyo_inicio as ano
FROM alumno_se_matricula_asignatura asm LEFT JOIN curso_escolar c on asm.id_curso_escolar = c.id_curso_escolar
GROUP BY asm.id_curso_escolar, c.id_curso_escolar; 

# 15. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no 
# imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
# El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT * FROM profesor;
SELECT * FROM asignatura;

SELECT COUNT(a.id_profesor) as numero, p.id_profesor, p.nombre, p.apellido1, p.apellido2
FROM profesor p LEFT JOIN asignatura a on p.id_profesor = a.id_profesor
GROUP BY p.id_profesor ORDER BY numero DESC;

#16. Devuelve todos los datos del alumno más joven.

SELECT * FROM alumno WHERE fecha_nacimiento=(
	SELECT MAX(fecha_nacimiento)
	FROM alumno
);

#17. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT * FROM profesor where id_departamento IS NULL;

#18. Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.* FROM departamento d left JOIN
profesor p on d.id_departamento = p.id_departamento
where p.id_departamento IS NULL;

# 19. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT * FROM profesor p LEFT JOIN asignatura a	on p.id_profesor = a.id_profesor
where a.id_profesor IS NULL AND p.id_departamento IS NOT NULL;

#20. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT * FROM asignatura WHERE id_profesor IS NULL;