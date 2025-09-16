-- 7. Saca un listado del nombre, código y salario de aquellos que tengan en
-- su oficio una A en su segundo y penúltimo carácter, o sean de los
-- departamentos 10 ó 20.

SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE JOB LIKE '_A%A_' OR DEPTNO IN (10,20)

/*
ENAME           EMPNO        SAL
---------- ---------- ----------
SMITH            7369        800
ALLEN            7499       1600
WARD             7521       1250
JONES            7566       2975
MARTIN           7654       1250
CLARK            7782       2450
SCOTT            7788       3000
KING             7839       5000
TURNER           7844       1500
ADAMS            7876       1100
FORD             7902       3000
MILLER           7934       1300
*/