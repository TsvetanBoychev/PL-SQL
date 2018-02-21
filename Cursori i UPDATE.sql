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
EXIT WHEN CLIENTS_cursor%NOTFOUND /*OR CLIENTS_cursor%ROWCOUNT >59*/;
DBMS_OUTPUT.PUT_LINE(PARVO_IME || ' '||VTORO_IME|| ' '||PARVO_IME2|| ' '||VTORO_IME2);
END LOOP;
END;

------------------------------------------------------------------------------------------------

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
--SELECT TRANSLATE('Buenos', 'Buenos', 'Меричлери') FROM IMPORT_FROM_EXCEL_CECO;
EXIT WHEN CLIENTS_cursor%NOTFOUND /*OR CLIENTS_cursor%ROWCOUNT >59*/;
DBMS_OUTPUT.PUT_LINE(PARVO_IME || ' '||VTORO_IME|| ' '||PARVO_IME2|| ' '||VTORO_IME2);
END LOOP;
CLOSE CLIENTS_cursor;
END;
   

SELECT * FROM IMPORT_FROM_EXCEL_CECO;

----------------------------------------------------------------------------------------
SET SERVEROUTPUT ON
DECLARE
  v_name   VARCHAR2(46);
  v_salary NUMBER;
  v_date   DATE;
  CURSOR c1 is  
      SELECT first_name || ' ' || last_name,
             salary, hire_date  
      FROM employees
      ORDER BY last_name, first_name;
BEGIN
  
  OPEN c1;
  LOOP
    FETCH c1 INTO v_name, v_salary, v_date;
    EXIT WHEN c1%NOTFOUND;
    dbms_output.put_line(v_name || ' was hired ' ||
                         to_char(v_date, 'mm/dd/yyyy') ||
                         ' and will be paid ' ||
                         trim(to_char(v_salary, '$999,999.00')) ||
                         '.');
  END LOOP;
  close c1;
END;




SELECT * FROM employees;
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
SELECT * FROM IMPORT_FROM_EXCEL_CECO;

DECLARE
v_Country VARCHAR2(30);
v_Date_Import DATE;
v_LASTNAME2 VARCHAR2(35);

CURSOR CECO_1 IS
SELECT COUNTRY || ' ' || DATE_IMPORT || ' '|| LASTNAME2 
       FROM IMPORT_FROM_EXCEL_CECO
       ORDER BY LASTNAME2, DATE_IMPORT DESC;
BEGIN
OPEN CECO_1;
LOOP
 FETCH CECO_1 INTO v_Country, v_Date_Import, v_LASTNAME2;
EXIT WHEN CECO_1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('THE COUNTRY IS' || v_Country || 'AND THE PERSON IS HIRED ON'||v_Date_Import || '-'|| v_LASTNAME2);
END LOOP;
CLOSE CECO_1;
END;


-----------------------------------------------------------------------------------------------------

begin

 FOR c IN (select department_name
           from departments 
           order by department_name)
 LOOP
        dbms_output.put_line(c.department_name);
 END LOOP;

end;

SELECT * FROM DEPARTMENTS;

-----------------------------------------------------------------------------------------------------------------

declare
  v_first_name varchar2(5); 
  v_last_name  varchar2(100);
begin
  select first_name, last_name
  into v_first_name, v_last_name
  from employees
  where employee_id = 100;
  dbms_output.put_line(v_first_name || ' ' || v_last_name);
end;






declare
  v_first_name employees.first_name%type;
  v_last_name  employees.last_name%type;
begin
  select first_name, last_name
  into v_first_name, v_last_name
  from employees
  where employee_id = 200;
  dbms_output.put_line(v_first_name || ' ' || v_last_name);
end;


--------------------------------------------------------------------------------------------------------

declare
  v_first_name employees.first_name%type;
  v_last_name  employees.last_name%type;
begin

  select first_name, last_name
  into v_first_name, v_last_name
  from employees
  where employee_id = 100;
  dbms_output.put_line('#1 select into %rowcount=' || SQL%rowcount);
  dbms_output.put_line(v_first_name ||' ' || v_last_name);

  -- a dml statement and its attributes
  update employees
  set salary = salary * 1.1;
  dbms_output.put_line('Just updated ' ||
                       sql%rowcount ||
                       ' salaries.');

  rollback;  -- this is a dml statement that does NOT have 
             -- any implicit cursors associated with it.
  
  -- another valid employee id would be 101
  -- but let's use an invalid one to throw an error
  select first_name, last_name
  into v_first_name, v_last_name
  from employees
  where employee_id = 200;
  
  -- An error was thrown so we never get here.
  dbms_output.put_line('#2 select into %rowcount=' || SQL%rowcount);  

exception
 when NO_DATA_FOUND then
  dbms_output.put_line('Oops. Is the employee id valid?');
  dbms_output.put_line('No data found. NOTE: %rowcount=' || SQL%rowcount);
 when TOO_MANY_ROWS then
  dbms_output.put_line('Oops. Are you using a PK value?');
  dbms_output.put_line('Too many rows. NOTE: %rowcount=' || SQL%rowcount);  
end;

------------------------------------------------------------------------------------------------------

DECLARE
  v_name        VARCHAR2(46);
  v_salary      employees.salary%type;
  v_date        employees.hire_date%type;
  v_min_empid   employees.employee_id%type;
  v_max_empid   employees.employee_id%type;
BEGIN

  SELECT min(employee_id), max(employee_id)
  INTO v_min_empid, v_max_empid
  FROM employees;
  
  -- The only problem with this solution is
  -- if the employee_id values in the range
  -- are missing.
  -- We'll see how to control that issue in
  -- the next chapter.
  -- Or we can use a completely different
  -- solution which we'll see in the next
  -- section of this chapter.
  FOR i IN v_min_empid..v_max_empid LOOP
  
    SELECT first_name || ' ' || last_name,
            salary, hire_date  
    INTO v_name, v_salary, v_date
    FROM employees 
    WHERE EMPLOYEE_ID = i;
  
    dbms_output.put_line(v_name || ' was hired ' ||
                         to_char(v_date, 'mm/dd/yyyy') ||
                         ' and will be paid ' ||
                         trim(to_char(v_salary, '$999,999.00')) ||
                         '.');
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Unexpected error # ' ||
                         sqlcode);
END;




















