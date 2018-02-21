
Здравейте,

изпращам мои записки за PL/SQL и поне на мен ми се струва, че нещата са много подредени,

за да се разберат основните възможности.

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

##Основни понятия
Езика добавя процедурни възможности на SQL, но е ограничен 
само до работата с базата данни, без формиране на екрани

+---------------+-----------------------------------+
| Сървър        | Език                              |
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
| MySQL         | без име                           |
+---------------+-----------------------------------+
| Interbase     | без име                           |
+---------------+-----------------------------------+


    * скриптове  - съдържа текстов файл със стъпките
    * курсори -> SELECT заявка, от която можем да четем(или обновяваме) ред по ред
    * процедури и функции ->като обекти в базата данни или в PL/SQL кода
    * тригери
    * пакети
    * типове - потребителски дефинирани типове данни

Процедурите не връщат резултат и по тази причина не могат да се използват в SQL Statment

Функциите връщат резултат и са удобни за използване в SQL Statement за пригледност на кода

Тригерите - използва се при Insert, Update, Delete на запис от таблица с цел автоматична 
промяна на функционално зависими колони, за създаване записи за история и други.

Пакетите - в единна структура обединяват процедури, функции, типове 
биват потребителски и DBA trigers(вградени на системно ниво)

Типовете - голяма част съответсват на типовете в SQL, но има и специфични, 
които са само за PL/SQL и не могат да с еизползват за четене на базата данни


##Синтаксис на PL/SQL

    * специални символи в синтактичните диаграми

+-------------+-----------------------------------+
| ```[...]``` | незадължителен елемент            |
+-------------+-----------------------------------+
| ```a|b```   | или а или b, но не и двете заедно |
+-------------+-----------------------------------+
    
    * PL/SQL Block
    Това е основната структурна единица за script,procedure, function

-----------------------sql
[DECLARE]
		--декларации на променливи, константи, типове данни,курсори, процедури, функции и т.н.
BEGIN
		--PL/SQL code
[EXCEPTION]
		--обработка на изключения	
END;
------------------------

    * за да виждаме резултата от изпълнението на скриптовете
  
    View->DBMS Output-> + и посочваме връзка

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


##Елементи на езика

##Променливи
Използват се за временно съхранение на стойности или параметри на script

Деклариране
име тип[:=стойност];

Типовете биват: Scalar, Composite, Reference, LOB(large Object)
Scalar = INTEGER,VARCHAR2, NUMBER, Data, Boolean (всички, важащи и за типовете на колоните в таблицата)
Composite - обединява няколко полета като запис (може да е цял запис от таблицата , може да се дефинира с конкретни полета)

Стойността е незадължителна, но ако не се зададе тя остава неопределена и 
е необходимода се осигури в кода независимо от условията през които минава, 
иначе следват доста поециални проблеми
!!! за script и вход от екран Substitution variables: emp_id:=&employee_if;  

+----------+-----------------------------------------------------------+
| име      | валиден идентификатор                                     |
|          | (1) да започва a-z,A-Z                                    |
|          | (2) може да съдържа a-z, A-Z, _ , 0-9                     |
|          | (3) подсказващо LastName                                  |
+----------+-----------------------------------------------------------+
| тип      | тип на данните, може да съответства на типа от таблицата, |
|          | но има  и специфични за PL/SQL типове (Boolean)           |
+----------+-----------------------------------------------------------+
| :=       | оператор за присвояване !!!! (= е за сравнение)           |
+----------+-----------------------------------------------------------+
| стойност | първоначална стойност на променливата                     |
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
     * Грешки при ```SELECT ... INTO ...```

--------------------sql-- не връща резултат
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

-------------------sql-- връща повече от 1 ред
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

     * обработка на изключения

+-----------------------------------------------------------------------------+
| Изключение се нарича невъзможност на скрипта да продължи работата си поради |
| външни причини (няма данни, данните са от неподходящ тип и т.н.)            |
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





##Специални типове за променливи 

+--------------------------------+-----------------------------------------------+
| променлива таблица.колона%TYPE | eдна стойност от типа на колоната в таблицата |
+--------------------------------+-----------------------------------------------+
| променлива таблица%ROWTYPE     | цял ред от таблицата                          |  Composite
+--------------------------------+-----------------------------------------------+
| сообствен тип                  | повече колони, но не всички от таблицата      |  Composite
+--------------------------------+-----------------------------------------------+


----------------------sql--променлива с тип като типа на поле
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

------------------------sql--променлива с типа composite-взема целия запис от таблицата
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



##Създаване на собствени типове

