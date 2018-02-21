
���������,

�������� ��� ������� �� PL/SQL � ���� �� ��� �� �� ������, �� ������ �� ����� ���������,

�� �� �� �������� ��������� �����������.

-- 
Rumyana Georgieva

DATAMAX JSC,
Banking Software department

BULGARIA,
SOFIA 1000,
16 IVAN VAZOV str.
tel : +359 2 9210860/462
GSM : +359 889 154 455
http://www.datamax.bg


PL_SQL_myBook

#PL/SQL - Procedural Language/SQL

##������� �������
����� ������ ���������� ����������� �� SQL, �� � ��������� 
���� �� �������� � ������ �����, ��� ��������� �� ������

+---------------+-----------------------------------+
| ������        | ����                              |
+---------------+-----------------------------------+
| Oracle        | PL/SQL                            |
+---------------+-----------------------------------+
| MS SQL Server | TransactSQL (T-SQL)               |
+---------------+-----------------------------------+
| Sybase        | WatcomSQL                         |
|               | TransactSQL                       |
+---------------+-----------------------------------+
| PostgreSQL    | PL/pgSQL,PL/Tcl,PL/Python,PL/Perl |
+---------------+-----------------------------------+
| MySQL         | ��� ���                           |
+---------------+-----------------------------------+
| Interbase     | ��� ���                           |
+---------------+-----------------------------------+


    * ���������  - ������� ������� ���� ��� ��������
    * ������� -> SELECT ������, �� ����� ����� �� �����(��� ����������) ��� �� ���
    * ��������� � ������� ->���� ������ � ������ ����� ��� � PL/SQL ����
    * �������
    * ������
    * ������ - ������������� ���������� ������ �����

����������� �� ������ �������� � �� ���� ������� �� ����� �� �� ��������� � SQL Statment

��������� ������ �������� � �� ������ �� ���������� � SQL Statement �� ����������� �� ����

��������� - �������� �� ��� Insert, Update, Delete �� ����� �� ������� � ��� ����������� 
������� �� ������������ �������� ������, �� ��������� ������ �� ������� � �����.

�������� - � ������ ��������� ���������� ���������, �������, ������ 
����� ������������� � DBA trigers(�������� �� �������� ����)

�������� - ������ ���� ����������� �� �������� � SQL, �� ��� � ����������, 
����� �� ���� �� PL/SQL � �� ����� �� � ���������� �� ������ �� ������ �����


##��������� �� PL/SQL

    * ��������� ������� � ������������� ��������

+-------------+-----------------------------------+
| ```[...]``` | �������������� �������            |
+-------------+-----------------------------------+
| ```a|b```   | ��� � ��� b, �� �� � ����� ������ |
+-------------+-----------------------------------+
    
    * PL/SQL Block
    ���� � ��������� ���������� ������� �� script,procedure, function

-----------------------sql
[DECLARE]
		--���������� �� ����������, ���������, ������ �����,�������, ���������, ������� � �.�.
BEGIN
		--PL/SQL code
[EXCEPTION]
		--��������� �� ����������	
END;
------------------------

    * �� �� ������� ��������� �� ������������ �� �����������
  
    View->DBMS Output-> + � ��������� ������

---------------------sql
BEGIN
  NULL;
END;
-----------------------
BEGIN
  dbms_output.put_line('Hello PL/SQL');
END;
-----------------------
SET SERVEROUTPUT ON 


##�������� �� �����

##����������
��������� �� �� �������� ���������� �� ��������� ��� ��������� �� script

�����������
��� ���[:=��������];

�������� �����: Scalar, Composite, Reference, LOB(large Object)
Scalar = INTEGER,VARCHAR2, NUMBER, Data, Boolean (������, ������ � �� �������� �� �������� � ���������)
Composite - ��������� ������� ������ ���� ����� (���� �� � ��� ����� �� ��������� , ���� �� �� �������� � ��������� ������)

