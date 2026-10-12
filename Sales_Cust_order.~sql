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
Amt NUMBER (10,2),
Odate DATE,
Cnum NUMBER,
Snum NUMBER,
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY (Snum) REFERENCES Salespeople(Snum)
);

DROP TABLE ORDERS;

INSERT INTO ORDERS VALUES (3001, 18.69, TO_DATE('03-Oct-1996 12:30','DD-MM-YYYY HH24:MI'), 2008, 1007);
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

select Snum,TRUNC(Odate), Max(Amt) from orders
group by Snum ,TRUNC(Odate)


---4. Arrange the Orders table by descending customer number.

SELECT * from ORDERS
ORDER BY Cnum DESC;


--- 5. Find which salespeople currently have orders in the Orders table.

SELECT Sname, Snum from Salespeople
WHERE Snum IN (SELECT DISTINCT(Snum) from ORDERS);

select o.Snum, s.sname from salespeople s, orders o
where s.Snum = o.snum
group by o.Snum, s.sname



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

select * from customers
where exists(SELECT * from customers where city = 'San Jose')


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

SELECT c.Cnum,c.Cname,TRUNC(Odate) FROM Customers c 
INNER JOIN ORDERS o
ON c.Cnum = o.Cnum 
WHERE TRUNC(Odate) = to_date('03/10/1996','DD/MM/YYYY')

SELECT * FROM customers c, Orders o
where c.Cnum = O.Cnum and TRUNC(o.Odate) = to_date('October-03-1996','Month-DD-YYYY')


---16 Give the sums of the amounts from the orders table, grouped by date, 
SELECT TRUNC(Odate), SUM(Amt) from ORDERS
GROUP BY TRUNC(Odate)
 


--17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
SELECT TRUNC(Odate), SUM(Amt) from ORDERS
GROUP BY TRUNC(Odate)
HAVING (SUM(Amt)- MAX(amt)) > = 2000;


--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.


Select * from ORDERS 
where amt>(SELECT MIN(amt)FROM ORDERS
Where Extract(day FROM Odate)= 6);

select * from orders where Amt > 
(Select Min(Amt) from orders where Trunc(Odate) = to_date('06-Oct-1996',' DD-Mon-YYYY'))
       
-- 19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

SELECT * FROM Salespeople s
where Exists(select c.Snum from customers c where c.Rating = 300 and s.snum = c.Snum)
;

--Corelated query

----20. Find all pairs of customers having the same rating.

SELECT a.Cname,b.Cname FROM Customers a, customers b
WHERE a.Rating = b.Rating AND a.Cname < b.Cname 


--- 21. Find all customers with CNUM, 1000 above the SNUM of Serres.

SELECT * FROM Customers
Where Cnum >(1000+(
Select Snum from Salespeople where Sname = 'Serres'));

--- 22.  Give the salespeople’s commissions as percentage instead of decimal numbers.

select Snum, Sname, City,(Comm * 100||'%') as "Commission" from Salespeople;

-- 23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.

Select Snum,Extract(day from Odate),MAX(Amt) from ORDERS
Where Amt < 3000
Group by Snum,Extract(day from Odate)
ORDER BY Snum,Extract(day from Odate);

--- 24. List the largest orders on October 3, for each salesperson.
Select Snum,Extract(day from Odate),MAX(Amt) from ORDERS
Where Extract(day from Odate) =3
Group by Snum,Extract(day from Odate);

select Snum,trunc(Odate) ,Max(Amt)from orders 
where trunc(Odate) = to_date('03-oct-1996','dd-mon-yyyy')
group by Snum,trunc(Odate)

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

-- 33. Find the largest orders for ‘Serres’ and ‘Rifkin’.

Select Snum,MAX(Amt) from ORDERS
Where Snum IN (select Snum FROM Salespeople where Sname IN('Serres','Rifkin'))
Group by Snum;

--- 34. Extract the Salespeople table in the following order: 
--SNUM, SNAME, COMMISSION, CITY.
SELECT Snum,Sname,Comm,City FROM Salespeople;

-- 35.Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
SELECT * FROM Customers
WHERE Cname >= 'A' AND Cname < 'H';


