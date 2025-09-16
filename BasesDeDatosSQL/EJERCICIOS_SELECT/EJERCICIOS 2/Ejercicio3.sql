-- 3. De los empleados con comisión nula, obtener el nombre de los que tengan de
-- jefe al código 7839. Otra condición a cumplir es que hayan ingresado en la
-- empresa entre 1-1-80 y 31-12-83. Ordenar por el nombre de la A a la Z.

SELECT ENAME 
FROM EMP
WHERE COMM IS NULL
AND MGR = 7839
AND HIREDATE BETWEEN '1-1-80' AND '31-12-83'
ORDER BY ENAME

/*
ENAME
----------
BLAKE
CLARK
JONES
*/