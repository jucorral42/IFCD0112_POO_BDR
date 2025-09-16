-- 11. Obtener el número de departamento de aquellos nombres de
-- departamentos que tengan una A en cualquier parte, o una E o una I,
-- siempre que sean Dallas o de Chicago.

SELECT *
FROM EMP 
WHERE COMM <> 0

/*
     EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20/02/81       1600        300      30
      7521 WARD       SALESMAN        7698 22/02/81       1250        500      30
      7654 MARTIN     SALESMAN        7698 28/09/81       1250       1400      30
*/


/*
LO CONTRARIO SERIA 
WHERE COMM = 0 OR COMM IS NULL
HAY QUE AÑADIR EL NULL YA QUE NULL ES DESCONOCIDO Y TIENE QUE SER O LO UNO O LO OTRO EN EL CASO ANTERIOR 
YA AL SER DISTINTO DE 0 INCLUYE LOS DESCONOCIDOS)
*/