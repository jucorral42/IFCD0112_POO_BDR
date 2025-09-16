-- 4) Quiero saber el puesto de trabajo y el nombre de los empleados que en su nombre
-- tengan una A en el segundo carácter u otra A en el tercero o una S en el quinto y
-- siempre que su nombre sea de seis letras. También tienen que cumplir que su jefe
-- tenga un código superior al 7600 o que su salario mensual sea menor de 200 y que
-- su departamento sea el 20 o el 30 o bien que n° de empleado sea superior a 7700.
-- Ordenarlos por el código de su jefe. Tomar el salario de la tabla como anual.

SELECT JOB, ENAME
FROM EMP
WHERE (ENAME LIKE '_A____' OR ENAME LIKE '__A___' OR ENAME LIKE '____s_' ) 
    AND (MGR > 7600 
    OR SAL/12 < 200 
    AND DEPTNO IN (20,30)
    OR EMPNO > 7700)
    ORDER BY MGR

/*
JOB       ENAME
--------- ----------
SALESMAN  MARTIN
*/