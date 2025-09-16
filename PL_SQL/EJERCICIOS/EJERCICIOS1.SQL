

/*
1) Escribir un bloque plsql que asigne el valor de vuestro nombre en una variable y escriba el texto MI
NOMBRE ES nombre.
*/

DECLARE 
    NOMBRE VARCHAR2(20):= '&INTRODUZCA_SU_NOMBRE';
BEGIN
    DBMS_OUTPUT.PUT_LINE('MI NOMBRE ES '||NOMBRE);
END;

/

/*
2) Introducir un bloque que cuente el número de filas que hay en la EMP, deposite el resultado en la variable
V_NUM y visualice su contenido con la salida: “El número de filas de la tabla EMP es de X filas”.
*/
DECLARE 
    V_NUM NUMBER;
BEGIN
    SELECT COUNT (*) INTO V_NUM
    FROM EMP;
    DBMS_OUTPUT.PUT_LINE('EL NUMERO DE FILAS DE LA TABLA EMP ES DE '||V_NUM|| ' FILAS');
END;

/*
3) Seleccionar un bloque que almacene el nombre y oficio del empleado con código 7844 y visualice
por pantalla ambos separados por un *.
*/
DECLARE 
    NOMBRE EMP.ENAME%TYPE;
    TRABAJO EMP.JOB%TYPE;
BEGIN
    SELECT ENAME, JOB INTO NOMBRE, TRABAJO
    FROM EMP
    WHERE EMPNO = 7844;

    DBMS_OUTPUT.PUT_LINE(NOMBRE||'*'||TRABAJO);
END;

/*
4) Seleccionar un bloque que almacene el nombre y oficio del empleado que tenga de jefe a un empleado
que no tenga jefe, además debe cumplir que su salario sea mayor o igual a la media salarial de cualquier
departamento, y también que nombre de departamento tenga EAR en cualquier parte. No usar combinación de
tablas. Visualizar por pantalla ambos valores separados por un *.
*/

DECLARE
	empl emp%rowtype;   -- empno,ename,job,mgr,hiredate,sal,comm,deptno ES UN OBJETO
	--EL ACCESO DE LECTURA SIEMPRE SE DEBE HACER CON OBJETO.CAMPO
	--Por ejemplo, EMPL.ENAME o EMPL.JOB o EMPL.SAL, etc.
BEGIN
	dbms_output.put_line('ANTES DE ASIGNARLO: '||empl.ename||'*'||empl.job);
	select * into empl
	from emp
	where mgr in (select empno from emp where mgr is null)
		and sal >= SOME (select round(avg(sal)) from emp group by deptno)
		and deptno in (select deptno from dept where dname like '%EAR%');
	dbms_output.put_line('DESPUES DE ASIGNARLO: '||empl.ename||'*'||empl.job);
END;
/



/*
5) Crear un bloque pl/sql que defina dos variables, v_ape del tipo varchar2(15) y v_oficio del tipo
varchar2(15). Asignar el nombre y oficio del empleado cuyo jefe no sea de las localidades de Dallas o
Chicago, siempre que su trabajo no sea Manager. No usar combinación de tablas. Visualizar el resultado
de ambas variables separadas por un asterisco.
*/
/
/*
6) Crear un bloque anónimo que me visualice la siguiente salida por pantalla, suponiendo que debe salir la
fecha del sistema del día en el que estemos,
*/


/*
7) Ejecutar un bloque que muestre el nombre, categoría laboral y nombre de departamento del empleado
pidiendo al usuario los valores del nombre departamento y de la categoría. Usar una vista interactiva en el From y
ejecutar el bloque con los valores de SALES y 1 para conseguir la siguiente salida por pantalla,
El empleado se llama: JAMES, su departamento es el SALES y su categoría laboral es la 1
*/
DECLARE
	NOMBRE EMP.ENAME%TYPE := '&INSERTE_NOMBRE';
	CATEG OFICIO.CATEGORIA%TYPE := &INSERTE_CATEGORIA;
	DEPAR DEPT.DNAME%TYPE := '&INSERTE_DEPARTAMENTO';
