---------Sale_Cust_order---- ASSIGNMENT ------

CREATE TABLE Salespeople(
Snum NUMBER PRIMARY KEY,
Sname VARCHAR2(40),
City VARCHAR2(40),
Comm FLOAT
);

INSERT INTO Salespeople VALUES (1001, 'Peel','London' ,.12);
INSERT INTO Salespeople VALUES (1002,'Serres','San Jose',.13);
INSERT INTO Salespeople VALUES (1004,'Monika','London',.11);
INSERT INTO Salespeople VALUES (1007,'Rifkin','Barcelona',.15);
INSERT INTO Salespeople VALUES (1003,'Axelrod','New York',.10);
INSERT INTO Salespeople VALUES (1005,'Franc','London',.26);

SELECT * FROM Salespeople;
-------------------------------------------------------------
CREATE TABLE Customers(
Cnum NUMBER PRIMARY KEY,
Cname VARCHAR2(40),
City VARCHAR2(40),
Rating NUMBER,
Snum NUMBER,
FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);


INSERT INTO Customers VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO Customers VALUES (2002, 'Giovanni', 'Rome', 200, 1003);
INSERT INTO Customers VALUES (2003, 'Liu', 'San Jose', 200, 1002);
INSERT INTO Customers VALUES (2004, 'Grass', 'Berlin', 300, 1002);
INSERT INTO Customers VALUES (2006, 'Clemens', 'London', 100, 1001);
INSERT INTO Customers VALUES (2008, 'Cisneros', 'San Jose', 300, 1007);
INSERT INTO Customers VALUES (2007, 'Pereira', 'Rome', 100, 1004);


SELECT * FROM Customers;
-------------------------------------------------------------


