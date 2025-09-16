SIMULACRO DE EXAMEN SQL

Todas las querys se deben hacer sin combinación de tablas excepto si es imprescindible

La orden Group By se debe usar correctamente

Se deben poner alias de columna a todas las expresiones/funciones
/*
1.- Obtener el nombre de los empleados cuyo salario multiplicado por 100 sea igual
a alguna matrícula de los alumnos.
*/
SELECT DISTINCT ENAME
FROM EMP, ALUMNOS
WHERE SAL * 100 = MATRICULA;
-- NO NECESITABA LA TABLA ALUMNOS SE PODIA HACER UNA SUBCONSULTA si se comparan 2 tablas que no estan relacionadas obligatorio anidamiento EL DISTINCT TAMBIEN SOBRA HAY QUE HACERLO CON UNA SUBQUERY
0.3
/*
2.- Obtener el nombre de empleado, nombre de departamento y la categoría del
empleado, de aquellos empleados cuyo salario sea mayor a todos y cada uno de
los máximos salarios que haya en cada número de departamento que tenga Clerks.
*/
SELECT  E.ENAME, D.DNAME, O.CATEGORIA
FROM EMP E NATURAL JOIN DEPT D NATURAL JOIN OFICIO O
WHERE E.SAL > ALL ( SELECT MAX(SAL) FROM EMP WHERE DEPTNO IN ( SELECT DEPTNO FROM DEPT WHERE JOB = 'CLERK'))
GROUP BY E.ENAME, D.DNAME , O.CATEGORIA ;
0.8
-- LA SOLUCION DEL PROFESOR HACE LA GROUP BY DENTRO DE LA SUB CONSULTA Por ename se repiten campos 

-- SOLUCION DEL PROFESOR
SELECT ENAME, DNAME, CATEGORIA
FROM EMP NATURAL JOIN DEPT NATURAL JOIN OFICIO
WHERE SAL &gt; ALL (SELECT MAX(SAL) FROM EMP WHERE JOB=&#39;CLERK&#39;
GROUP BY DEPTNO)

/*
3.- Calcula la edad real actual de un usuario pidiéndole la fecha de nacimiento para
obtener la salida por pantalla siguiente.

Su edad es de 54 anos
*/
SELECT  'Su edad es de ' || FLOOR (((MONTHS_BETWEEN (SYSDATE,'&FECHHA_ACTUAL'))/12)) || ' anos' AS "CALCULADORA EDAD" FROM DUAL;
1
--solucion del profesor
SELECT &#39;Su edad es de
&#39;||FLOOR(MONTHS_BETWEEN(SYSDATE,&#39;&amp;FECHA_DE_NACIMIENTO&#39;)/12
)||&#39; anos&#39; &quot; &quot;
FROM DUAL


-- hecho igual


/*
4.- Obtener exactamente la siguiente salida por pantalla para los empleados cuya
función se pida por teclado ordenando por el nombre del empleado de la A a la Z.
James ingreso en el Siglo 20 Ano 81 Trimestre 4 Mes Diciembre Semana 1 Dia Jueves
*/
SELECT ENAME ||TO_CHAR (HIREDATE, '" ingreso en el Siglo " CC " ANO" YY " Trimeste " Q ')
||TO_CHAR (HIREDATE,'" Mes " month " Semana " ww " Dia " Day') 
 FROM EMP
 where job in (select job from oficio where funcionES = upper ('&funcion') )
 ORDER BY ENAME; 
    1
 -- solucion del profesor 
 -- ojo con el initcap el resto muy similar, yo he hecho upper para la entrada de teclado
SELECT INITCAP(ENAME)||&#39; ingreso en el Siglo &#39;||
TO_CHAR(HIREDATE,&#39;CC&quot; Ano &quot;YY&quot; Trimestre &quot;Q&quot; Mes &quot;Month&quot; Semana
&quot;WW&quot; Dia &quot;Day&#39;)
&quot;Fecha de ingreso&quot;
FROM EMP
WHERE JOB IN (SELECT JOB FROM OFICIO WHERE
FUNCIONES=&#39;&amp;FUNCIONES&#39;)
ORDER BY 1


/*
5.- Obtener el nombre de los empleados que tienen la última letra de su nombre
igual que la última letra del nombre de los alumnos.
*/

SELECT ENAME 
FROM EMP
WHERE SUBSTR(ENAME,-1,1) = ANY (SELECT SUBSTR(NOMBRE,-1,1) FROM ALUMNOS); 
1
-- lo he hecho distinto pero creo que la solucion es la misma ??


/*
6.- Queremos calcular los máximos salarios en la empresa por localidad y categoría
mostrando solamente los n mayores salarios, siendo n un número que pediremos al
usuario.
*/
SELECT MAX(SAL) SALARIO, LOC, CATEGORIA
FROM EMP NATURAL JOIN DEPT NATURAL JOIN OFICIO
WHERE ROWNUM >= &INTRODUZCA_NUMERO
group by loc, categoria
ORDER BY SALARIO;
0.5
-- este lo tengo mal, lo suyo hubiese sido hacer un select * y hacer una anidada en el from, estamos haciendo una conulta
-- ya que no podemos hacer el where rownum antes del group by y tenemos una group bye;

/*
7.- Muestra los trabajos y nombres de departamento con los alias Puesto y
Departamento que cumplan dos condiciones. La primera es que el salario sea
mayor de 1500 o que la localidad no contenga dos letras L seguidas en cualquier
lugar. La segunda es que no hayan ingresado en la empresa antes del 31/12/1983
o sean del departamento 10, siempre que no tengan comisión nula realmente.
*/
SELECT JOB PUESTO, DNAME DEPARTAMENTO
FROM EMP NATURAL JOIN DEPT
WHERE (SAL > 1500 OR LOC NOT LIKE '%LL%')
    AND ( HIREDATE >= '31/12/1983' OR DEPTNO = 10)
    AND COMM IS NULL OR COMM = 0;
    0.8
    --CUIDADO CON LOS NO CONTENGA , EN VEZ DE LOC LIKE ES LOC NOT LIKE cuidado con el igual del 31/12 >=
    -- Cuando la comision sea nula realmente tiene que ser que los 0 no salgan y que la comision sea nula.
    -- comm nula REALMENTEW es que el 0 no salga, 

    Anidadas
    conbinacion
    funciones
    mayor all ANY
    fecha
    SUBSTR
    multiples condiciones
    