commit
-- 36. Select all the possible combinations of customers that you can assign.

SELECT s.Sname, c.Cname
FROM Salespeople s,Customers c;

--- 37. Select all orders that are greater than the average for October 4.

SELECT * FROM ORDERS 
WHERE Amt >(
SELECT AVG(Amt)FROM ORDERS 
WHERE Extract(DAY from Odate)= 4);

---38. Write a select command using a correlated sub query that selects the names and numbers of all customers 
--with ratings equal to the maximum for their city.

--Using IN opearator
SELECT * FROM Customers c WHERE (City, Rating) in (
SELECT c.City, MAX(c.Rating) FROM Customers c GROUP BY c.City)

-- Using co related subquery
SELECT * FROM Customers a 
WHERE Rating  = (SELECT MAX(Rating) FROM Customers b WHERE a.City = b.City)

select a.Cname,a.Cnum from customers a
where Rating = (select max(rating) from customers b where a.city = b.city)

select a.Cname, a.Cnum from customers a
where rating = (Select max(b.rating) from customers b where a.city = b.city)

-- 39- Write a query that totals the orders for each day and places the results in descending order.
SELECT EXTRACT (Day from Odate)AS "DATE",COUNT(Amt)
FROM ORDERS
GROUP BY EXTRACT(Day from Odate)
ORDER BY COUNT(Amt) DESC;

--- 40. Write a select command that produces the rating followed by the name of each customer in San Jose.
SELECT Cname, Rating FROM Customers
WHERE City = 'San Jose';

---41. Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT * FROM ORDERS 
WHERE Amt<(SELECT MIN(Amt) FROM ORDERS
            WHERE Cnum IN (SELECT Cnum FROM Customers
                          WHERE City = 'San Jose'));
                          
--- 42.Find all orders with above average amounts for their customers.                       
   
SELECT * FROM ORDERS a
WHERE a.amt > (
SELECT AVG(b.Amt) FROM ORDERS b WHERE a.Cnum = b.Cnum)


-- 43. Write a query that selects the highest rating in each city.
SELECT City,MAX(Rating)
FROM Customers
GROUP BY City;

--- 44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.

--Using Join
select s.Snum,s.Sname,Round(SUM(s.comm * o.amt),2) as Commission from salespeople s, orders o,customers c
where s.Snum = o.Snum and s.snum = c.Snum and c.Snum = o.Snum and c.rating > 100
group by s.Snum, s.Sname


--- 45. Count the customers with rating above San Jose’s average.
SELECT AVG(Rating)FROM Customers where City = 'San Jose';
--ANS
SELECT * FROM Customers 
WHERE Rating > (SELECT AVG(Rating)FROM Customers where City = 'San Jose');

-- 46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.

SELECT a.Sname, b.Sname
FROM Salespeople  a
CROSS JOIN Salespeople b 
WHERE a.Sname = b.Sname
;


-----47. Find all salespeople that are located in either Barcelona or London.
SELECT * FROM Salespeople
WHERE City IN ('Barcelona', 'London') ;

--48. Find all salespeople with only one customer.

SELECT Snum,Count(Cname) FROM Customers
GROUP BY Snum
HAVING Count(Cname) = 1 ;

--- 49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.

select * from customers a, customers b
where a.Snum = b.Snum and a.cname <> b.cname and a.cname < b.cname



--50. Write a query that will give you all orders for more than $1000.00.
SELECT * FROM ORDERS WHERE Amt > 1000;

--51. Write a query that lists each order number followed by the name of the customer who made that order.

SELECT o.Onum,c.Cname 
FROM Customers c
INNER JOIN ORDERS o
ON c.Cnum = o.Cnum;


--- 52. Write 2 queries that select all salespeople (by name and number) 
--who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
--USING JOIN (inefficient As matches all data use distinct as well, there will be more than one customer which salespeople do not serve from same city)
SELECT DISTINCT s.Sname,s.Snum
FROM Salespeople s
INNER JOIN Customers c
ON s.City = c.City WHERE s.Snum <> c.Snum; 
 
