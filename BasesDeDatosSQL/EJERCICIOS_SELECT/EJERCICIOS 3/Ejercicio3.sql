-- 3) Quiero saber el nombre de todos los empleados que tengan un salario mensual
-- superior o igual a 250, siempre y cuando no tengan comisión realmente. Tomar el
-- salario de la tabla como anual

SELECT ENAME 
FROM EMP
WHERE SAL/12 >=250 AND (COMM = 0 OR COMM IS NULL)

/*
ENAME
----------
SCOTT
KING
FORD
*/