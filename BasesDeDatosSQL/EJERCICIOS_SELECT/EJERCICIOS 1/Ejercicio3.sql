-- 3. Indica la fecha de ingreso, nombre y comisión de aquellos cuyo salario
-- sea superior a 500, tengan comisión no nula y jefe

SELECT HIREDATE, ENAME, COMM 
FROM EMP
WHERE SAL > 500 AND COMM IS NOT NULL AND  MGR IS NOT NULL 

/*
HIREDATE ENAME            COMM
-------- ---------- ----------
20/02/81 ALLEN             300
22/02/81 WARD              500
28/09/81 MARTIN           1400
08/09/81 TURNER              0
*/