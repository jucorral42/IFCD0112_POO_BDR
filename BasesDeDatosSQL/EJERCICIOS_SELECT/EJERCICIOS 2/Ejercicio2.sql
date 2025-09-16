-- 2. Seleccionar el salario mensual aumentado con un 5% de ipc con el alias
-- SALARIO IPC de los que tengan un salario no comprendido entre 3000 y 5000, o
-- su código de empleado tenga un 9 en su segundo carácter, o su departamento
-- no sea el 10 ó el 20, siempre que cumplan ser CLERK, ANALYST o SALESMAN.
-- Ordenar por el salario menor.

SELECT ROUND(SAL*1.05) AS "SALARIO IPC"
FROM EMP
WHERE (SAL NOT BETWEEN 3000 AND 5000
OR EMPNO LIKE '_9%'
OR DEPTNO NOT IN (10,20))
AND JOB IN ('CLERK','ANALYST','SALESMAN')
ORDER BY SAL

/*
SALARIO IPC
-----------
        840
        998
       1155
       1313
       1313
       1365
       1575
       1680
       3150
*/                  