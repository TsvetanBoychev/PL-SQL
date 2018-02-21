BEGIN
DBMS_OUTPUT.PUT_LINE(sysdate);
END;

SET SERVEROUTPUT ON
 
BEGIN
 Dbms_Output.Put_Line(Systimestamp);
END;

------------------------------------------------------------
DECLARE 
l_right_now VARCHAR2 (9); --Недостатъчна големина на променливата
BEGIN
l_right_now := SYSDATE;

DBMS_OUTPUT.PUT_LINE(l_right_now);
END;
-----------------------------------------------------------------

DECLARE 
l_right_now VARCHAR2 (9); --Недостатъчна големина на променливата
BEGIN
l_right_now := SYSDATE;

DBMS_OUTPUT.PUT_LINE(l_right_now);
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('Недостатъчна големина на променливата l_right_now!');

END;

--------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE STUDENT_1calc_totals
IS 

year_total NUMBER;
BEGIN
year_total :=0;

/*Начало на вложения блок*/

DECLARE
month_total NUMBER;
BEGIN

month_total := year_total /12;
END set_month_total;
/*Край на вложения блок*/
END;