--USING co related subquery (Elegent and efficient as it quick and easy to read)
SELECT s.Snum,s.Sname from Salespeople s
WHERE EXISTS(SELECT c.Snum 
FROM Customers c
where s.City = c.City and s.Snum <> c.Snum);


---53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.

SELECT * FROM Customers 
WHERE Rating = ANY(SELECT Rating FROM Customers where Snum =
(SELECT Snum FROM Salespeople WHERE Sname = 'Serres'));
        
Select * from customers 
where rating = any(        
        Select rating from customers where Snum =(
               select Snum from salespeople where Sname = 'Serres'))

--54. Write 2 queries that will produce all orders taken on October3 or October 4.

--1
SELECT * FROM ORDERS WHERE Extract(Day FROM Odate) IN (3,4);

--2
SELECT * FROM Orders
WHERE TRUNC(Odate) BETWEEN TO_DATE('03-Oct-1996', 'DD-MON-YYYY') 
AND TO_DATE('04-Oct-1996', 'DD-MON-YYYY');


Commit;

---55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.


SELECT c.Cname, a.Onum as Order_1, b.Onum as Order_2
FROM ORDERS a, ORDERS b, Customers c
WHERE a.Cnum = b.Cnum AND a.Cnum = c.Cnum AND a.Onum <b.Onum;

--- 56. Find only those customers whose ratings are higher than every customer in Rome.
select * from Customers
WHERE Rating> (SELECT AVG(Rating) FROM Customers WHERE City = 'Rome');

----57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
SELECT * FROM Customers
where rating > 100 OR City IN ('Rome');

-- 58. Find all rows from the Customer table for which the salesperson number is 1001.
SELECT * FROM Customers
where Snum = 1001;

--- 59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.

SELECT MAX(Amt) FROM ORDERS;

SELECT Snum, SUM(Amt) FROM ORDERS
GROUP BY Snum
Having SUM(Amt) > MAX(Amt);

--60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.
SELECT * FROM ORDERS 
WHERE Amt IN (NULL,0);

--61. Produce all combinations of salespeople and customer names such that the former precedes 
--the latter alphabetically, and the latter has a rating of less than 200.
Select s.Sname, c.Cname
FROM Salespeople s
CROSS JOIN Customers c
WHERE s.Sname < c.Cname AND c.Rating <200;

--- 62. List all salespeople’s names and the commission they have earned.

Select s.Snum,s.Sname,SUM(o.Amt)+(SUM(o.Amt)*0.1)as "Total_Commission"
FROM Salespeople s
Inner Join ORDERS o
ON s.Snum = o.Snum
GROUP BY s.Snum,s.Sname;

---63. Write a query that produces the names and cities of 
--all customers with the same rating as Hoffman. Write the query using Hoffman’s 
--CNUM rather than his rating, so that it would still be usable if his rating changed.

SELECT Cname,City FROM Customers
WHERE Rating = (SELECT Rating from Customers where Cname ='Hoffman');

SELECT Cname,City FROM Customers
WHERE Rating = (SELECT Rating from Customers where Cnum =(SELECT Cnum FROM Customers WHERE Cname ='Hoffman'));


--64.Find all salespeople for whom there are customers that follow them 
--in alphabetical order.

select distinct s.Sname from salespeople s, customers c
where c.Cname > s.Sname


--65.Write a query that produces the names and ratings of all customers of all 
--who have above average orders.
SELECT * FROM Customers c
WHERE c.Snum IN((SELECT o.Cnum FROM ORDERS o
WHERE o.Amt > (SELECT AVG(o.Amt) FROM ORDERS o)));

--66.Find the sum of all purchases from the Orders table.
SELECT SUM(Amt) FROM ORDERS;

--67.Write a select command that produces the order number, amount, and date for all rows in the Order table.
SELECT Onum,Amt, TRUNC(Odate)FROM ORDERS;

--68.Count the number of not null rating fields in the Customer table including duplicates.
SELECT COUNT(Rating)FROM Customers Where Rating IS NOT NULL;

--69.Write a query that gives the names of both the salesperson and 
--the customer for each order after the order number.
SELECT o.Onum,c.Cname,s.Sname FROM Salespeople s, Customers c, ORDERS o
WHERE s.Snum = o.Snum AND c.Cnum = o.Cnum AND s.Snum = c.Snum;