���������� � ��������������, �� ��� �� �� ������ �� ������ ������������ � 
� ������������ �� ������� � ���� ���������� �� ��������� ���� ����� ������, 
����� ������� ����� ��������� ��������
!!! �� script � ���� �� ����� Substitution variables: emp_id:=&employee_if;  

+----------+-----------------------------------------------------------+
| ���      | ������� �������������                                     |
|          | (1) �� ������� a-z,A-Z                                    |
|          | (2) ���� �� ������� a-z, A-Z, _ , 0-9                     |
|          | (3) ����������� LastName                                  |
+----------+-----------------------------------------------------------+
| ���      | ��� �� �������, ���� �� ����������� �� ���� �� ���������, |
|          | �� ���  � ���������� �� PL/SQL ������ (Boolean)           |
+----------+-----------------------------------------------------------+
| :=       | �������� �� ����������� !!!! (= � �� ���������)           |
+----------+-----------------------------------------------------------+
| �������� | ������������ �������� �� ������������                     |
+----------+-----------------------------------------------------------+

SELECT * from employees;

--------------------sql
DECLARE
  l_name  VARCHAR2(25):='none';
  f_name  VARCHAR2(20):='none';
  emp_id  NUMBER := 102;
BEGIN
  SELECT first_name, last_name
  INTO   f_name, l_name
  FROM employees
  WHERE employee_id = emp_id;
  
  dbms_output.put_line( emp_id || ' ' || f_name || ' ' || l_name);
END;
------------------------
     * ������ ��� ```SELECT ... INTO ...```

--------------------sql-- �� ����� ��������
DECLARE
  l_name  VARCHAR2(25):='none';
  f_name  VARCHAR2(20):='none';
  emp_id  NUMBER := 10;
BEGIN
  SELECT first_name, last_name
  INTO   f_name, l_name
  FROM employees
  WHERE employee_id = emp_id;
  
  dbms_output.put_line( emp_id || ' ' || f_name || ' ' || l_name);
END;
--------------------------

-------------------sql-- ����� ������ �� 1 ���
DECLARE
  l_name  VARCHAR2(25):='none';
  f_name  VARCHAR2(20):='none';
  emp_id  NUMBER := 100;
BEGIN
  SELECT first_name, last_name
  INTO   f_name, l_name
  FROM employees
  WHERE employee_id > emp_id;
  
  dbms_output.put_line( emp_id || ' ' || f_name || ' ' || l_name);
