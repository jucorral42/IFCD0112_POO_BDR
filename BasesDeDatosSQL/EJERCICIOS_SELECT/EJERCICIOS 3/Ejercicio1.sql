-- 1) Quiero saber el n° de departamento, nombre y salario mensual más la comisión
-- mensual (el dado es anual), poniendo un alias llamado 'SALARIO MENSUAL
-- CON COMISION' de los empleados que sean del dpto. de ventas (sales), residentes
-- en Chicago, y que su puesto sea salesman o clerk y, en todo caso, tengan comisión
-- n.o nula y distinta de cero. Ordenarlos por su comisión de mayor a menor.

Select DEPTNO, ENAME, ROUND(((SAL/12)+(COMM/12))) AS "SALARIO MENSUAL CON COMISION"
FROM EMP
WHERE JOB = 'SALESMAN'
AND DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO')
AND DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES')
AND COMM <> 0 
ORDER BY COMM DESC

/* 
    DEPTNO ENAME      SALARIO MENSUAL CON COMISION
---------- ---------- ----------------------------
        30 MARTIN                             1504
        30 WARD                                604
        30 ALLEN                               433
*/