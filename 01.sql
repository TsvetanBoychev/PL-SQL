select * from OBJ4 
where gsm_no1 !=0
ORDER BY C_3;


select * from OBJ4 
/*where c_23 like 'СОФИЯ'*/
WHERE c_10 = 10 and c_13 = '104055543'
ORDER BY C_1;

/*    LIKE OPERATOR                            DESCRIPTION
WHERE CUSTOMERNAME LIKE 'A%'      FINDS ANY VALUES THAT STARTS WITH "A"
WHERE CUSTOMERNAME LIKE '%A'      FINDS ANY VALUES THAT ENDS WITH "A"
WHERE CUSTOMERNAME LIKE '%OR%'    FINDS ANY VALUES THAT HAVE "OR" IN ANY POSITION
WHERE CUSTOMERNAME LIKE '_R%'     FINDS ANY VALUES THAT HAVE "R" IN THE SECOND POSITION
WHERE CUSTOMERNAME LIKE 'A_%_%'   FINDS ANY VALUES THAT STARTS WITH "A" AND ARE AT LEAST 3 CHARACTERS IN LENGTH
WHERE CONTACTNAME LIKE 'A%O'      FINDS ANY VALUES THAT STARTS WITH "A" AND ENDS WITH "O"*/

select * from OBJ4 
where c_23 like '%ПЛ%';

/*SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NOT NULL;*/

select C_1, C_3, GRAD from obj4
/*where GRAD = 'ТЪРГОВИЩЕ'*/
where length(C_3) = 10
ORDER BY C_3;


select length(c_16), c_16 from obj4
/*where GRAD = 'ТЪРГОВИЩЕ'*/
where length(c_16) > 1
ORDER BY C_3;




/*OPERATOR                     DESCRIPTION    
ALL       TRUE IF ALL OF THE SUBQUERY VALUES MEET THE CONDITION   
AND       TRUE IF ALL THE CONDITIONS SEPARATED BY AND IS TRUE    
ANY       TRUE IF ANY OF THE SUBQUERY VALUES MEET THE CONDITION    
BETWEEN   TRUE IF THE OPERAND IS WITHIN THE RANGE OF COMPARISONS   
EXISTS    TRUE IF THE SUBQUERY RETURNS ONE OR MORE RECORDS    
IN        TRUE IF THE OPERAND IS EQUAL TO ONE OF A LIST OF EXPRESSIONS  
LIKE      TRUE IF THE OPERAND MATCHES A PATTERN    TRY IT
NOT       DISPLAYS A RECORD IF THE CONDITION(S) IS NOT TRUE    
OR        TRUE IF ANY OF THE CONDITIONS SEPARATED BY OR IS TRUE    
SOME      TRUE IF ANY OF THE SUBQUERY VALUES MEET THE CONDITION*/

-------------------------------------------------------------------------------

---USING ALL AND ANY------------


SELECT c_9 from obj522
WHERE c_1 = ANY (SELECT c_3 FROM obj4 WHERE c_12 = 'МВР БУРГАС');--Не работи така :) 


-------------------------------------------------------------------------------

select length(c_14), c_14 from OBJ160
where length (c_14) > 1 and  c_14 like 'МИЛАНОВА'
order by length(c_14) desc;
-------------------------------------------------------------------------------

select c_14 from obj160
where c_14 like '%МИЛ%' and length (c_14)>25
order by c_14 ASC;

-------------------------------------------------------------------------------
select * from obj522
where c_9>0
order by c_9 asc;
-------------------------------------------------------------------------------

select c_9 as Сума, c_3 as Час from obj522
where c_9>0
order by c_9 asc;



select round(avg (c_9),2)  from obj522
where c_9>0;


select round(sum(c_9),2) as обща_сума_на_преводите from obj522
where c_9>0;

select * from obj522



SELECT * FROM obj522
WHERE c_2>'2010-01-01'



SELECT 
    SUM(CASE WHEN c_8 = 'Федор Славов' THEN c_9 ELSE 0 END) Федор,
    SUM(CASE WHEN c_8 != 'Федор Славов' THEN c_9 ELSE 0 END) ALL_OTHERS
FROM obj522
WHERE c_2>'2010-01-01'
AND c_4 = '0790000002';

SELECT * FROM obj522
WHERE c_2>'2010-01-01'
AND c_4 = '0790000002';


SELECT * FROM obj160
order by c_14 asc; /*Клиентски сметки*/
--------------------------------------------------------------
select sum (case when c_14 like '%АЙШЕ%' then c_7 else 0 end) СУМИРА_ВСИЧКИ_АЙШЕ

FROM obj160;

-------------------------------------------------------------------------------

select c_2 || '' || c_3  as РЕЗУЛТАТ from obj4 ;

-------------------------------------------------------------------------------