END;
```

     * ��������� �� ����������

+-----------------------------------------------------------------------------+
| ���������� �� ������ ������������ �� ������� �� �������� �������� �� ������ |
| ������ ������� (���� �����, ������� �� �� ���������� ��� � �.�.)            |
+-----------------------------------------------------------------------------+


------------------------sql
DECLARE
  l_name  VARCHAR2(25):='none';
  f_name  VARCHAR2(20):='none';
  emp_id  NUMBER := 1008888;
BEGIN
  SELECT first_name, last_name
  INTO   f_name, l_name
  FROM employees
  WHERE employee_id = emp_id;
  
  dbms_output.put_line( emp_id || ' ' || f_name || ' ' || l_name);
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
---------------------------





##��������� ������ �� ���������� 

+--------------------------------+-----------------------------------------------+
| ���������� �������.������%TYPE | e��� �������� �� ���� �� �������� � ��������� |
+--------------------------------+-----------------------------------------------+
| ���������� �������%ROWTYPE     | ��� ��� �� ���������                          |  Composite
+--------------------------------+-----------------------------------------------+
| ��������� ���                  | ������ ������, �� �� ������ �� ���������      |  Composite
+--------------------------------+-----------------------------------------------+


----------------------sql--���������� � ��� ���� ���� �� ����
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  emp_id  employees.employee_id%TYPE := 1001;
BEGIN
  SELECT first_name, last_name
  INTO   f_name, l_name
  FROM employees
  WHERE employee_id = emp_id;
  
  dbms_output.put_line( emp_id || ' ' || f_name || ' ' || l_name);
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
--------------------------

------------------------sql--���������� � ���� composite-����� ����� ����� �� ���������
DECLARE
  emp_row employees%ROWTYPE;
  emp_id  employees.employee_id%TYPE := 100;
BEGIN
  SELECT *
  INTO   emp_row
  FROM employees
  WHERE employee_id = emp_id;
  
  dbms_output.put_line( emp_id             || ' ' || 
                        emp_row.first_name || ' ' || 
                        emp_row.last_name  || ' ' ||
                        emp_row.salary);
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
------------------------



##��������� �� ��������� ������

---------------------sql --��������� �� �������� ���
--1. ��������� �� ����
TYPE �����-��� .....;

--2. ���������� �� ���������� �� ������� ���
���������� ���-��-���;
-----------------------------

###����� ( Type Record )

------------------------sql-- ����������� �� �������� type RECORD
TYPE ���-��-��� IS RECORD (
  ����1 ���1,
  ����2 ���2,
  ...
  ����N ���N       
-------------------------



-------------------------sql--���������� �� �������� ��� RECORD
DECLARE
-- 1. ��������� �� ����
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

--2. ���������� �� ����������
  emp_rec EmployeeRecord;
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    dbms_output.put_line('Defaults:'||emp_rec.f_name || ' ' || emp_rec.l_name);
    -- 1. ����� �� ��������
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '||num_rows || ' row(s)');
    FOR counter IN REVERSE 1..num_rows
    LOOP
      SELECT  employee_id, first_name,  last_name, salary
      INTO   emp_rec
      FROM (
        SELECT   rn,employee_id, first_name, last_name, salary
        FROM employees
        WHERE salary BETWEEN 5000 AND 7000
        --ORDER BY salary ASC
      ) vt
      WHERE rn = counter;
      dbms_output.put_line( RPAD(emp_rec.f_name || ' ' || emp_rec.l_name , 20) || ' ' || 
                               emp_rec.e_salary || '(' || emp_rec.emp_id || ')' );
    END LOOP;
    
    EXCEPTION
      WHEN no_data_found THEN
          dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Unknown exception!');
END;
------------------------------------------------------------
###������� (Type Table)

------------------------------------sql--����������� �� �������� type Table
TYPE ���-��-��� IS TABLE OF ����-���;
------------------------------------------------

------------------------------sql--���������� �� �������� type Table 
--1. ���������  3 ��������
TYPE NUMBERS IS TABLE OF NUMBER;

TYPE EMPIDS_TABLE IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE;

TYPE EMPS_TABLE IS TABLE OF EMPLOYEES%ROWTYPE;

--2. ����������
IDS_TAB  EMPIDS_TABLE;
   
EMPS_TAB  EMPS_TABL;

Ns   NUMBERS;   
------------------------------------------------

----------------------------sql--���������� �� �������� ��� Table �������� �� �������� ��� Records
DECLARE
-- 1. ��������� �� ����
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. ���������� �� ����������
  emp_rec EmployeeRecord;
  emp_table EmployeesTable;
  
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
        
    SELECT employee_id, first_name, last_name, salary
    BULK COLLECT INTO emp_table
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000
    ORDER BY salary ASC;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '|| emp_table.COUNT || ' row(s)');
    FOR idx IN  emp_table.FIRST..emp_table.LAST
    LOOP
      dbms_output.put_line( RPAD(emp_table(idx).f_name || ' ' || emp_table(idx).l_name , 20) || ' ' || 
                                 emp_table(idx).e_salary || '(' || emp_table(idx).emp_id || ')' );
    END LOOP;
    
    EXCEPTION
      WHEN no_data_found THEN
          dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Unknown exception!');
END;
----------------------------------------------------------------------------

----------------------------------------------------sql--���������� �� �������� ��� Table, �������� �� �������� ��� Records (�������� ���� �������!!!)
DECLARE
-- 1. ��������� �� ����
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. ���������� �� ����������
  emp_rec EmployeeRecord;
  emp_table EmployeesTable;
  
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
        
    SELECT employee_id, first_name, last_name, salary
    BULK COLLECT INTO emp_table
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000
    ORDER BY salary ASC;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '|| emp_table.COUNT || ' row(s) ' ||
                         '[ first:'|| emp_table.FIRST || ', last:'|| emp_table.LAST || ']');
    IF emp_table.COUNT > 0 THEN
        FOR idx IN  emp_table.FIRST..emp_table.LAST
        LOOP
          dbms_output.put_line( RPAD(emp_table(idx).f_name || ' ' || emp_table(idx).l_name , 20) || ' ' || 
                                     emp_table(idx).e_salary || '(' || emp_table(idx).emp_id || ')' );
        END LOOP;
    END IF;
    
    EXCEPTION
      WHEN no_data_found THEN
          dbms_output.put_line('Record not found! ');
      --WHEN others THEN
      --    dbms_output.put_line('Unknown exception!');
END;
-------------------------------------------

---------------------------------sql-- ���������� ��  �������� ��� Table, �������� �� �������� ��� Records (�������� ���� �������!!!)�� ���� ��������
DECLARE
-- 1. ��������� �� ����
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. ���������� �� ����������
  emp_rec EmployeeRecord;
  emp_table EmployeesTable;
  
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
        
    SELECT employee_id, first_name, last_name, salary
    BULK COLLECT INTO emp_table
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000
    ORDER BY salary ASC;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '|| emp_table.COUNT || ' row(s) ' ||
                         '[ first:'|| emp_table.FIRST || ', last:'|| emp_table.LAST || ']');
    IF emp_table.COUNT > 0 THEN
        FOR idx IN  emp_table.FIRST..emp_table.LAST
        LOOP
          dbms_output.put_line( RPAD(emp_table(idx).f_name || ' ' || emp_table(idx).l_name , 20) || ' ' || 
                                     emp_table(idx).e_salary || '(' || emp_table(idx).emp_id || ')' );
        END LOOP;
    END IF;
    
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;



























##��������� ���������
	   
###������� ����������
	   
      * IF

----------------------sql--���������� �� If
IF  ������� THEN
	�����1;
	�����2;
END IF;
```

