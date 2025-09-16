-- 1. Seleccionar el nombre y el salario de los empleados con los alias NOMBRE y
-- SALARIO ANUAL de aquellos que sean SALESMAN o MANAGER, hayan
-- ingresado en la empresa antes de 1-1-83. Ordenar por fecha mayor primero.

SELECT ENAME AS "NOMBRE", SAL AS "SALARIO ANUAL"
FROM EMP 
WHERE JOB IN ('MANAGER', 'SALESMAN') AND HIREDATE < "1-1-83"
ORDER BY HIREDATE DESC


/*
NOMBRE     SALARIO ANUAL
---------- -------------
MARTIN              1250
TURNER              1500
CLARK               2450
BLAKE               2850
JONES               2975
WARD                1250
ALLEN               1600
*/