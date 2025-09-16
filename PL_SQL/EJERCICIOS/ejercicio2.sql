/*
1._ Crear un record que se componga de los campos job y ename de la emp, dname de dept y las funciones de oficio, almacenar el record
los valores del empleado que no tiene jefe o tenga la categoria 5, siempre que su funcion tenga una F. 
visualizarlo todo.
*/

DECLARE
TYPE REMP IS RECORD
(TRABAJO EMP.JOB%TYPE, NOMBRE EMP.ENAME%TYPE, DEPARTAMENTO DEPT.DNAME%TYPE);
VEMP REMP;

BEGIN
SELECT JOB, ENAME, DNAME INTO VEMP
FROM EMP natural join dept
WHERE( mgr is null
or job in (select job from oficio where categoria = 5) )
and job in (select job from oficio where funciones like '%F%')
;


DBMS_OUTPUT.PUT_LINE(VEMP.TRABAJO||', ' ||VEMP.NOMBRE||', ' ||VEMP.DEPARTAMENTO);
END;
/
/*
1.- Obtener una salida por pantalla que muestre el nombre de departamento, su media salarial y
el número de empleados de aquel departamento que tenga empleados que sean SALESMAN
*/

DECLARE
    DEPARTAMENTO DEPT.DNAME%TYPE;
    MEDIA NUMBER (6,2);
    EMPLEADOS NUMBER (2);

BEGIN
    SELECT DNAME, COUNT (*), AVG(SAL) INTO DEPARTAMENTO, EMPEADOS, MEDIA
    FROM DEPT NATURAL JOIN EMP
    WHERE JOB = 'SALESMAN'
    GROUP BY DNAME;

DBMS_OUTPUT.PUT_LINE(DEPARTAMENTO ||', ' ||MEDIA||', ' ||EMPLEADOS);
END;

/*
2.- Mostrar la media salarial por puesto de trabajo de aquellos que trabajen en CHICAGO y
sean MANAGER.
*/
DECLARE 
    MEDIA NUMBER(6,2);
    PUESTO EMP.JOB%TYPE;
BEGIN
    SELECT AVG(SAL),JOB INTO MEDIA, PUESTO
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO')
    GROUP BY JOB
    HAVING JOB = 'MANAGER';
    DBMS_OUTPUT.PUT_LINE(PUESTO||', ' ||MEDIA||', ');
END;

/*
3.- Mostrar todos los campos del departamento que tenga el mayor salario en la empresa con la
siguiente salida por pantalla
“El departamento con el número X con el nombre Y se ubica en Z”
*/
DECLARE 
    
    VCAMPOS DEPT%ROWTYPE;

BEGIN
    SELECT * INTO VCAMPOS
    FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL)FROM EMP));
    DBMS_OUTPUT.PUT_LINE('El departamento '||VCAMPOS.DEPTNO ||' con el nombre ' ||VCAMPOS.DNAME ||' se ubica en '|| VCAMPOS.LOC);
END;


/*
4.- Ahora calcular la media salarial de cada departamento y obtener únicamente por pantalla la
media salarial del departamento que tenga el mayor salario de media.
*/

DECLARE 
    
     MEDIA NUMBER(6,2);

BEGIN
    SELECT ROUND(MAX(AVG(SAL))) INTO MEDIA
    FROM emp
    group by deptno;


    DBMS_OUTPUT.PUT_LINE('El departamento '||VCAMPOS.DEPTNO ||' con el nombre ' ||VCAMPOS.DNAME ||' se ubica en '|| VCAMPOS.LOC);
END;

SELECT *
FROM (SELECT )


/*
5.- Ahora también mostraremos los valores del departamento que tenga la mayor media salarial.

*/