```sql
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  emp_id  employees.employee_id%TYPE := 105;
BEGIN
  SELECT first_name, last_name, salary
  INTO   f_name, l_name, e_salary
  FROM employees
  WHERE employee_id = emp_id;
  
  IF e_salary < 10000 THEN
    dbms_output.put_line( emp_id  || ' ' ||
                          f_name  || ' ' || 
                          l_name  || ' ' ||
                          e_salary|| ' ' || ' bonus:' || e_salary * 0.1 );
  END IF; 
  
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
-----------------------------------------

---------------------------------------sql
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  emp_id  employees.employee_id%TYPE := 105;
BEGIN
  emp_id := &employee_id;
  
  SELECT first_name, last_name, salary
  INTO   f_name, l_name, e_salary
  FROM employees
  WHERE employee_id = emp_id;
  
  IF e_salary < 10000 THEN
    dbms_output.put_line( emp_id  || ' ' ||
                          f_name  || ' ' || 
                          l_name  || ' ' ||
                          e_salary|| ' ' || ' bonus:' || e_salary * 0.1 );
  END IF; 
  
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
-------------------------------------------------


    * ```IF ... ELSE ...```


------------------------------`sql--������������� if else
IF ������� THEN
	�����1;
	�����2;
ELSE
	�����3;
	�����4;
