-- 12. Obtener todos los datos de los empleados que tengan comisión
-- realmente.

SELECT DEPTNO 
FROM DEPTNO
WHERE (DNAME LIKE '%A%' OR DNAME LIKE '%E%' DNAME  OR DNAME LIKE '%I%') AND LOC IN ('DALLAS', 'CHICAGO') 