

/*
1o.- Mostrar el alias nombre de los empleados que cumplan bien, ganar más de 1400 o tener comisión real o
ser del departamento 10 y 20, bien haber ingresado antes de enero del 87 o su categoría esté entre 2 y 4. En
todo caso su jefe debe tener un código superior a 7800. Ordenar por la categoría mayor.
*/
SELECT ENAME
FROM EMP E
JOIN OFICIO O ON E.JOB = O.JOB
WHERE (SAL >1400 
    OR COMM <>0
    OR DEPTNO IN (10,20))
    AND (HIREDATE < '01/01/87'
    OR CATEGORIA  BETWEEN 2 AND 4)
    AND MGR > 7800
    ORDER BY CATEGORIA DESC;


/*
2o.- Mostrar para cada categoría laboral, el número de empleados junto con su media salarial con alias todos
pidiéndonos la localidad y la categoría, siempre que ésta sea superior a 1.
*/
SELECT CATEGORIA, COUNT(CATEGORIA) TOTAL, AVG(SAL) MEDIA
FROM EMP E
JOIN OFICIO O ON E.JOB = O.JOB
WHERE  DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = '&LOCALIDAD' )
GROUP BY O.CATEGORIA
HAVING CATEGORIA >1;

/*
3o.- Mostrar el nombre del departamento junto con su número de empleados, salario medio, máximo,
mínimo y total con los alias a elegir de aquellos que, o bien tengan en su localidad una A o una E en
cualquier parte, o bien tengan empleados con categoría no entre 1 y 3 y comisión nula. Solamente deseamos
aplicarlo a los departamentos de Sales y Research y mostrando primero el departamento con mayor gasto en
salarios. Presentar los valores numéricos redondeados a dos decimales.
*/
SELECT 
         DNAME,
         COUNT (ENAME) Total,
        ROUND(AVG(SAL),2) "Salario medio",
        ROUND(MAX(SAL),2) "SALARIO MAXIMO",
        ROUND(MIN(SAL),2) "SALARIO MINIMO",
        ROUND(SUM(SAL),2) "SALARIO TOTAL"
FROM 
    DEPT D
JOIN EMP E ON E.DEPTNO=D.DEPTNO
WHERE
        (LOC LIKE '%A%'
        OR LOC LIKE '%E%'
        OR JOB IN (SELECT JOB FROM OFICIO WHERE CATEGORIA NOT BETWEEN 1 AND 3)
        AND COMM IS NULL)
        AND DNAME IN ('SALES','RESEARCH')
GROUP BY DNAME
ORDER BY SUM(E.SAL) DESC



/*
4o.- Basándonos en la select anterior realizar los siguientes cambios,
 Ahora queremos mostrar además el puesto de trabajo de los empleados en cada departamento
 Ordenar por el nombre de departamento de la Z a la A
 Crear tablas cruzadas con Cube y Rollup indistintamente (comprobar que actúan en este caso de
la misma manera)
 En caso de que algún campo presente valores nulos cambiarlos por un texto a elegir
*/

/*
5o.- Deseamos mostrar, para cada puesto de trabajo, que será pedido por teclado, y por cada número de
departamento, la media salarial con dos decimales, su puesto y su número departamental, ordenados por
departamento mayor.
*/

/*
6o.- Mostrar la siguiente salida por pantalla, sin alias para las constantes
El total de empleados con comisión real es de X, su media salarial es de Y, su nombre de departamento es
el Z y su categoría laboral es la W.
*/


