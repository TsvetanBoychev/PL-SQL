DECLARE
ceco_c IMPORT_FROM_EXCEL_CECO%ROWTYPE;
rec_city IMPORT_FROM_EXCEL_CECO.CITY%TYPE;
CURSOR cur_CECO ( init_city VARCHAR2)
   IS
    SELECT * FROM IMPORT_FROM_EXCEL_CECO WHERE IMPORT_FROM_EXCEL_CECO.CITY = init_city;
   -- ceco_c cur_CECO%rowtype;
    
BEGIN

OPEN cur_CECO('Rio de Janeiro');
    LOOP
FETCH cur_CECO INTO ceco_c;
EXIT WHEN cur_CECO%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(ceco_c.city);
END LOOP;
CLOSE cur_CECO;

OPEN cur_CECO('Sao Paulo');
    LOOP
FETCH cur_CECO INTO ceco_c;
EXIT WHEN cur_CECO%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(ceco_c.city);
END LOOP;
CLOSE cur_CECO;
END;





--------------------------------------------
DECLARE
  v_customer_name customers.FIRST_NAME%TYPE;
BEGIN
  SELECT
    FIRST_NAME
  INTO
    v_customer_name
  FROM
    customers
  WHERE
    customer_id = 8000;
 
  DBMS_OUTPUT.PUT_LINE( v_customer_name );
END;

SELECT * FROM CUSTOMERS;


----------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pkg_param_cur

IS

  CURSOR cur(ip_ntt_first_name type_ntt)

    RETURN employees%rowtype

  IS

    SELECT

      *

    FROM

      employees

    WHERE

      EXISTS

      (

        SELECT

          1

        FROM

          TABLE(ip_ntt_first_name)

        WHERE

          column_value=first_name

      )

      order by first_name;

  PROCEDURE proc_param_cur(

      ip_ntt_emp_name type_ntt)

  IS

    l_rt_emp employees%rowtype;

  BEGIN

    OPEN cur(ip_ntt_emp_name);

    LOOP

      FETCH cur INTO l_rt_emp;

      EXIT

    WHEN cur%notfound;

      dbms_output.put_line('Employee ID: '||l_rt_emp.employee_id||

      '. Employee Name: '||l_rt_emp.last_name||', '||l_rt_emp.first_name);

    END LOOP;

  END;

END;

SET SERVEROUTPUT ON


