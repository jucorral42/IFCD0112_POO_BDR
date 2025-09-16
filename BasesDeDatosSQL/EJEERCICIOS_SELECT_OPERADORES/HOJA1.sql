/*
1o Mostrar la unidad de miles del salario y de la comisión de los empleados en el siguiente formato, por
ejemplo 1451 se debe mostrar como 1MIL, y las unidades de centenas de igual manera, por ejemplo 800 se
mostrará como 8CEN, también de aquellos que cobren más de 999 de salario. En el caso de no tener
comisión pondremos el valor cero.
*/

SELECT SUBSTR(SAL,-4,1)||'MIL'||SUBSTR(SAL,-3,1)||'CEN' AS "SALARIO", NVL(SUBSTR(COMM,-4,1)||'MIL'||SUBSTR(COMM,-3,1)||'CEN',0) AS "COMISION"
FROM EMP
WHERE SAL>999


/*
2o.- Contar el número de empleados en cada departamento pidiendo al usuario el primer número del
departamento.
*/
select count(*)
from emp
where deptno like '&dept%';

/*
3o.- Contar número de alumnos que tengan en su primer apellido una Z final.
*/
---------------------------------------------------------------------
/*
4o.- Contar las distintas matrículas con el alias Total Matriculas Becarios de los becarios.
*/
-----------------------------------------
/*
5o.- Mostrar la siguiente salida por pantalla,

El empleado X ingresó el día Y del mes Z del año W
*/
SELECT (
        'EL EMPLEADO ' ||ENAME||
        ' INGRESO EL DIA '||TO_CHAR (HIREDATE,'DD')||
        ' DEL MES '||TO_CHAR (HIREDATE,'MM')||
        ' DEL AÑO '||TO_CHAR (HIREDATE,'YYYY')
        ) AS FRASE
FROM EMP;

/*
6o.- Seleccionar el nombre de los empleados que lleven más de 35 años de antigüedad en la empresa.
*/
SELECT ENAME 
FROM EMP
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) >35;

/*
7o.- Generar una sentencia que muestre la salida,
*/

/*
8o.- Obtener mediante comparación el valor mayor entre la suma de todos los salarios y la suma de todas las
comisiones de los empleados de Sales con comisión real. Poner alias a las tres columnas.
*/
SELECT SUM(SAL) AS "SALARIO", SUM(COMM) AS "COMISION", GREATEST(SUM(SAL),SUM(COMM)) AS "resultado"
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES' )
    AND COMM <> 0;

/*
9o.- Obtener el número de empleados y el puesto laboral agrupando por trabajo y cambiando los puestos en
inglés por los valores en español, tomando donde haya más de dos empleados con el mismo puesto. Usar
solo la tabla emp.
*/
SELECT COUNT(JOB) AS CONTADOR,DECODE(JOB,'CLERK','DEPENDIENTE','SALESMAN','VENDEDOR', 'ANALYST','ECONOMISTA','MANAGER','RESPONSABLE','PRESIDENT', 'FUNDADOR', 'TRABAJO')
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB)>2;
/*
10o.- Contar el total de alumnos que son y no son becarios mostrando sí o no, siempre que la descripción del
curso no sea nula.
*/

/*
11o.- Mostrar los departamentos que tengan más de dos empleados siempre que no tengan empleados de la
categoría 4.
*/SELECT DEPTNO 
FROM EMP 
WHERE JOB IN (SELECT JOB FROM OFICIO WHERE CATEGORIA <>4)
GROUP BY DEPTNO
HAVING COUNT (*) > 2;

1 4 NOMBRES
2 1 ES UNA GROUP
3 2
4 MUCHOS
5 3
6 1

HOJA 5 
1 9
2 5
3 1
4 6
5 5
6 5
