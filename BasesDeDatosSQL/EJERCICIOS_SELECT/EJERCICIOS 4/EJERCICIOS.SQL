/*
1) Seleccionar el nombre y fecha de ingreso de los empleados que pertenezcan al
departamento 10, 20 ó 30 y su nombre no exceda de 4 caracteres. Ordenar por la
fecha de ingreso mayor.
*/
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (10,20,30) 
AND ENAME LIKE ('____')
ORDER BY 2

/*
ENAME      HIREDATE
---------- --------
WARD       22/02/81
KING       17/11/81
FORD       03/12/81
*/




/*
2) Selecciona el salario mensual con el alias 'Salario Mensual' de los empleados
que tengan Jefe o su código sea no inferior a 7900 y no pertenezcan a los
departamentos 10 ó 40. Ordenar por departamento menor.
*/

SELECT SAL AS "SALARIO MENSUAL"
FROM EMP
WHERE MGR IS NOT NULL AND MGR < 7900
AND DEPTNO IN (10,40)
ORDER BY DEPTNO DESC
/*
SALARIO MENSUAL
---------------
           1300
           2450
*/

/*
3) Seleccionar el nombre, trabajo y código de empleado de aquellos que tengan
comprendido su salario entre 600 y 1500 y no entre 1000 y 3000. Ordenar por
código de empleado ascendente.
*/
SELECT ENAME, JOB, EMPNO
FROM EMP
WHERE SAL BETWEEN 600 AND 1500
AND SAL NOT BETWEEN 1000 AND 3000
ORDER BY EMPNO

/*
ENAME      JOB            EMPNO
---------- --------- ----------
SMITH      CLERK           7369
JAMES      CLERK           7900
*/





/*
4) Selecciona el salario mensual, llamándolo así, y el trabajo de aquellos
empleados que sean SALESMAN y tengan un salario distinto entre ellos.
Ordenar de mayor salario a menor.
*/

SELECT DISTINCT SAL AS "SALARIO MENSUAL", JOB
FROM EMP
WHERE JOB = 'SALESMAN'
ORDER BY 1

/*
SALARIO MENSUAL JOB
--------------- ---------
           1250 SALESMAN
           1500 SALESMAN
           1600 SALESMAN
*/

/*
5) Selecciona ahora el salario mensual más la comisión mensual, convirtiendo
los nulos a cero, con un alias, más el nombre, pero queremos incrementar el
salario mensual con un IPC del 5% a todos menos a los CLERK y a los
empleados que hayan ingresado en fecha posterior al 1/1/85.
*/


SELECT (NVL((SAL+COMM)*1,05),0) AS "SALARIO CON COMISION", ENAME
FROM EMP
WHERE ENAME<>CLERK AND HIREDATE > '1/1/85'

/*
6) Seleccionamos también el salario mensual más la comisión mensual
convirtiendo los nulos, pero queremos subir el sueldo solamente a los
SALESMAN o a los que tengan comisión real, un 30%, dejando el IPC igual
en 5%, y llamar a la columna "Nuevo Sueldo".
*/


/*
7) Todo igual que en el anterior en la Select pero ahora queremos quitar la subida
para que sea bajada del sueldo en un 10%, y cambiando el IPC al 3%. La Where
ahora cambiará y afectará a los que no sean MANAGER ni PRESIDENT o no
tengan comisión real.
*/