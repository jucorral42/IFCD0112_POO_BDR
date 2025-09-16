/*1. Selecionar los distintos puestos de trabajo con el alias puesto de aquellos empleados cuyo
 nombre tenga una letra O en cualquier parte o no sean el presidente, siempre que sean
  empleados del departamento 10*/
  SELECT DISTINCT JOB puesto
  FROM EMP 
  WHERE (ENAME LIKE '%O%' OR JOB <> 'PRESIDENT')
  AND DEPTNO = 10;

  -- SALIDA EN TERMINAL
 PUESTO
---------
CLERK
MANAGER



/*2. De los empleados que no tengan un salario mayor de 2000 muestra el nombre de aquelllos
 con comison nula, ordenandolos por el salirio menor primero*/

SELECT ENAME
FROM EMP
WHERE SAL <=2000 AND COMM IS NULL
ORDER BY SAL DESC;

-- SALIDA TERMINAL

ENAME
----------
MILLER
ADAMS
JAMES
SMITH

/*3. Tomando el alias DEpartamento, indica el nombre del departamento de quellos
departamentos que tengan algun empleado que sea Analyst o tengan comision real, siempre
 que esten en chicago Dallas. Ordena por el numero de departamento mayor primero.*/
 
 SELECT DNAME departamento
 FROM DEPT
 WHERE (DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'ANALYST') OR DEPTNO IN (SELECT DEPTNO FROM EMP WHERE COMM <> 0))
        AND LOC IN ('CHICAGO', 'DALLAS')
 ORDER BY DEPTNO;

 -- SALIDA TERMINAL

 DEPARTAMENTO
--------------
RESEARCH
SALES

/*4. Tomando los puestos de trabajo que no sean clerk, calcular la media salarial sin decimales y
 el maximo salario que existe en cada puesto laboral usando siempre alias de columnas y
  ordenando por la media obtenida mayor primero.*/

  SELECT ROUND(AVG(SAL),0) "MEDIA SALARIAL", MAX (SAL) "SALARIO MAXIMO"
  FROM EMP
  GROUP BY JOB
  HAVING JOB NOT IN ('CLERK')
  ORDER BY 1 DESC;

  -- SALIDA TERMINAL

MEDIA SALARIAL SALARIO MAXIMO
-------------- --------------
          5000           5000
          3000           3000
          2758           2975
          1400           1600


/*5. obtener exactamente la siguiente salida por pantalla, de los empleados subordinados del
jefe que no tiene jefe (los valores indicados en negrita provienen de campos o funciones)
    El empleado JONES tiene un salario de 4 digitos y cobra una comision de 0 euros
    El empleado BLAKE tiene un salario de 4 digitos y cobra una comision de 0 euros
    El empleado CLARK tiene un salario de 4 digitos y cobra una comision de 0 euros
*/

SELECT 'El empleado ' || UPPER(ENAME) || ' tiene un salario de ' || LENGTH(TO_CHAR ((SAL),'999'))|| '  digitos,  y cobra una comisión de ' || NVL(COMM,0) || ' euros' AS "FORMATO SOLICITADO"
FROM EMP
WHERE MGR IN (SELECT EMPNO FROM EMP WHERE JOB = 'PRESIDENT');

  -- SALIDA TERMINAL

FORMATO SOLICITADO
------------------------------------------------------------------------------------------------------------------------
El empleado JONES tiene un salario de 4  digitos,  y cobra una comisión de 0 euros
El empleado BLAKE tiene un salario de 4  digitos,  y cobra una comisión de 0 euros
El empleado CLARK tiene un salario de 4  digitos,  y cobra una comisión de 0 euros


/*6. Crear un bloque anonimo que permita calcular la media salarial por localidad pidiendo la
 localidad independientemente de como la escriba el usuario. Redondear sin decimales al entero inferior y monstrar los valores */

DECLARE 
    V_AVGSAL NUMBER;
BEGIN     
    SELECT FLOOR(AVG(SAL)) INTO V_AVGSAL
    FROM EMP,DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = UPPER('&INTRODUZCA_LOCALIDAD'))
    GROUP BY LOC;
    DBMS_OUTPUT.PUT_LINE('EL VALOR DE LA MEDIA SALARIAL ES '||V_AVGSAL|| ' EUROS');