--70.List the commissions of all salespeople servicing customers in London.
Select DISTINCT s.Sname,s.Comm FROM Salespeople s, Customers c
WHERE c.City = 'London' AND s.Snum = c.Snum;

--71. Write a query using ANY or ALL that will find all 
--salespeople who have no customers located in their city.
SELECT * FROM Salespeople Where City NOT IN (select city from Customers);

select * from Salespeople
where city <> ALL(select city from Customers);


select * from Salespeople
where NOT city = ANY(select city from Customers);

--72. Write a query using the EXISTS operator that selects all salespeople with 
--customers located in their cities who are not assigned to them.


select * from salespeople s 
where exists ( select * from customers c where s.Snum <> c.Snum and s.city = c.city)


--73.Write a query that selects all customers serviced by Peel or Motika.
SELECT * FROM Customers
WHERE Snum IN (SELECT Snum FROM Salespeople WHERE Sname IN('Peel','Monika'));

--74.Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once.).



SELECT TrunC(Odate),Count(DISTINCT Snum)
FROM ORDERS
Group by TrunC(Odate)


--75.Find all orders attributed to salespeople in London.
SELECT * FROM ORDERS
WHERE Snum IN (SELECT Snum FROM Salespeople where City ='London');

--76.Find all orders by customers not located in the same cities as their salespeople.


SELECT * FROM Salespeople s, Customers c, ORDERS o
WHERE s.Snum = c.Snum AND s.Snum = o.Snum AND c.Snum = o.Snum AND c.Cnum =o.Cnum AND c.City <> s.city;


--77.Find all salespeople who have customers with more than one current order.

SELECT o.Snum,s.Sname,COUNT(O.Onum) FROM Salespeople s
Inner Join ORDERS o
ON s.Snum = o.Snum
GROUP BY o.Snum,s.Sname
Having COUNT(O.Onum)> 1 ;

--78. Write a query that extracts from the Customer table every customer assigned to a salesperson 
--who currently has at least one other customer (besides the customer being selected) 
--with orders in the Orders table.

Select * from Customers where Snum in(
select snum from orders
group by snum
having count(unique(Cnum)) > 1)


SELECT *
FROM customers c
WHERE EXISTS (
        SELECT 1
        FROM customers c2
        WHERE c2.snum = c.snum --CUSTOMER HAVING SAME SALESPEOPLE
          AND c2.cnum <> c.cnum -- DIFFERENT CUSTOMERS ARE NOT SAME
          AND EXISTS (
                SELECT 1
                FROM orders o
                WHERE o.cnum = c2.cnum --SECOND EXISTS - That other customer has at least one order
          )
);

commit

--79. Write a query that selects all customers whose name begins with ‘C’.

SELECT * FROM Customers WHERE Cname like 'C%'


-- 80. Write a query on the Customers table that will find the highest rating in each city. 
---Put the output in this form:  for the city (city) the highest rating is : (rating).


SELECT 'for the ' || City || ' the highest rating is : ' || MAX(Rating) FROM Customers
GROUP BY City ;

--81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table 
--without any repeats.

SELECT DISTINCT Snum FROM ORDERS; 


--82. Write a query that lists customers in descending order of rating. Output the rating field first, 
--followed by the customers’ names and numbers.
SELECt Rating,Cname,Cnum FROM Customers
ORDER BY Rating DESC

--83. Find the average commission for salespeople in London.

SELECT AVG(s.Comm) FROM Salespeople WHERE City = 'London' ;


--84.Find all orders credited to the same salesperson that services Hoffman.

SELECT * FROM ORDERS WHERE Snum IN (
SELECT Snum FROM Customers where Cname = 'Hoffman');


--85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

SELECT * FROM Salespeople 
WHERE Comm >= 0.10 AND Comm <= 0.12;

--86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10--
SELECT Sname, City FROM Salespeople
WHERE City = 'London' and Comm > 0.10

--87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE Amt < 1000 OR NOT (ODATE = to_date('10/03/1996','MM/DD/YYYY') AND CNUM > 2003);


--89. Write a query that selects each customer’s smallest order.

