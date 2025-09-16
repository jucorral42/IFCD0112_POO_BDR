-- 2. Indica el código de los empleados que tienen comisión.

SELECT EMPNO 
FROM EMP
WHERE COMM IS NOT NULL

/*
     EMPNO
----------
      7499
      7521
      7654
      7844
      */