END IF;
------------------------------
-----------------------------sql--���������� �� if else
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  emp_id  employees.employee_id%TYPE := 105;
BEGIN
  emp_id := &employee_id;
  
  SELECT first_name, last_name, salary
  INTO   f_name, l_name, e_salary
  FROM employees
  WHERE employee_id = emp_id;
  
  IF e_salary < 10000 THEN
    dbms_output.put_line( emp_id  || ' ' ||
                          f_name  || ' ' || 
                          l_name  || ' ' ||
                          e_salary|| ' ' || ' bonus:' || e_salary * 0.1 );
  ELSE
    dbms_output.put_line(emp_id  || ' ' || 
                         l_name  || ' ' ||
                         e_salary || ' bonus:'|| e_salary * 0.05 );
  END IF; 
  
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
--------------------------------------

    * ```IF ... ELSIF ... ELSE```

-----------------------------------sql--������������� if elsif else
IF �������1 THEN
   �����1;
   �����2;
ELSIF �������2 THEN
   �����3;
   �����4;
ELSE
   �����5;
   �����6;
END IF;
-------------------------------------

-------------------------------sql--���������� �� if elsif else
-- ���� �� ����� � = 5 ?
--��������� ������
	IF A > 0 THEN
		�����1;
	ELSIF A = 5 THEN
		dbms_output.put_line('A = 5'); 
	END IF; 
------------------------------
-----------------------------sql--���������� �� if elsif else 
--OK!!
	IF A = 5 THEN
		�����2;
	ELSIF A > 0 THEN
		�����1;
	END IF; 
-----------------------------

    * CASE

----------------------------sql-- ������������� CASE
			CASE �����
				WHEN ��������1 THEN �����1;
				WHEN ��������2 THEN �����2;
				WHEN ��������3 THEN �����3;
				...				
				ELSE
					�����N;
			END CASE;

-------------------------
			CASE 
				WHEN �������1 THEN �����1;
				WHEN �������2 THEN �����2;
				WHEN �������3 THEN �����3;
				...
				ELSE
					�����N;
			END CASE;
```

##����������� �� �������� ���������� 
  
--------------------------sql--����������� LOOP
  LOOP
   PL/SQL code
  END LOOP;
-------------------------

������ �� �����:

  * ```EXIT WHEN �������;```

  * ��� ��-������ ��������

----------------------sql--EXIT � IF
IF ������� THEN
    ...
    ...
    EXIT;
END IF;
-----------------------------

----------------------------sql--���������� �� LOOP
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  emp_id  employees.employee_id%TYPE := 105;
  counter NUMBER := 0;
BEGIN
  emp_id := &employee_id;
  
  LOOP
    
    SELECT first_name, last_name, salary
    INTO f_name, l_name, e_salary
    FROM employees
    WHERE employee_id = emp_id + counter;
    dbms_output.put_line(emp_id + counter || ' ' || 
                                   l_name || ' ' || 
                                   f_name || ' ' || 
                                   e_salary );
    EXIT WHEN counter >= 10;
    counter := counter + 1;
    
  END LOOP;
  
  EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
    WHEN others THEN
        dbms_output.put_line('Unknown exception!');
END;
----------------------------------

    * ```GOTO label```

------------------------sql--������������� GOTO label
BEGIN
 ...
 DECLARE 
 	x NUMBER;
 BEGIN
  ...
  <<label>>
  BEGIN
   x :=1; -- ��!
   ...
   xxx     -- ��� �������� ���������� 
   ...
  EXCEPTION
     ...   -- ��������� �� ������������
     GOTO label; --������ ��� ������� label
  END;
  ...
    EXCEPTION
     ...
 END;
 x:=2; --������ (x e ����������� � ��-�������� ����)
 ...
END;
```

---------------------sql--���������� substitution variables (���� �� ������)
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  emp_id  employees.employee_id%TYPE := 105;
  counter NUMBER := 0;
BEGIN
  emp_id := &employee_id;
  <<emp_loop>>
  BEGIN
      LOOP  
        SELECT first_name, last_name, salary
        INTO f_name, l_name, e_salary
        FROM employees
        WHERE employee_id = emp_id + counter;
        dbms_output.put_line(emp_id + counter || ' ' || 
                                       l_name || ' ' || 
                                       f_name || ' ' || 
                                       e_salary );
        EXIT WHEN counter >= 10;
        counter := counter + 1;
      END LOOP;
      
      EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('Employee ID:' || emp_id || ' ' || ' not found! ');
            emp_id := emp_id + 1;
            GOTO emp_loop;
      END;
      
      EXCEPTION
        WHEN others THEN
            dbms_output.put_line('Unknown exception!');
