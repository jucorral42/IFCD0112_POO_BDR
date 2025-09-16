-- 1. Indica el código de empleado y el nombre de los que ganen un salario
-- entre 1000 y 2000, ordenándolos por el nombre de la A a la Z

Select EMPNO, ENAME 
FROM EMP
WHERE SAL BETWEEN '1000' AND '2000'
ORDER BY ENAME

/* 
     EMPNO ENAME
---------- ----------
      7876 ADAMS
      7499 ALLEN
      7654 MARTIN
      7934 MILLER
      7844 TURNER
      7521 WARD

6 rows selected.
*/