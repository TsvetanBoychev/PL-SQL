SET SERVEROUTPUT ON 
Declare
 shp INTEGER;
 
 begin
  select EMPLOYEE_ID into shp from employees where EMPLOYEE_ID = 104;
DBMS_OUTPUT.put_line ( shp);
 end;
 
 -------------------
 
 select * from IMPORT_FROM_EXCEL_CECO;