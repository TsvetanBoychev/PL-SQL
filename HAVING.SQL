Select * from EXT_BLOCK_REG


WHERE NI_AMOUNT NOT IN ( '1000', '0');
          
SELECT * from EXT_BLOCK_REG
--FROM EXT_BLOCK_REG
--WHERE T_AMOUNT BETWEEN 2000 AND 2050;
WHERE DOC_DESCR LIKE '%ÄÈÌÈÒÐÎÂ%';

-----------------------------------------------------------------------------------------------------------
 
SELECT * FROM EXT_BLOCK_REG
WHERE PR_Amount NOT BETWEEN 10 AND 100;   

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;     ;


/*SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;*/




SELECT COUNT(ID), DOC_DESCR
FROM EXT_BLOCK_REG
GROUP BY DOC_DESCR 
HAVING COUNT(ID) <3;                                


SELECT COUNT (BLOCK_TYPE),DOC_DESCR
FROM EXT_BLOCK_REG
GROUP BY DOC_DESCR 
HAVING COUNT (BLOCK_TYPE) >5;