END;
--------------------------------------------------




    * FOR

-----------------------sql-- ����������� FOR..LOOP
FOR ����� IN ���_��������..������_��������
   LOOP
    PL/SQL code
   END LOOP;
---------------------------------

    1. ������� �� ������ �� � ������������� ����������� ����������
    2. �� ������ �� �� ������ ������� ��������
    3. ������ ���_�������� < ������_��������
    4. �������� � ������ 1

---------------------------sql--����������� for � REVERSE
   FOR ����� IN REVERSE ���_��������..������_��������
   LOOP
    PL/SQL code
   END LOOP;
----------------------------

--------------------------sql--���������� �� FOR..LOOP
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  e_jobid employees.job_id%TYPE :='';
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    -- 1. ����� �� ��������
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '||num_rows || ' row(s)');
    FOR counter IN 1..num_rows
    LOOP
      SELECT first_name, last_name, salary, job_id
      INTO   f_name, l_name, e_salary, e_jobid
      FROM (
        SELECT ROWNUM rn,first_name, last_name, salary, job_id
        FROM employees
        WHERE salary BETWEEN 5000 AND 7000
        --ORDER BY salary ASC
      ) vt
      WHERE rn = counter;
      
      dbms_output.put_line(RPAD(f_name || ' ' || l_name , 20,' ')|| ' ' || e_salary || ' ' || e_jobid );
    END LOOP;
    
    EXCEPTION
      WHEN no_data_found THEN
          dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Unknown exception!');
END;
-------------------------------------------

-------------------------------------------sql -- ���������� FOR..LOOP � REVERSE
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  e_jobid employees.job_id%TYPE :='';
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    -- 1. ����� �� ��������
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. ��������� �������
    dbms_output.put_line('Found '||num_rows || ' row(s)');
    FOR counter IN REVERSE 1..num_rows
    LOOP
      SELECT first_name, last_name, salary, job_id
      INTO   f_name, l_name, e_salary, e_jobid
      FROM (
        SELECT ROWNUM rn,first_name, last_name, salary, job_id
        FROM employees
        WHERE salary BETWEEN 5000 AND 7000
        --ORDER BY salary ASC
      ) vt
      WHERE rn = counter;
      
      dbms_output.put_line(RPAD(f_name || ' ' || l_name , 20,' ')|| ' ' || e_salary || ' ' || e_jobid );
    END LOOP;
    
    EXCEPTION
      WHEN no_data_found THEN
          dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Unknown exception!');
END;
---------------------------------------------------







##������

-------------------sql--����������� �� PACKAGE SPECFICATION
CREATE OR REPLACE  package_name
IS
  -- 1. ���������� �� ������
  -- 2. ���������� �� ���������� � ���������
  -- 3. ���������� �� �������
  -- 4. ���������� �� ��������� � �������
  

END;
-------------------------------------------



--------------------------------sql-- ����������� �� PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY package_name
IS
  -- ��� ��� ��� ���������� �� ����������,
  -- ���������, ������ �����, �������, ���������
  -- � �������, �� �� �� ���� ������� �,�, �� ��
  -- "������" ����� ������
[BEGIN]
  -- ������������� �� �����, �������� �� �������   
END;
-----------------------------------------

----------------------------------------sql --���������� �� PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE plsql_course
IS
  -- Emplyee Record ...
  TYPE EmployeeRecord IS RECORD (
      emp_id employees.employee_id%TYPE DEFAULT 0
    , f_name employees.first_name%TYPE DEFAULT 'none'
    , l_name employees.last_name%TYPE DEFAULT 'none'
    , e_salary employees.salary%TYPE DEFAULT 0
  );

  TYPE EmployeesTable IS TABLE OF EmployeeRecord;
