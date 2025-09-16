SIMULACRO DE EXAMEN SQL - SOLUCIONARIO
Todas las querys se deben hacer sin combinación de tablas excepto si es imprescindible

La orden Group By se debe usar correctamente

Se deben poner alias de columna a todas las expresiones/funciones

1.- Obtener el nombre de los empleados cuyo salario multiplicado por 100 sea igual
a alguna matrícula de los alumnos.
SELECT ENAME
FROM EMP
WHERE SAL*100 = ANY( SELECT MATRICULA FROM ALUMNOS)
/
NOMBRE
----------
TURNER
2.- Obtener el nombre de empleado, nombre de departamento y la categoría del
empleado, de aquellos empleados cuyo salario sea mayor a todos y cada uno de
los máximos salarios que haya en cada número de departamento que tenga Clerks.
SELECT ENAME, DNAME, CATEGORIA
FROM EMP NATURAL JOIN DEPT NATURAL JOIN OFICIO
WHERE SAL &gt; ALL (SELECT MAX(SAL) FROM EMP WHERE JOB=&#39;CLERK&#39;
GROUP BY DEPTNO)
/
ENAME DNAME CATEGORIA
---------- -------------- ----------
ALLEN SALES 2
TURNER SALES 2
FORD RESEARCH 3
SCOTT RESEARCH 3
JONES RESEARCH 4
BLAKE SALES 4
CLARK ACCOUNTING 4
KING ACCOUNTING 5
8 rows selected.
3.- Calcula la edad real actual de un usuario pidiéndole la fecha de nacimiento para
obtener la salida por pantalla siguiente.

Su edad es de 54 anos

SELECT &#39;Su edad es de
&#39;||FLOOR(MONTHS_BETWEEN(SYSDATE,&#39;&amp;FECHA_DE_NACIMIENTO&#39;)/12
)||&#39; anos&#39; &quot; &quot;
FROM DUAL

/
4.- Obtener exactamente la siguiente salida por pantalla para los empleados cuya
función se pida por teclado ordenando por el nombre del empleado de la A a la Z.
James ingreso en el Siglo 20 Ano 81 Trimestre 4 Mes Diciembre Semana 1 Dia

Jueves

SELECT INITCAP(ENAME)||&#39; ingreso en el Siglo &#39;||
TO_CHAR(HIREDATE,&#39;CC&quot; Ano &quot;YY&quot; Trimestre &quot;Q&quot; Mes &quot;Month&quot; Semana
&quot;WW&quot; Dia &quot;Day&#39;)
&quot;Fecha de ingreso&quot;
FROM EMP
WHERE JOB IN (SELECT JOB FROM OFICIO WHERE
FUNCIONES=&#39;&amp;FUNCIONES&#39;)
ORDER BY 1
/
DEPENDIENTE
Fecha de ingreso
-------------------------------------------------------------------------------------------------------
-----------------
Adams ingreso en el Siglo 20 Ano 87 Trimestre 2 Mes Mayo Semana 21
Dia Sßbado
James ingreso en el Siglo 20 Ano 81 Trimestre 4 Mes Diciembre Semana 49
Dia Jueves
Miller ingreso en el Siglo 20 Ano 82 Trimestre 1 Mes Enero Semana 04
Dia Sßbado
Smith ingreso en el Siglo 20 Ano 80 Trimestre 4 Mes Diciembre Semana 51
Dia MiÚrcoles
5.- Obtener el nombre de los empleados que tienen la última letra de su nombre
igual que la última letra del nombre de los alumnos.
SELECT ENAME
FROM EMP
WHERE SUBSTR(ENAME,LENGTH(ENAME),1) IN (SELECT
SUBSTR(NOMBRE,LENGTH(NOMBRE),1)
FROM ALUMNOS)
/
ENAME
----------
MILLER
JONES
ADAMS
BLAKE
ALLEN
MARTIN

TURNER
JAMES
8 rows selected.
6.- Queremos calcular los máximos salarios en la empresa por localidad y categoría
mostrando solamente los n mayores salarios, siendo n un número que pediremos al
usuario.
SELECT *
FROM
(SELECT MAX(SAL), LOC, CATEGORIA FROM EMP NATURAL JOIN DEPT
NATURAL JOIN OFICIO
GROUP BY LOC, CATEGORIA ORDER BY 1 DESC)
WHERE ROWNUM&lt;=&amp;NUMERO
/
Enter value for numero: 3
old 5: WHERE ROWNUM&lt;=&amp;NUMERO
new 5: WHERE ROWNUM&lt;=3
MAX(SAL) LOC CATEGORIA
---------- ------------ ----------
5000 NEW YORK 5
3000 DALLAS 3
2975 DALLAS 4

7.- Muestra los trabajos y nombres de departamento con los alias Puesto y
Departamento que cumplan dos condiciones. La primera es que el salario sea
mayor de 1500 o que la localidad no contenga dos letras L seguidas en cualquier
lugar. La segunda es que no hayan ingresado en la empresa antes del 31/12/1983
o sean del departamento 10, siempre que no tengan comisión nula realmente.
SELECT JOB PUESTO, DNAME DEPARTAMENTO
FROM EMP NATURAL JOIN DEPT
WHERE (SAL &gt; 1500 OR LOC NOT LIKE &#39;%LL%&#39;)
AND
(HIREDATE &gt;= &#39;31-12-83&#39; OR DEPTNO=10) AND (COMM IS NULL OR COMM
=0);
PUESTO DEPARTAMENTO
--------- --------------
MANAGER ACCOUNTING
ANALYST RESEARCH
PRESIDENT ACCOUNTING
CLERK ACCOUNTING