END;
/

/*
7. Crear un bloque anonimo que almacene todos los campos de la tabla EMP de aquel
empleado con categoria 1 y nombre de departamento SALES. Despues mostraremos su
nombre y su salario
*/

DECLARE
    V_EMP EMP%ROWTYPE;

BEGIN 
 SELECT * INTO V_EMP
 FROM EMP
 WHERE JOB IN (SELECT JOB FROM OFICIO WHERE CATEGORIA = 1 ) AND DEPTNO IN ( SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
DBMS_OUTPUT.PUT_LINE('NOMBRE '||V_EMP.ENAME||', SALARIO '||V_EMP.SAL);
END;
/

  -- SALIDA TERMINAL
NOMBRE JAMES, SALARIO 950

/*
CREA UNA FUNCION MEDIA SIN PARAMETROS DE ENTRADA QUE CREE UN RECORD COMPUESTO
 DE LOS CAMPSO NOMBRE, SALARIO, COMISION, NOMBRE DE DPARTAMENTO Y FUNCIONES DE SUS
 RESPECTIVAS TABLAS. ALMACENAREMOS EN EL LOS DATOS DE LOS EMPLEADOS QUE TENGAN UNA
  CATEGORIA DE 1, 2 O 3 Y UN SALARIO COMPRENDIDO ENTRE 1000 Y 3000, SIEMPRE CONVIRTIENDO
  LAS COMISIONES NULAS A CERO. DESPUES MOSTRAREMOS LA SIGUIENTE SALIDA POR PANTALLA. (LOS VALORES INIDICADOS EN NEGRITA PROVIENEN DE CAMPOS O FUNCIONES)
            Total empleados:8

            Empleado: MILLER
            Empleado: FORD
            Empleado: ADAMS
            Empleado: SCOTT
            Empleado: TURNER
            Empleado: MARTIN
            Empleado: WARD
            Empleado: ALLEN

*/
DECLARE
    V_EMP EMP.ENAME%TYPE;

    TYPE REMP IS RECORD
    (NOMBRE EMP.ENAME%TYPE, SALARIO EMP.SAL%TYPE,
    COMISION EMP.COMM%TYPE);
    VEMP REMP;
    TYPE RDEPT IS RECORD
    ( NBDPTO DEPT.DNAME%TYPE);
    VDEPT RDEPT;
    TYPE ROFICIO IS RECORD
    (FUNCIONES OFICIO.FUNCIONES%TYPE);
    VOFICIO ROFICIO;
    TYPE RCONJUNTO IS RECORD
    (VEM
    P REMP ,VDEPT RDEPT ,VOFICIO ROFICIO );
    VCONJUNTO RCONJUNTO;

BEGIN

    SELECT ENAME  INTO V_EMP
    FROM EMP
    WHERE JOB IN ( SELECT JOB FROM OFICIO WHERE CATEGORIA NOT IN (1,2,3)) AND SAL > 3000;

    SELECT ENAME, SAL, NVL(COMM,0) INTO VEMP
    FROM EMP
    WHERE JOB IN ( SELECT JOB FROM OFICIO WHERE CATEGORIA NOT IN (1,2,3)) AND SAL > 3000;


    SELECT DNAME INTO VDEPT
    FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB IN (SELECT JOB FROM OFICIO WHERE CATEGORIA NOT IN (1,2,3)))
    AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >3000);

    SELECT FUNCIONES INTO VOFICIO
    FROM OFICIO 
    WHERE CATEGORIA NOT IN (1,2,3) 
    AND JOB IN (SELECT JOB FROM EMP WHERE SAL > 3000);

DBMS_OUTPUT.PUT_LINE ('EMPLEADO: '||V_EMP );
-- DBMS_OUTPUT.PUT_LINE('EMPLEADO: '|| VCONJUNTO.VEMP.NOMBRE);

END;
/
  -- SALIDA TERMINAL

  EMPLEADO: KING


  /* Soy consciente de que existe redundancia de codigo pero no he conseguido imprimir lo que hay dentro de la variable y no detecto el por que,
  la linea comentada seria la respuesta correcta*/