END;
------------------------------------------








##�������

###���� ������� - ��������� �� ��:

    * ������ �� ����� �� ���� ������ ��� �� ���
    * ������� �� �����, ���� ��������� � SQL ������ � ������� � ���� ���������� �� ������� ���������� ��� 

---------------------------sql--����������� ���� ������ �� ������� �� ����� � ������� �����
   UPDATE ...
    SET ...
   WHERE CURRENT OF �����-������;
-------------------------------

  * ������ 
  �������� � ������� ��������� ���� �������� ������:

    1. ����������

--------------------sql--����������� ���������� �� cursor
CURSOR ���[(���������1, ���������2, ... )] [RETURN ���]
  IS
----------------------------

    2. ��������

--------------------sql--����������� �������� �� cursor
    OPEN ���[(��1,��2,...)];
-----------------------------

    3. ������

---------------------sql--���������� ������ �� ursor
--������ � �����  
FETCH ��� INTO ����1,����2,����3,...

FETCH ��� INTO �������������-���-record;
     
--��� �����
FETCH ��� BULK COLLECT INTO ����������-��-��������-���;
--� ���� ���� � ����� ����������� �������
--------------------------------------------

     3.1 �������� �� ���������
     
-----------------------------------------sql--����������� �� �������� �� cursor
     ���-��-������%�������     
0----------------------------------------

+--------------+----------------------------------+
| ���%FOUND    | true ��� ��� ������ �� ������    |
+--------------+----------------------------------+
| ���%NOTFOUND | true ��� ���� ������ �� ������   |
+--------------+----------------------------------+
| ���%ISOPEN   | true ��� �������� ���� � ������� |
+--------------+----------------------------------+
| ���%ROWCOUNT | ���� ������ �������� �� �������  |
+--------------+----------------------------------+

      4. ���������
-----------------------sql  --����������� ��������� �� cursor
  CLOSE ���;
--------------------------

-------------------------sql--���������� �� cursor
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  CURSOR list_employees 
    RETURN plsql_course.EmployeeRecord
    IS
      SELECT  employee_id
            , first_name
            , last_name
            , salary
      FROM employees
      WHERE salary BETWEEN 5000 AND 7000;
BEGIN
     -- 2. ��������
     OPEN list_employees;
     
     -- 3. ������
     LOOP
        FETCH list_employees INTO emp_rec;
        EXIT WHEN list_employees%NOTFOUND;
        dbms_output.put_line( list_employees%ROWCOUNT || ' ' || 
                             emp_rec.emp_id           || ' ' ||
                             emp_rec.f_name           || ' ' ||
                             emp_rec.l_name           || ' ' ||
                             emp_rec.e_salary );
     END LOOP;
     
     -- 4. ���������
     CLOSE list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
-----------------------------------

----------------------------------sql--��������� �� cursor
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  CURSOR list_employees( from_salary employees.salary%TYPE DEFAULT 1000, 
                         to_salary   employees.salary%TYPE DEFAULT 4000) 
    RETURN plsql_course.EmployeeRecord
    IS
      SELECT  employee_id
            , first_name
            , last_name
            , salary
      FROM employees
      WHERE salary BETWEEN from_salary AND to_salary
      ORDER BY salary DESC;
BEGIN
     -- 2. ��������
     OPEN list_employees(200,300);
     
     -- 3. ������
     LOOP
        
        FETCH list_employees INTO emp_rec;
        EXIT WHEN list_employees%NOTFOUND;
        dbms_output.put_line( list_employees%ROWCOUNT || ' ' || 
                             emp_rec.emp_id           || ' ' ||
                             emp_rec.f_name           || ' ' ||
                             emp_rec.l_name           || ' ' ||
                             emp_rec.e_salary );
         
     END LOOP;
     
     -- 4. ���������
     CLOSE list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
------------------------------------



###������������ �� ���������
  
