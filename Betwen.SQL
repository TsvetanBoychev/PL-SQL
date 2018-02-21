Select * from EXT_BLOCK_REG


WHERE NI_AMOUNT NOT IN ( '1000', '0');
          
SELECT * from EXT_BLOCK_REG
--FROM EXT_BLOCK_REG
--WHERE T_AMOUNT BETWEEN 2000 AND 2050;
WHERE DOC_DESCR LIKE '%ƒ»Ã»“–Œ¬%';

-----------------------------------------------------------------------------------------------------------
 
SELECT * FROM EXT_BLOCK_REG
WHERE PR_Amount NOT BETWEEN 10 AND 999999999999;                                        