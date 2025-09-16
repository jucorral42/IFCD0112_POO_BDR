-- 8. Saca la media del salario por departamento y ordénalo de mayor a
-- menor.
SELECT DEPTNO, ROUND(AVG(SAL)) MEDIA_SALARIO 
FROM EMP
GROUP BY DEPTNO
ORDER BY 2 DESC

/*
    DEPTNO MEDIA_SALARIO
---------- -------------
        10          2917
        20          2175
        30          1567
*/