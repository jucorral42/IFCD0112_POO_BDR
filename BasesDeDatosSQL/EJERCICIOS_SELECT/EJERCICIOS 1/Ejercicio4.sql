-- 4. Indica los empleados con sus nombres que hayan ingresado en la
-- empresa antes de 1/05/1981

SELECT ENAME 
FROM EMP
WHERE HIREDATE >  '01/01/0001'

/*
ENAME
----------
SMITH
ALLEN
WARD
JONES
*/