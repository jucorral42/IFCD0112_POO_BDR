-- 5. Indica el código de empleado ordenado ascendentemente de los
-- empleados ingresados entre 1/1/1980 y el 1/12/1981 siempre que sean
-- del depto 10 ó 20, tengan de jefe al 7698 y sean MANAGER o
-- SALESMAN.

SELECT EMPNO
FROM EMP
WHERE HIREDATE BETWEEN '1/1/1980' AND '1/12/1981' AND DEPTNO IN (10,20) AND MGR = 7698 AND JOB IN ('MANAGER', 'SALESMAN')
ORDER BY EMPNO

/*
no rows selected
*/