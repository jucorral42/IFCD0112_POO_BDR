-- 2) Quiero saber el nombre de todos los empleados con su correspondiente n° de
-- departamento únicamente en la localidad de New York, ordenándolos por el n° de
-- depto.

SELECT ENAME, DEPTNO 
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK')
ORDER BY 2
/*
ENAME          DEPTNO
---------- ----------
CLARK              10
MILLER             10
KING               10
 */

 
