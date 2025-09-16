EJERCICIO CON EJEMPLOS Y ORDEN 
SELECT JOB PUESTO, COUNT(*) NUMERO, SUM(SAL) TOTAL, AVG(SAL) MEDIA, MAX(SAL) MAXIMO,
MIN(SAL) MINIMO
FROM EMP
WHERE DEPTNO=30
GROUP BY JOB
HAVING AVG(SAL)>0
ORDER BY 1
/

EJERCICIO CON JOIN


Selecciona el nombre de los empleados junto con el nombre
de los departamentos de aquellos que sean del departamento 
que empiece por 1 ó 2, o su puesto laboral tenga la sílaba
sa en cualquier parte, siempre que cumplan ser de la localidad de Sales o Dallas,
y también que su salario no sea mayor de 3000.
 Ordena por el nombre del departamento de la Z a la A.

SELECT E.ENAME, D.DNAME 
 FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
 WHERE (E.DEPTNO LIKE '1%' OR E.DEPTNO LIKE ('2%') OR E.JOB LIKE ('%SA%'))
 AND LOC IN ('SALES','DALLAS')
 AND SAL <= 3000
 ORDER BY 2 DESC;



 SELECT EMAME ,TO_CHAR (HIREDATE, ' "ESTE EMPLEADO LLEVA TRABAJANDO DESDE LA SEMANA ", Ww') "FECHA"
FROM EMP

COUNT 

LAS QUE SUELE PREGUNTAR DE NUMERICAS
SEIL




Lectura de EJERCICIO
Tipo de query
1:NOrmal
2:combinacion de tablas
en la clausula select hay campos de distintas tablas
3: group BY
- siempre que existan funciones de agregados (count, sum, avg....) siempre que exista una de estas tienen una funcion de group by por el campo del que se solicita el count
el having va con el group by, es el where de la group by 

4: anidada: 
pasar datos entre tablas con (pk,fk )
comparar columnas no compatibles 
