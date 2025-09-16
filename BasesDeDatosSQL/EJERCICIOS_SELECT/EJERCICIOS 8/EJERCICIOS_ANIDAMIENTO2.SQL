/*1.- Seleccionar el nombre del departamento cuyo valor numérico de departamento (1a anidada)
sea superior al que posee el empleado con código 7698 y cuyo número de departamento (2a
anidada) sea uno de los que poseen los empleados con categoría inferior a 2.
*/ 1
SELECT DEPTNO
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE EMPNO > 7698)
        AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB IN (SELECT JOB FROM OFICIO WHERE CATEGORIA <2));
/*
2.- Seleccionar el nombre de departamento cuyo valor numérico (1a anidada) es superior al que
poseen los empleados con salario comprendido entre 4000 y 5000. Otra condición a cumplir es
que el valor numérico del departamento (2a anidada) sea superior o igual a cualquiera del que
poseen los empleados con comisión. Ordenarlos por el nombre de departamento ascendente.
*/ 4
SELECT DNAME
FROM DEPT
WHERE DEPTNO > (SELECT DEPTNO FROM EMP WHERE SAL BETWEEN 4000 AND 5000)
    AND DEPTNO >= ANY (SELECT DEPTNO FROM EMP WHERE COMM is not null )
ORDER BY DNAME;


/*
3.- Seleccionar el nombre, código, funciones y la localidad de trabajo de los empleados cuyo
salario sea igual a cualquier comisión multiplicada por 10. Ordenarlos por el código de mayor a
menor. Utilizar una vista como tabla que contenga todos los campos de las tablas que nos hagan
falta.
*/ 3
SELECT ENAME, EMPNO, (SELECT FUNCIONES FROM OFICIO O WHERE O.JOB = E.JOB) FUNCION, (SELECT LOC FROM DEPT D WHERE D.DEPTNO = E.DEPTNO) LOCALIDADE
FROM EMP E
WHERE SAL = ANY (SELECT COMM*10 FROM EMP)
ORDER BY EMPNO DESC;

/* 
4.- Mostrar las funciones de lo empleados que tengan el mismo departamento que james o su
 localidad tenga un A en cualquier parte, siempre que no tengan comision realmente. ordenar por la funcion de la A a la Z
 */
 Select funciones
 from oficio
 where (job in (select job from emp where deptno in (select deptno from emp where ename = 'james'))
        or job in (select job from emp where deptno in (select deptno from dept where loc like '%A%')))
        and job in ( select job from emp where comm = 0 or comm is null)
order by 1 ;


/*
5.- Dar el puesto de trabajo de los empleados que sean de dallas o boston con mas de 2000 de salario y clerk
ordenar por codigo de empleado mayor primero
*/
Select JOB
from emp
where deptno in (select deptno from dept where loc in ('dallas','boston'))
    and sal > 2000
    and ename = 'clerk'
    order by empno desc;

/*
6._ Mostrar las categorias y los nombres de departamento
 de aquellos empleados que trabajen como analyst y hayan ingresado en la empresa antes del 87,
  o bien siempre que tengan una funcion laboral con 2 e en cualquier parte. ordena por categoria mayor y luego por dname de z a a
*/

SELECT distinct CATeGORIA, distinct DNAME
FROM EMP NATURAL JOIN DEPT NATURAL JOIN OFICIO
WHERE (JOB = 'ANALYST' AND HIREDATE < '1-1-87') 
OR FUNCIONES LIKE '%E%E%'
order by 1 desc, 2 desc;
