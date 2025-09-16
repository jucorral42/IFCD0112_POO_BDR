-- 5) Decirme los empleados con su departamento que tengan en su nombre una A en el
-- tercer carácter y en el trabajo una A en su segundo carácter y, en todo caso, su trabajo
-- sea de 7 caracteres. A la vez dime sólo los que no pertenecen a los departamentos
-- 10 y 20.

SELECT ENAME,DEPTNO
FROM EMP
WHERE JOB LIKE '_A%' AND JOB LIKE '_______' AND ENAME LIKE '__A%'AND DEPTNO NOT IN (10,20)

/*
ENAME          DEPTNO
---------- ----------
BLAKE              30
*/