SELECT Cnum, MIN(Amt)
FROM ORDERS 
GROUP BY Cnum; 

--90. Write a query that selects the first customer in alphabetical order whose 
--name begins with ‘G’.
SELECT * FROM Customers
WHERE Cname > 'G'
ORDER BY Cname 

--91. Write a query that counts the number of different not NULL city values 
--in the Customers table.
SELECT COUNT(UNIQUE City)FROM Customers;

--92. What would be the output from the following query? SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);

SELECT * FROM ORDERS 
WHERE NOT(Odate = to_date('10/03/1996','MM/DD/YYYY') OR Snum>1006) 
AND amt >=1500;


-- 93. Find all customers who are not located in San Jose & whose rating is above 200.

SELECT * FROM Customers WHERE City = 'San Jose' AND Rating >200;

--94. Give a simpler way to write this query:SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

SELECT * FROM salespeople WHERE (Comm>0.12 and Comm <0.14);


---95.Evaluate the following query: SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);

SELECT * FROM orders 
WHERE NOT ((Odate = to_date ('10/03/1996', 'MM/DD/YYYY') AND Snum>1002) 
OR amt>2000);

-- 96. Which salespeople attend to customers not in the city 
--they have been assigned to?
SELECT * FROM Salespeople s
Inner Join Customers c
ON s.Snum = c.Snum AND s.City <> c.City;

--97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
SELECT s.Sname FROM Salespeople s, Customers c
WHERE S.Snum = c.Snum AND c.Rating < 250 AND s.Comm > 0.11; 

--98. Which salespeople have been assigned to the same city but get different commission percentages?
SELECT * FROM Salespeople a,Salespeople b
WHERE a.City = b.City AND a.Comm < b.Comm

-- 99.Which salesperson has earned the most by way of commission?

select * from (select s.Snum, s.Sname,s.comm, SUM(o.Amt),(s.comm * SUM(o.Amt)) as commission_earned from salespeople s, customers c, orders o 
where s.snum = c.snum and s.snum = o.snum and  c.cnum = o.cnum
GROUP BY s.Snum, s.Sname,s.comm 
ORDER BY SUM(o.Amt) DESC)
where rownum = 1;

---100. Does the customer who has placed the maximum number of orders have the maximum rating?

 
select cnum from 
(select cnum,count(onum) as count_orders 
from orders group by cnum) 
     where count_orders = (select Max(count(onum)) from orders group by cnum) 
 
select Cnum from Customers where Rating = (select Max(rating) from customers)

select 
case
  when exists(select cnum from 
(select cnum,count(onum) as count_orders 
from orders group by cnum) 
     where count_orders = (select Max(count(onum)) from orders group by cnum) 
     intersect
     select Cnum from Customers where Rating = (select Max(rating) from customers)) then 'the one who has max number of orders has highest rating'
     else 'the one who has max number of orders do not have highest rating'
end as result
from dual;

commit

SELECT CASE
         WHEN (
             SELECT COUNT(*)
             FROM customers c
             WHERE c.cnum IN (
                 SELECT cnum
                 FROM orders
                 GROUP BY cnum
                 HAVING COUNT(*) = (
                     SELECT MAX(COUNT(*))
                     FROM orders
                     GROUP BY cnum
                 )
             )
             AND c.rating = (SELECT MAX(rating) FROM customers)
         ) > 0
         THEN 'YES'
         ELSE 'NO'
       END AS result
FROM dual;


---101. Has the customer who has spent the largest amount of money been given the highest rating?
Select Cnum from customers where rating = (select Max(rating) from customers)

Select Cnum from
(select cnum, sum(amt) 
from orders group by cnum order by sum(amt) desc)
where rownum = 1


select 
case
  when (Select Cnum from
(select cnum, sum(amt) 
from orders group by cnum order by sum(amt) desc)
where rownum = 1)= any(Select Cnum from customers where rating = (select Max(rating) from customers)
) then 'the one who spent largest amount of money been given the highest rating'
else 'the one who spent largest amount of money has not given the highest rating'
end as Result
from Dual;


---102. List all customers in descending order of customer rating.
SELECT * FROM Customers 
ORDER BY Rating DESC;