BEGIN
	SELECT ENAME,DNAME,CATEGORIA INTO NOMBRE, DEPAR, CATEG
	FROM EMP NATURAL JOIN DEPT NATURAL JOIN OFICIO
	WHERE ENAME=NOMBRE AND CATEGORIA =CATEG AND DNAME=DEPAR;
	--FROM EMP 
	--JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO
	--JOIN OFICIO ON EMP.JOB=OFICIO.JOB
	DBMS_OUTPUT.PUT_LINE(NOMBRE||'-'||CATEG||'-'||DEPAR);
END;
/
/*
8) Crear un bloque anónimo que declare una variable llamada v_empleados del tipo varchar2(15) que
inserte en la tabla empleados (Crearla idéntica a la EMP) solamente los valores en el orden: empleado López, salario
5000, inicio 23/02/1987, oficio Clerk departamento 40 y comisión cero. Luego poner comisión 1000 a los que
tengan cero, y comisión 1 a los que sea nula. Validar los datos. Asignar el nombre del empleado que sea del
departamento 40 a la variable y visualizarlo por pantalla.
*/

DECLARE
	V_EMPLEADOS VARCHAR2(15);
BEGIN
	INSERT INTO EMPLE (ENAME, SAL, HIREDATE, JOB, DEPTNO, COMM ) 
	VAULES('LOPEZ', 5000, '23-2-87', 'CLERK', 40,0);
	UPDATE EMPLE SET COMM =1000 WHERE COM = 0;
	UPDATE EMPLE SET COMM = 1 WHERE COMM IS NULL;
	COMMIT;
	SELECT ENAME INTO V_EMPLEADOS
	FROM EMPLE WHERE DEPTNO =40;
	
	DBMS_OUTPUT.OUT_LINE(V_EMPLEADOS);

END;
/

/*
9) Crear un bloque que declare las variables: v_sal, v_nom, v_comm, v_dept y v_job del mismo tipo que
sus respectivos campos de la tabla empleados. Utilizar una variable de sustitución que nos pida el nombre del
departamento e insertar los valores correspondientes en todas las variables del departamento OPERATIONS.
Usar la tabla Dept. Visualizar por pantalla el resultado de todas las variables separadas por una coma.
*/
DECLARE
v_sal emple.sal%TYPE;
v_nom emple.ename%TYPE;
v_comm emple.comm%TYPE;
v_dept emple.deptno%TYPE;
v_job emple.job%TYPE;
BEGIN
Select sal,ename,comm,deptno,job into v_sal,v_nom,v_comm,v_dept,v_job
from emple
where deptno in (select deptno from depto where dname = &departamento);
UPDATE emple SET sal = v_sal WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );
UPDATE emple SET nom = v_nom WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );
UPDATE emple SET comm = v_comm WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );
UPDATE emple SET dept = v_dept WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );
UPDATE emple SET job = v_job WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );
UPDATE emple SET sal = v_sal WHERE deptno In (select deptno from depto where dname = 'OPERATIONS' );

DBMS_OUTPUT.OUT_LINE(V_sal ||' , '||v_nom||' , '||v_comm||' , '||v_dept||' , '||v_job);







/*
10) Crear un bloque con tres variables llamadas v_emp, v_dept y v_oficio que sean variables de registro
de sus respectivas tablas e insertar en cada una de ellas, respectivamente, todas las columnas del empleado que
gane el máximo salario (emp), el departamento del empleado con mayor salario (dept), el valor menor de la
categoría (oficio). Mostrar de la v_emp el nombre y el salario, de la v_dept el dname y la localidad, y de la
v_oficio el trabajo y la función. Después convertir el ejercicio con solamente variables %TYPE.
*/
