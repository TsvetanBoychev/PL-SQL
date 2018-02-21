

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT * FROM IMPORT_FROM_EXCEL_CECO;
SELECT * FROM DEPARTMENTS;
-------------------------------------------------
DECLARE
  l_last_name  employees.last_name%TYPE;
BEGIN
  SELECT last_name
    INTO l_last_name
    FROM employees
   WHERE employee_id = 138;

  DBMS_OUTPUT.put_line (
     l_last_name);
END; 


------------------------------

DECLARE
   l_employee   employees%ROWTYPE;
BEGIN
   SELECT *
     INTO l_employee
     FROM employees
    WHERE employee_id = 138;

   DBMS_OUTPUT.put_line (
      l_employee.last_name);
END;

---------------------------------------

DECLARE
  l_last_name         
     employees.last_name%TYPE;
  l_department_name   
     departments.department_name%TYPE;
BEGIN
  SELECT last_name, department_name
    INTO l_last_name, l_department_name
    FROM employees e, departments d
   WHERE e.department_id=d.department_id
         AND e.employee_id=138;

  DBMS_OUTPUT.put_line (
     l_last_name || 
     ' in ' || 
     l_department_name);
END;


-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE assign_bonus ( employee_id_in IN employees.employee_id%TYPE, bonus_pool_io  IN OUT INTEGER)
--end;
IS
----------------------------------------------------------


      l_total integer := 10000;
 
      CURSOR employee_id_cur
      IS
           SELECT employee_id
             FROM employees
         ORDER BY salary ASC;
 
     l_employee_id   employee_id_cur%ROWTYPE;
     
     
    BEGIN
         OPEN employee_id_cur;
    
         LOOP
            FETCH employee_id_cur INTO l_employee_id;
            EXIT WHEN employee_id_cur%NOTFOUND;
    
            assign_bonus (l_employee_id, l_total);
            EXIT WHEN l_total <= 0;
         END LOOP;
    
         CLOSE employees_cur; 
    END; 

-----------------------------------------------------------------

DECLARE
   CURSOR employees_in_10_cur
   IS
      SELECT *
        FROM employees
       WHERE department_id = 10;
BEGIN
   FOR employee_rec 
   IN employees_in_10_cur
   LOOP
      DBMS_OUTPUT.put_line (
         employee_rec.last_name);
   END LOOP;
END;

--------

SELECT * FROM employees;


-----
DECLARE 
   CURSOR CLIENTS_cursor IS
   SELECT FIRSTNAME1, FIRSTNAME2, LASTNAME1,LASTNAME2 FROM IMPORT_FROM_EXCEL_CECO ;
   PARVO_IME IMPORT_FROM_EXCEL_CECO.FIRSTNAME1%TYPE;
   PARVO_IME2 IMPORT_FROM_EXCEL_CECO.FIRSTNAME2%TYPE;
   VTORO_IME IMPORT_FROM_EXCEL_CECO.LASTNAME1%TYPE;
   VTORO_IME2 IMPORT_FROM_EXCEL_CECO.LASTNAME2%TYPE;
BEGIN

OPEN CLIENTS_cursor;
LOOP
FETCH CLIENTS_cursor INTO PARVO_IME,PARVO_IME2,VTORO_IME,VTORO_IME2;
UPDATE  IMPORT_FROM_EXCEL_CECO SET FIRSTNAME2 = 'JEFRY' WHERE COUNTRY = 'Argentina';
EXIT WHEN CLIENTS_cursor%NOTFOUND /*OR CLIENTS_cursor%ROWCOUNT >59*/;
DBMS_OUTPUT.PUT_LINE(PARVO_IME || ' '||VTORO_IME|| ' '||PARVO_IME2|| ' '||VTORO_IME2);
END LOOP;
CLOSE CLIENTS_cursor;
END;
   