---103. On which days has Hoffman placed orders?

SELECT 'hoffman placed order on' || ' ' ||TRUNC(Odate) as result FROM ORDERS
WHERE Cnum = (SELECT Cnum FROM Customers WHERE Cname = 'Hoffman');


---104. Do all salespeople have different commissions?

select 
case
  when count(comm) = count(distinct(comm)) then 'Yes : All salespeople have different commission '
  else 'Yes : All salespeople have different commission '
end as result
from salespeople;

---105. Which salespeople have no orders between 10/03/1996 and 10/05/1996?
select c.Cnum, c.Cname from customers c, orders o
where c.cnum = o.cnum and Trunc(o.odate) not in ('10/02/1996 dd/mm/yyyy','10/05/1996 dd/mm/yyyy')





SELECT * FROM Salespeople s INNER JOIN ORDERS o ON s.Snum =o.Snum
WHERE Odate NOT IN (BETWEEN to_date('10/03/1996','MM/DD/YYYY') AND to_date('10/05/1996','MM/DD/YYYY'));


 

---106. How many salespersons have succeeded in getting orders?
SELECT * FROM Salespeople WHERE SNUM IN (SELECT Snum FROM ORDERS) ;

---107. How many customers have placed orders?
SELECT COUNT(DISTINCT(Cnum)) FROM ORDERS;

---108. On which date has each salesperson booked an order of maximum value?
SELECT Snum, TRUNC(Odate), MAX(Amt) FROM ORDERS
GROUP BY Snum,TRUNC(Odate)
---USING join
SELECT DISTINCT TRUNC(a.Odate),b.* FROM ORDERS a INNER JOIN (SELECT Snum, MAX(Amt) as max_amt FROM ORDERS
GROUP BY Snum) b ON a.Snum = b.Snum AND a.Amt = b.max_amt
;
---Using Subquery
SELECT TRUNC(Odate), Snum, Amt
FROM ORDERS
WHERE (Snum, Amt) IN (
    SELECT Snum, MAX(Amt) 
    FROM ORDERS 
    GROUP BY Snum
);


--- 109- Who is the most successful salesperson?
SELECT Sname FROM(
SELECT s.Snum,s.Sname,Sum(Amt),Comm,(Sum(Amt)* Comm)As total_eraning FROM Salespeople s INNER Join ORDERS o ON s.Snum =o.Snum
GROUP BY s.Snum,s.Sname,Comm
ORDER BY total_eraning DESC)
Where ROWNUM =1;

commit;


--110.Who is the worst customer with respect to the company? - (Who spend least)

SELECT Cname FROM Customers WHERE Cnum =
(SELECT Cnum  FROM (SELECT Cnum, SUM(Amt) as total_Spending FROM ORDERS
GROUP BY Cnum 
ORDER BY total_Spending ASC)
WHERE ROWNUM = 1);

---111. Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
 
  
SELECT 
CASE
  WHEN Count(*) = 0 THEN 'YES'
  ELSE 'No'
END AS final_answer
FROM Salespeople s INNER JOIN Customers c ON s.Snum =c.Snum
WHERE c.Cnum NOT IN (SELECT o.Cnum FROM ORDERS o WHERE Amt >200)
AND s.Sname NOT IN ('Peel','Serres');

SELECT * FROM ORDERS
  
--112. Which customers have the same rating?

SELECT a.Cname,b.Cname FROM Customers a, customers b
WHERE a.Rating = b.Rating AND a.Cname < b.Cname 



---113. Find all orders greater than the average for October 4th.
SELECT * FROM ORDERS WHERE Amt > (SELECT AVG(AMT) FROM ORDERS WHERE TRUNC(Odate) = to_date('04/10/1996','DD/MM/YYYY'))

---114. Which customers have above average orders?

SELECT * FROM Customers WHERE Cnum IN (SELECT Cnum FROM ORDERS WHERE Amt > (SELECT AVG(Amt) FROM ORDERS))


--115. List all customers with ratings above San Jose’s average.
SELECT * FROM Customers WHERE Rating > (SELECT AVG(Rating) FROM Customers
WHERE CITY = 'San Jose')


