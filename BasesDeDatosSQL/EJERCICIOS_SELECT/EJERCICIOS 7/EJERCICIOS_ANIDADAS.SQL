/*1. Mostrar el nombre del departamento que tenga empleados con salario superior a
500. 3
*/
SELECT DNAME
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL > 500)  ;


/*
2. Seleccionar el número de departamento y el nombre del empleado cuyo jefe sea un
empleado de los departamentos 10 ó 20.
*/ 8
SELECT DEPTNO, ENAME
FROM EMP
WHERE MGR IN (SELECT EMPNO  FROM EMP WHERE DEPTNO IN (10,20));

/*
3. Seleccionar el nombre, salario y comisión de los empleados que no tengan comisión y
cuyo jefe sea un empleado que pertenezca a la localidad de New York.
*/ 4
SELECT ENAME, SAL, COMM
FROM EMP
WHERE (COMM IS NULL OR COMM < 0)  
    AND MGR IN (SELECT EMPNO FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK'));


/*
4. Seleccionar el nombre, Código y fecha de ingreso de los empleados cuyo jefe sea un
empleado que no tenga jefe.
*/ 3
SELECT ENAME, EMPNO, DEPTNO, HIREDATE
FROM EMP
WHERE MGR IN (SELECT EMPNO FROM EMP WHERE MGR IS NULL );

/*
5. Seleccionar el salario mensual con un alias y el nombre de los empleados cuyo jefe
sea un empleado con código menor de 7900 y mayor de 7800.
*/ 3
SELECT SAL SALARIO, ENAME
FROM EMP
WHERE MGR IN (SELECT EMPNO FROM EMP WHERE EMPNO <7900 AND EMPNO > 7800);


/*
6. Seleccionar el nombre de los empleados de Sales y cuyo jefe sea un empleado que no
pertenezca a Boston.
*/6
SELECT ENAME
FROM EMP
WHERE  DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES') AND MGR IN (SELECT EMPNO FROM EMP WHERE DEPTNO NOT IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'BOSTON' ) );

/*
7. Seleccionar el nombre del departamento que tenga empleados con salario mayor a
algún empleado de la localidad de New York. Usar siempre una select reducida a la
minima expresion o vista virtual en lugar de tablas en todas las claúsulas from.
*/ 3
SELECT DNAME 
FROM DEPT
WHERE DEPTNO IN ( SELECT DEPTNO FROM EMP WHERE SAL > SOME (SELECT SAL FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK')) );

/*
8. Seleccionar el código y nombre del empleado que sea Manager, no pertenezca a
Sales y cuyo trabajo sea alguno de los existentes en la localidad de Chicago.
*/ 2
SELECT EMPNO, ENAME
FROM EMP
WHERE job ='manager' and deptno not in (select deptno from dept where dname='sales')
AND JOB IN (SELECT JOB FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO' ));