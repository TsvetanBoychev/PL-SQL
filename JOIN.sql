SELECT * FROM OBJ4 where id = 384845;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


SELECT o4.C_1, o4.C_13, o4.c_35, ebr.DOC_DESCR
FROM obj4 o4
JOIN EXT_BLOCK_REG ebr ON o4.id=ebr.cust;

SELECT o4.C_1, o4.C_13, o4.c_35, ebr.DOC_DESCR
FROM obj4 o4,EXT_BLOCK_REG ebr WHERE o4.id=ebr.cust;

---------------------LEFT JOIN-----------------------------------------------


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

----------------------------------------------------------------------------------

SELECT o4.C_1, o4.C_13, o4.c_35, ebr.DOC_DESCR
FROM obj4 o4
LEFT JOIN EXT_BLOCK_REG ebr ON o4.id=ebr.cust;

---------------------RIGHT JOIN-----------------------------------------------


SELECT o4.C_1, o4.C_13, o4.c_35, ebr.DOC_DESCR
FROM obj4 o4
FULL JOIN EXT_BLOCK_REG ebr ON o4.id=ebr.cust;  


---------------------FULL OUTER JOIN -----------------------------------------------


