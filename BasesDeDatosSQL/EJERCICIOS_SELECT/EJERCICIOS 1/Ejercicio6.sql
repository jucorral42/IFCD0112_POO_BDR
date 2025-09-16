-- 6. Saca un listado de todos los empleados, junto a sus jefes, siempre que el
-- jefe no sea KING
SELECT ENAME, MGR 
FROM EMP
WHERE MGR <> (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')

/*
ENAME             MGR
---------- ----------
SMITH            7902
ALLEN            7698
WARD             7698
MARTIN           7698
SCOTT            7566
TURNER           7698
ADAMS            7788
JAMES            7698
FORD             7566
MILLER           7782
*/