---116. Select the total amount in orders for each salesperson 
--for which the total is greater than the amount of the largest order in the table.

SELECT Snum, SUM(Amt) AS total_amt FROM ORDERS GROUP BY Snum
HAVING SUM(Amt) > MAX(Amt)

--117.Give names and numbers of all salesperson that have more than one customer.

(SELECT Snum,COUNT(Onum)  FROM Orders GROUP BY Snum
HAVING  COUNT(Onum) > 1)

SELECT o.Snum, s.Sname  FROM Salespeople s INNER JOIN ORDERS o ON s.Snum = o.Snum
GROUP BY o.Snum, s.Sname 
HAVING  COUNT(o.Onum) > 1

--118. Select all salesperson by name and numbers who have customers in their city whom they don’s the service.
SELECT s.Snum,s.Sname,c.Cname,c.City FROM Salespeople s INNER JOIN Customers c ON s.Snum <> c.Snum
WHERE s.City = c.City


---119. Which customers’ rating should be lowered?

SELECT Cnum FROM (
SELECT Cnum, AVG(SUM(Amt), SUM(Amt) as total_Spending FROM ORDERS
GROUP BY Cnum 
HAVING SUM(Amt) < AVG(SUM(Amt))
ORDER BY total_Spending ASC


SELECT c.Cname, c.Rating, SUM(o.Amt) as Total_Spent
FROM Customers c
JOIN Orders o ON c.Cnum = o.Cnum
GROUP BY c.Cname, c.Rating
Having 
SUM(o.Amt) < (SELECT AVG(Total_Per_Customer)FROM(SELECT SUM(Amt) as Total_Per_Customer FROM Orders GROUP BY Cnum))
AND 
c.Rating > (SELECT AVG(c.Rating) FROM Customers c )


--120. Is there a case for assigning a salesperson to Berlin?

SELECT 
Case
  WHEN (Select Count(*) FROM Customers WHERE City = 'Berlin') > (SELECT COUNT(*) FROM Salespeople WHERE City ='Berlin') 
    THEN 'Yes, There is need of Salesperson there'
  Else 'No,Not Required'
END AS is_there_a_need
FROM DUAL;


--121.Is there any evidence linking the performance of a salesperson 
--to commission that he or she is being paid?- Rewrite

select avg(comm) from salespeople








SELECT s.Sname,
    -- 1. Check Performance (Is their Order Count > Average?)
    CASE WHEN COUNT(o.Onum) > (SELECT AVG(COUNT(*)) FROM Orders GROUP BY Snum) 
         THEN 'High Perf' ELSE 'Low Perf' END AS Perf_Status,

    -- 2. Check Commission (Is their Comm > Average?)
    CASE WHEN s.Comm > (SELECT AVG(Comm) FROM Salespeople) 
         THEN 'High Comm' ELSE 'Low Comm' END AS Comm_Status,

    -- 3. The Final Verdict (Do they match?)
    CASE 
        WHEN (COUNT(o.Onum) > (SELECT AVG(COUNT(*)) FROM Orders GROUP BY Snum))
             AND 
             (s.Comm > (SELECT AVG(Comm) FROM Salespeople))
        THEN 'YES - Correlated (High/High)'
        
        WHEN (COUNT(o.Onum) <= (SELECT AVG(COUNT(*)) FROM Orders GROUP BY Snum))
             AND 
             (s.Comm <= (SELECT AVG(Comm) FROM Salespeople))
        THEN 'YES - Correlated (Low/Low)'
        
        ELSE 'NO Link (Mismatch)'
    END AS Evidence
FROM Salespeople s
JOIN Orders o ON s.Snum = o.Snum
GROUP BY s.Sname, s.Comm;

COMMIT;
--122. Does the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?


SELECT c.Cnum FROM Customers c WHERE c.City  IN ('Rome','London')
--1
SELECT SUM(o.Amt)FROM ORDERS o 
WHERE o.Cnum IN (SELECT c.Cnum FROM Customers c WHERE c.City  IN ('Rome','London'))

SELECT s.Snum FROM Salespeople s WHERE City IN ('New York','London')

--2
SELECT SUM(o.AMt) FROM ORDERS o
WHERE o.Snum IN (SELECT s.Snum FROM Salespeople s WHERE City IN ('New York','London'))

---Final ANSWER
SELECT Case WHEN ((
SELECT SUM(o.Amt)FROM ORDERS o WHERE o.Cnum IN (SELECT c.Cnum FROM Customers c WHERE c.City  IN ('Rome','London')))
 > 5*
 (SELECT SUM(o.AMt) FROM ORDERS o
WHERE o.Snum IN (SELECT s.Snum FROM Salespeople s WHERE City IN ('New York','London'))))
THEN 'First Amount Exceed the second amount by 5x' 
ELSE 'it Doesnt'
  END as ANSWER FROM DUAL;



--123. Which is the date, order number, amt and city for each salesperson (byname) for the maximum order he has obtained?


SELECT s.Sname,o.Odate,o.Onum,o.Amt,s.City  FROM Salespeople s, Customers c, ORDERS o 
WHERE s.Snum = c.Snum AND c.Cnum = o.Cnum AND s.Snum = o.Snum AND c.Snum = o.Snum AND 
(o.Snum,o.Amt) IN (SELECT o.Snum,MAX(o.Amt) FROM ORDERS o GROUP BY o.Snum)



---124. Which salesperson(s) should be fired?

SELECT * FROM Salespeople s WHERE s.Snum NOT IN(SELECT o.Snum FROM ORDERS o)


SELECT  s.Snum,s.Sname,NVL(SUM(AMT),0)as total_amt, RANK() OVER (ORDER BY NVL(SUM(o.Amt), 0) ASC) as rnk
FROM Salespeople s LEFT JOIN ORDERS o ON s.Snum = o.Snum
GROUP BY s.Snum, s.Sname


--125. What is the total income for the company? 

---Sapespeople expence
SELECT SUM(total_eraning) FROM (SELECT s.Snum,s.Sname,Sum(Amt),Comm,(Sum(Amt)* Comm)As total_eraning FROM Salespeople s INNER Join ORDERS o ON s.Snum =o.Snum
GROUP BY s.Snum,s.Sname,Comm)

---sum of AMt 
SELECT SUM(o.Amt) FROM ORDERS o

SELECT (SELECT SUM(o.Amt) FROM ORDERS o) - (SELECT SUM(total_eraning) FROM (SELECT s.Snum,s.Sname,Sum(Amt),Comm,(Sum(Amt)* Comm)As total_eraning FROM Salespeople s INNER Join ORDERS o ON s.Snum =o.Snum
GROUP BY s.Snum,s.Sname,Comm))AS total_income FROM Dual 


commit






-----practice again


--1. List all customers with a rating of 100.

select * from customers
where rating = 100;

--2. Find all records in the Customer table with NULL values in the 
--city column.
select * from customers
where city is NULL;

--3. Find the largest order taken by each salesperson on each date.
select Snum,TRUNC(Odate), Max(Amt) from orders
group by Snum ,TRUNC(Odate)

--5. Find which salespeople currently have orders in the Orders table.
select o.Snum, s.sname from salespeople s, orders o
where s.Snum = o.snum
group by o.Snum, s.sname

-- 7.Find the names and numbers of all salespeople who had more than one customer.
Select Snum, Sname from salespeople where Snum in 
(select Snum from customers group by Snum having count(Snum)> 1)

--9. List the Customer table if and only if one or more of
-- the customers in the Customer tables are located in San Jose.
Select * from customers
where exists(Select Cnum from Customers where City = 'San Jose')

-- 10.Match salespeople to customers according to what city they lived in.
 select s.Sname, c.Cname, s.city from salespeople s, Customers c
 where s.city = c.city
 
 
 
commit;




Select (select rownum as rnum,emp_id, first_name,salary from employee
group by emp_id, first_name,rownum
order by salary DESC)
from employee
where rnum = 2

SELECT * FROM (
    SELECT inner_table.*, ROWNUM as rnum
    FROM (
        SELECT emp_id, first_name, salary
        FROM employee
        ORDER BY salary DESC
    ) inner_table
    WHERE ROWNUM <= 2 
)
WHERE rnum = 2;