---------------------sql --създаване на собствен тип
--1. дефиниция на типа
TYPE име–на-тип .....;

--2. декларация на променлива от дадения тип
променлива име-на-тип;
-----------------------------

###Запис ( Type Record )

------------------------sql-- конструкция на Собствен type RECORD
TYPE име-на-тип IS RECORD (
  поле1 тип1,
  поле2 тип2,
  ...
  полеN типN       
-------------------------



-------------------------sql--използване на Собствен тип RECORD
DECLARE
-- 1. дефиниция на типа
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

--2. декларация на променлива
  emp_rec EmployeeRecord;
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    dbms_output.put_line('Defaults:'||emp_rec.f_name || ' ' || emp_rec.l_name);
    -- 1. колко са редовете
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. извеждаме данните
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
###Таблица (Type Table)

------------------------------------sql--конструкция на Собствен type Table
TYPE име-на-тип IS TABLE OF друг-тип;
------------------------------------------------

------------------------------sql--използване на Собствен type Table 
--1. дефиниции  3 варианта
TYPE NUMBERS IS TABLE OF NUMBER;

TYPE EMPIDS_TABLE IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE;

TYPE EMPS_TABLE IS TABLE OF EMPLOYEES%ROWTYPE;

--2. декларации
IDS_TAB  EMPIDS_TABLE;
   
EMPS_TAB  EMPS_TABL;

Ns   NUMBERS;   
------------------------------------------------

----------------------------sql--използване на Собствен тип Table съставен от Собствен тип Records
DECLARE
-- 1. дефиниция на типа
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. декларация на променлива
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
    
    -- 2. извеждаме данните
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

----------------------------------------------------sql--използване на Собствен тип Table, съставен от собствен тип Records (изглежда като горното!!!)
DECLARE
-- 1. дефиниция на типа
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. декларация на променлива
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
    
    -- 2. извеждаме данните
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

---------------------------------sql-- Използване на  Собствен тип Table, съставен от собствен тип Records (изглежда като горното!!!)да видя нюансите
DECLARE
-- 1. дефиниция на типа
TYPE EmployeeRecord IS RECORD (
    emp_id employees.employee_id%TYPE DEFAULT 0
  , f_name employees.first_name%TYPE DEFAULT 'none'
  , l_name employees.last_name%TYPE DEFAULT 'none'
  , e_salary employees.salary%TYPE DEFAULT 0
);

TYPE EmployeesTable IS TABLE OF EmployeeRecord;

--2. декларация на променлива
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
    
    -- 2. извеждаме данните
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



























##Контролни структури
	   
###Условно изпълнение
	   
      * IF

----------------------sql--използване на If
IF  условие THEN
	израз1;
	израз2;
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


------------------------------`sql--конструкцията if else
IF условие THEN
	израз1;
	израз2;
ELSE
	израз3;
	израз4;
END IF;
------------------------------
-----------------------------sql--използване на if else
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

-----------------------------------sql--конструкцията if elsif else
IF условие1 THEN
   израз1;
   израз2;
ELSIF условие2 THEN
   израз3;
   израз4;
ELSE
   израз5;
   израз6;
END IF;
-------------------------------------

-------------------------------sql--Използване на if elsif else
-- Кога ще видим А = 5 ?
--Логическа грешка
	IF A > 0 THEN
		израз1;
	ELSIF A = 5 THEN
		dbms_output.put_line('A = 5'); 
	END IF; 
------------------------------
-----------------------------sql--използване на if elsif else 
--OK!!
	IF A = 5 THEN
		израз2;
	ELSIF A > 0 THEN
		израз1;
	END IF; 
-----------------------------

    * CASE

----------------------------sql-- конструкцията CASE
			CASE израз
				WHEN стойност1 THEN израз1;
				WHEN стойност2 THEN израз2;
				WHEN стойност3 THEN израз3;
				...				
				ELSE
					изразN;
			END CASE;

-------------------------
			CASE 
				WHEN условие1 THEN израз1;
				WHEN условие2 THEN израз2;
				WHEN условие3 THEN израз3;
				...
				ELSE
					изразN;
			END CASE;
```

##Конструкции за циклично изпълнение 
  
--------------------------sql--конструкция LOOP
  LOOP
   PL/SQL code
  END LOOP;
-------------------------

трябва да имаме:

  * ```EXIT WHEN условие;```

  * при по-сложни ситуации

----------------------sql--EXIT в IF
IF условие THEN
    ...
    ...
    EXIT;
END IF;
-----------------------------

----------------------------sql--използване на LOOP
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

------------------------sql--конструкцията GOTO label
BEGIN
 ...
 DECLARE 
 	x NUMBER;
 BEGIN
  ...
  <<label>>
  BEGIN
   x :=1; -- Ок!
   ...
   xxx     -- тук възниква изключение 
   ...
  EXCEPTION
     ...   -- обработка на изключението
     GOTO label; --преход към етикета label
  END;
  ...
    EXCEPTION
     ...
 END;
 x:=2; --Грешка (x e декларирана в по-вътрешен блок)
 ...
END;
```

---------------------sql--използваме substitution variables (вход от екрана)
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

-----------------------sql-- конструкция FOR..LOOP
FOR брояч IN нач_стойност..крайна_стойност
   LOOP
    PL/SQL code
   END LOOP;
---------------------------------

    1. броячът НЕ трябва да е предварително декларирана променлива
    2. на брояча НЕ се задава начална стойност
    3. ВИНАГИ нач_стойност < крайна_стойност
    4. стъпката е ВИНАГИ 1

---------------------------sql--конструкция for и REVERSE
   FOR брояч IN REVERSE нач_стойност..крайна_стойност
   LOOP
    PL/SQL code
   END LOOP;
----------------------------

--------------------------sql--използване на FOR..LOOP
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  e_jobid employees.job_id%TYPE :='';
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    -- 1. колко са редовете
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. извеждаме данните
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

-------------------------------------------sql -- използваме FOR..LOOP и REVERSE
DECLARE
  l_name  employees.last_name%TYPE :='none';
  f_name  employees.first_name%TYPE :='none';
  e_salary employees.salary%TYPE := 0;
  e_jobid employees.job_id%TYPE :='';
  emp_id  employees.employee_id%TYPE := 105;
  num_rows NUMBER;
BEGIN
    -- 1. колко са редовете
    SELECT COUNT(*)
    INTO num_rows
    FROM employees
    WHERE salary BETWEEN 5000 AND 7000;
    
    -- 2. извеждаме данните
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







##Пакети

-------------------sql--конструкция на PACKAGE SPECFICATION
CREATE OR REPLACE  package_name
IS
  -- 1. декларации на типове
  -- 2. декларации на променливи и константи
  -- 3. декларации на курсори
  -- 4. декларации на процедури и функции
  

END;
-------------------------------------------



--------------------------------sql-- конструкция на PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY package_name
IS
  -- Ако тук има декларации на променливи,
  -- константи, типове данни, курсори, процедури
  -- и функции, то те са САМО ЛОКАЛНИ т,е, НЕ СЕ
  -- "ВИЖДАТ" извън пакета
[BEGIN]
  -- инициализация на данни, отваряне на курсори   
END;
-----------------------------------------

----------------------------------------sql --Използване на PACKAGE SPECIFICATION
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








##Курсори

###Явни курсори - използват се за:

    * четене на данни от една заявка ред по ред
    * промяна на данни, като промяната е SQL заявка и курсора е само инструмент да посочим конкретния ред 

---------------------------sql--конструкция явен курсор за промяна на данни в текущия запис
   UPDATE ...
    SET ...
   WHERE CURRENT OF име–на-курсор;
-------------------------------

  * стъпки 
  Работата с курсори преминава през следните стъпки:

    1. декларация

--------------------sql--конструкция декларация на cursor
CURSOR име[(параметър1, параметър2, ... )] [RETURN тип]
  IS
----------------------------

    2. отваряне

--------------------sql--конструкция отваряне на cursor
    OPEN име[(ст1,ст2,...)];
-----------------------------

    3. четене

---------------------sql--онструкция четене на ursor
--четене в цикъл  
FETCH име INTO пром1,пром2,пром3,...

FETCH име INTO променлива–от-тип-record;
     
--без цикъл
FETCH име BULK COLLECT INTO променлива-от-табличен-тип;
--и след това в цикъл обработваме данните
--------------------------------------------

     3.1 атрибути на курсорите
     
-----------------------------------------sql--конструктор на атрибути на cursor
     име-на-курсор%атрибут     
0----------------------------------------

+--------------+----------------------------------+
| име%FOUND    | true ако има редове за четене    |
+--------------+----------------------------------+
| име%NOTFOUND | true ако няма редове за четене   |
+--------------+----------------------------------+
| име%ISOPEN   | true ако курсорът вече е отворен |
+--------------+----------------------------------+
| име%ROWCOUNT | брой редове повлияни от курсора  |
+--------------+----------------------------------+

      4. затваряне
-----------------------sql  --конструкция затваряне на cursor
  CLOSE име;
--------------------------

-------------------------sql--използване на cursor
DECLARE
--2. декларация на променлива
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
     -- 2. Отваряне
     OPEN list_employees;
     
     -- 3. Четене
     LOOP
        FETCH list_employees INTO emp_rec;
        EXIT WHEN list_employees%NOTFOUND;
        dbms_output.put_line( list_employees%ROWCOUNT || ' ' || 
                             emp_rec.emp_id           || ' ' ||
                             emp_rec.f_name           || ' ' ||
                             emp_rec.l_name           || ' ' ||
                             emp_rec.e_salary );
     END LOOP;
     
     -- 4. Затваряне
     CLOSE list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
-----------------------------------

----------------------------------sql--зползване на cursor
DECLARE
--2. декларация на променлива
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
     -- 2. Отваряне
     OPEN list_employees(200,300);
     
     -- 3. Четене
     LOOP
        
        FETCH list_employees INTO emp_rec;
        EXIT WHEN list_employees%NOTFOUND;
        dbms_output.put_line( list_employees%ROWCOUNT || ' ' || 
                             emp_rec.emp_id           || ' ' ||
                             emp_rec.f_name           || ' ' ||
                             emp_rec.l_name           || ' ' ||
                             emp_rec.e_salary );
         
     END LOOP;
     
     -- 4. Затваряне
     CLOSE list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
------------------------------------



###Подразбиращи се параметри
  
-----------------------------------------------sql--конструкция cursor с параметри
  CURSOR c1( a NUMBER, b NUMBER DEFAULT 1) IS ...

  OPEN c1(10,20);
  OPEN c1(10); -- за втория парам. ще се използва подр. стойност
        
  -- Tипична грешка
  CURSOR c1( a NUMBER DEFAULT 1, b NUMBER) IS ...
  
  OPEN c1(10,20); -- Ok!
  OPEN c1(10);    -- 10 ще се използва за а, за няма стойност т.е. ще се получи грешка
------------------------------------------------------

-----------------------------------------sql
DECLARE
--2. декларация на променлива
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;

BEGIN
     -- 2. Отваряне
     OPEN plsql_course.list_employees;
     
     -- 3. Четене
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
     
     -- 4. Затваряне
     CLOSE plsql_course.list_employees;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
-----------------------------------------------------

###Тип курсор

-------------------------------------------sql-- конструкция REF CURSOR
--1. дефиниция
TYPE име-на-типа IS REF CURSOR [RETURN тип];

--2. деклараци   
променлива име-на-типа;
-----------------------------------------------

--------------------------------------------sql--използване на REF CURSOR 
DECLARE
--2. декларация на променлива
  emp_rec plsql_course.EmployeeRecord;
  emp_table plsql_course.EmployeesTable;
  emp_id  employees.employee_id%TYPE := 105;
  
  dep_cursor plsql_course.DepartmentsCrsType;
  dep_data plsql_course.DepartmentsRecord;

BEGIN
     -- 2. Отваряне
     OPEN dep_cursor FOR SELECT department_id
                              , department_name
                         FROM departments
                         WHERE manager_id IS NOT NULL
                         ORDER BY 2;
     
     -- 3. Четене
     LOOP
      FETCH dep_cursor INTO dep_data;
      EXIT WHEN dep_cursor%NOTFOUND;
      dbms_output.put_line(dep_data.dep_id || ' ' || dep_data.dep_name );
     END LOOP;
     
     -- 4. Затваряне
     CLOSE dep_cursor;
     
    EXCEPTION
      --WHEN no_data_found THEN
      --    dbms_output.put_line('Record not found! ');
      WHEN others THEN
          dbms_output.put_line('Exception:' || SQLCODE || ' Text:' || SQLERRM );
END;
------------------------------------------------------

---------------------------------------------------sql--използване?
DECLARE
--2. декларация на променлива
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




###Неявни курсори

    * атрибути на неявните курсори

-------------------------------------sql--конструкция atribut неявен ursor
    SQL%aтрибут
-----------------------------------------------------------

+--------------+---------------------------------+
| SQL%FOUND    | true ако има редове             |
+--------------+---------------------------------+
| SQL%NOTFOUND | true ако няма редове            |
+--------------+---------------------------------+
| SQL%ISOPEN   | ВИНАГИ е true                   |
+--------------+---------------------------------+
| SQL%ROWCOUNT | брой редове повлияни от курсора |
+--------------+---------------------------------+


--------------------------------------------sql--използване на неявен cursor
DECLARE
--2. декларация на променлива
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