-----------------------------------------------sql--����������� cursor � ���������
  CURSOR c1( a NUMBER, b NUMBER DEFAULT 1) IS ...

  OPEN c1(10,20);
  OPEN c1(10); -- �� ������ �����. �� �� �������� ����. ��������
        
  -- T������ ������
  CURSOR c1( a NUMBER DEFAULT 1, b NUMBER) IS ...
  
  OPEN c1(10,20); -- Ok!
  OPEN c1(10);    -- 10 �� �� �������� �� �, �� ���� �������� �.�. �� �� ������ ������
------------------------------------------------------

-----------------------------------------sql
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;

BEGIN
     -- 2. ��������
     OPEN plsql_course.list_employees;
     
     -- 3. ������
     FETCH plsql_course.list_employees 
        BULK COLLECT INTO emp_table;
     
     dbms_output.put_line('Found:' || plsql_course.list_employees%ROWCOUNT || ' row(s)');   
     
     IF emp_table.COUNT > 0 THEN
      FOR idx IN REVERSE emp_table.FIRST..emp_table.LAST
        LOOP
          dbms_output.put_line(emp_table(idx).emp_id || ' ' ||
                               emp_table(idx).l_name || ' ' ||
                               emp_table(idx).e_salary);
        END LOOP;
     END IF;
     
     -- 4. ���������
     CLOSE plsql_course.list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
-----------------------------------------------------

###��� ������

-------------------------------------------sql-- ����������� REF CURSOR
--1. ���������
TYPE ���-��-���� IS REF CURSOR [RETURN ���];

--2. ���������   
���������� ���-��-����;
-----------------------------------------------

--------------------------------------------sql--���������� �� REF CURSOR 
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  
  dep_cursor plsql_course.DepartmentsCrsType;
  dep_data plsql_course.DepartmentsRecord;

BEGIN
     -- 2. ��������
     OPEN dep_cursor FOR SELECT department_id
                              , department_name
                         FROM departments
                         WHERE manager_id IS NOT NULL
                         ORDER BY 2;
     
     -- 3. ������
     LOOP
      FETCH dep_cursor INTO dep_data;
      EXIT WHEN dep_cursor%NOTFOUND;
      dbms_output.put_line(dep_data.dep_id || ' ' || dep_data.dep_name );
     END LOOP;
     
     -- 4. ���������
     CLOSE dep_cursor;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
------------------------------------------------------

---------------------------------------------------sql--����������?
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  
  dep_cursor plsql_course.DepartmentsCrsType;
  dep_data plsql_course.DepartmentsRecord;

BEGIN
    FOR crow IN (SELECT employee_id eid
                      , last_name   lname
                      , job_id
                      , salary      sal
                 FROM employees
                 WHERE salary < 5000 
                 ORDER BY salary DESC) 
     LOOP
      dbms_output.put_line(crow.eid || ' ' || crow.lname || ' ' || crow.sal );
     END LOOP;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
-------------------------------------------------------------




###������ �������

    * �������� �� �������� �������

-------------------------------------sql--����������� atribut ������ ursor
    SQL%a������
-----------------------------------------------------------

+--------------+---------------------------------+
| SQL%FOUND    | true ��� ��� ������             |
+--------------+---------------------------------+
| SQL%NOTFOUND | true ��� ���� ������            |
+--------------+---------------------------------+
| SQL%ISOPEN   | ������ � true                   |
+--------------+---------------------------------+
| SQL%ROWCOUNT | ���� ������ �������� �� ������� |
+--------------+---------------------------------+


--------------------------------------------sql--���������� �� ������ cursor
DECLARE
--2. ���������� �� ����������
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  
  dep_cursor plsql_course.DepartmentsCrsType;
  dep_data plsql_course.DepartmentsRecord;

BEGIN
    UPDATE employees
    SET salary = salary + 10
    WHERE department_id = 100;
    
    dbms_output.put_line(SQL%ROWCOUNT || ' row(s) updated!');
    
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;

