-- 9. Mostrar al empleado con su salario anualizado y con el nombre de la
-- columna SAL AÑO. Tomando el salario de la tabla como mensual.
-- Después añadir lo mismo, pero con la comisión.
SELECT EMPNO, NVL((SAL*12),0) "SAL AÑO", NVL((COMM*12),0) "COMM AÑO"
FROM EMP
/*
     EMPNO   SAL A├æO  COMM A├æO
---------- ---------- ----------
      7369       9600
      7499      19200       3600
      7521      15000       6000
      7566      35700
      7654      15000      16800
      7698      34200
      7782      29400
      7788      36000
      7839      60000
      7844      18000          0
      7876      13200
      7900      11400
      7902      36000
      7934      15600
*/