CREATE TABLE ORDERS(
Onum NUMBER PRIMARY KEY,
Amt FLOAT,
Odate DATE,
Cnum NUMBER,
Snum NUMBER,
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

INSERT INTO ORDERS VALUES (3001, 18.69, TO_DATE('03-Oct-96 12:30','DD-MM-YYYY HH24:MI'), 2008, 1007);
INSERT INTO Orders VALUES (3003, 767.19, TO_DATE('03-Oct-1996 13:45', 'DD-MON-YYYY HH24:MI'), 2001, 1001);
INSERT INTO Orders VALUES (3002, 1900.10, TO_DATE('03-Oct-1996 12:05', 'DD-MON-YYYY HH24:MI'), 2007, 1004);
INSERT INTO Orders VALUES (3005, 5160.45, TO_DATE('03-Oct-1996 14:00', 'DD-MON-YYYY HH24:MI'), 2003, 1002);
INSERT INTO Orders VALUES (3006, 1098.16, TO_DATE('03-Oct-1996 13:37', 'DD-MON-YYYY HH24:MI'), 2008, 1007);
INSERT INTO Orders VALUES (3009, 1713.23, TO_DATE('04-Oct-1996 15:21', 'DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Orders VALUES (3007, 75.75, TO_DATE('04-Oct-1996 16:02', 'DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Orders VALUES (3008, 4723.00, TO_DATE('05-Oct-1996 12:07', 'DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Orders VALUES (3010, 1309.95, TO_DATE('06-Oct-1996 13:12', 'DD-MON-YYYY HH24:MI'), 2004, 1002);
INSERT INTO Orders VALUES (3011, 9891.88, TO_DATE('06-Oct-1996 13:09', 'DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Orders VALUES (3012, 3455.78, TO_DATE('04-Oct-1996 15:21', 'DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Orders VALUES (3013, 1245.98, TO_DATE('04-Oct-1996 16:32', 'DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Orders VALUES (3014, 3721.53, TO_DATE('05-Oct-1996 12:45', 'DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Orders VALUES (3015, 734.50, TO_DATE('06-Oct-1996 13:16', 'DD-MON-YYYY HH24:MI'), 2004, 1002);
INSERT INTO Orders VALUES (3016, 1729.67, TO_DATE('06-Oct-1996 13:07', 'DD-MON-YYYY HH24:MI'), 2006, 1001);

COMMIT;

SELECT * FROM ORDERS;
--------------------------------------------------

---1. List all customers with a rating of 100.

SELECT * FROM Customers
WHERE Rating = 100;

---2. Find all records in the Customer table with NULL values in the city column.

SELECT * FROM Customers
WHERE City = NULL;

---3. Find the largest order taken by each salesperson on each date.

select Snum,Odate, MAX(Amt)from ORDERS
GROUP BY Snum,Odate;

select Snum,Extract(Day from Odate), MAX(Amt)from ORDERS
GROUP BY Snum,Extract(Day from Odate);



---4. Arrange the Orders table by descending customer number.

SELECT * from ORDERS
ORDER BY Cnum DESC;


--- 5. Find which salespeople currently have orders in the Orders table.

SELECT Sname from Salespeople
WHERE Snum IN (SELECT DISTINCT(Snum) from ORDERS);


--6. List names of all customers matched with the salespeople serving them. 

SELECT Cname, Sname
from Salespeople s
INNER JOIN Customers c
ON c.Snum = s.Snum ;

--- 7. Find the names and numbers of all salespeople who had more than one customer.

select S.Sname,c.Snum,Count(c.Cnum)
from Salespeople s
Inner join Customers c
on s.Snum = c.Snum
Group by c.Snum, Sname
having Count(c.Cnum) > 1;

--- 8. Count the orders of each of the salespeople and output the results in descending order.
SELECT Snum,COUNT(Onum)AS "Number of orders" FROM ORDERS
Group by Snum
ORDER BY COUNT(Onum) DESC;

--- 9. List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.

SELECT * FROM Customers
Where EXISTs(SELECT * FROM Customers 
WHERE City = 'San Jose');


---10. Match salespeople to customers according to what city they lived in.--
SELECT s.Sname, c.Cname, s.City
FROM Salespeople s
INNER JOIN Customers c
ON s.City = c.City;


-- 11. Find the largest order taken by each salesperson.

SELECT Snum, MAX(Amt) FROM ORDERS
GROUP BY Snum;

---12. Find customers in San Jose who has a rating above 200.

SELECT * FROM Customers
WHERE City = 'San Jose' AND Rating > 200;

-- 13. List the names and commissions of all salespeople in London.

SELECT Sname, Comm FROM Salespeople
WHERE City = 'London';

--- 14. List all the orders of salesperson Monika from the Orders table.
SELECT * FROM ORDERS
WHERE Snum = (Select Snum From Salespeople WHERE Sname = 'Monika');

----15. Find all customers with orders on October 3.
 
SELECT Cnum, Cname from Customers
WHERE Cnum IN (select Cnum FROM ORDERS
Where (extract(day from Odate))= 3);

---16 Give the sums of the amounts from the orders table, grouped by date, 
SELECT Extract (day FROM Odate), SUM(Amt) from ORDERS
GROUP BY Extract (day FROM Odate);


--17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
SELECT Extract (day FROM Odate), SUM(Amt) from ORDERS
GROUP BY Extract (day FROM Odate)
HAVING SUM(Amt)> 2000;


--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.

SELECT MIN(amt)FROM ORDERS
Where Extract(day FROM Odate)= 6;

Select * from ORDERS 
where amt>(SELECT MIN(amt)FROM ORDERS
Where Extract(day FROM Odate)= 6);

-- 19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
SELECT s.Snum,Sname
FROM Salespeople s
WHERE Exists(SELECT c.Snum from Customers c WHERE c.Snum = s.snum and c.Rating = 300);

--Corelated query

----20. Find all pairs of customers having the same rating.
select Rating from customers
Group by rating;


--- 21. Find all customers with CNUM, 1000 above the SNUM of Serres.

SELECT * FROM Customers
Where Cnum >(1000+(
Select Snum from Salespeople where Sname = 'Serres'));

--- 22.  Give the salespeople’s commissions as percentage instead of decimal numbers.

select Snum, Sname, City,(Comm * 100) as "Comm in percentage" from Salespeople;

-- 23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.

Select Snum,Extract(day from Odate),MAX(Amt) from ORDERS
Where Amt < 3000
Group by Snum,Extract(day from Odate)
ORDER BY Snum,Extract(day from Odate);

--- 24. List the largest orders on October 3, for each salesperson.
Select Snum,Extract(day from Odate),MAX(Amt) from ORDERS
Where Extract(day from Odate) =3
Group by Snum,Extract(day from Odate);

---25. Find all customers located in cities where Serres (SNUM 1002) has customers.
SELECT * FROM Customers
WHERE City =(
SELECT City from Salespeople where Sname = 'Serres');


--- 26. Select all customers with a rating above 200.00
SELECT * FROM Customers 
WHERE Rating > 200.00;

---27. Count the number of salespeople currently listing orders in the Orders table.
SELECT Count(UNIQUE(Snum)) As "Salespople_listing" FROM ORDERS;

-- 28. Write a query that produces all customers serviced by salespeople with a commission above 12%. 
--Output the customer’s name and the salesperson‘s rate of commission.

SELECT c.Cname, s.Comm
FROM Salespeople s
INNER JOIN Customers c
ON s.Snum = c.Snum
WHERE Comm > 0.12;

---29. Find salespeople who have multiple customers.

SELECT * FROM Salespeople 
Where Snum IN (
Select Snum from Customers
Group by Snum 
having count(Snum)> 1);

---30. Find salespeople with customers located in their city.
SELECT s.Sname, c.Cname, s.city 
FROM Salespeople s, Customers c
WHERE s.City = c.City;


--- 31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.

SELECT Sname FROM Salespeople 
WHERE Sname LIKE 'P__l%' ;

---32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. 
--Assume you do not know his customer number.
SELECT * FROM ORDERS where Snum IN (select Snum from Customers where Cname = 'Cisneros');

Commit;












commit;
