/*Multi Line
Comment */
----Where > group by > having > order by 
--view the database--
SELECT name
FROM sys.databases;
create database testdb --create a database
drop database databasename; --deleta a database
Select * from Persons;

create table emp(Fname varchar(10),age int,salary int) --create a table
describe emp --describe the details of the table
drop table Persons --delete the table

create table Employee as Select Fname,age from emp -- create a new table with the existing table
rename table Employee to emp1 --rename a table
insert into Persons values('Sai','Pratap',13)

insert into emp(Fname,age) values('Pratap',15) --If we want to insert only 2 values

Delete from emp where age<18  --delete a record

truncate table from emp  -- delete all the records permanently we can't rollback

Update emp SET Fname="Pratap",salary=25000 where age=12 --update a record

select * from emp where salary IS NULL -- Retrives NULL Value records

select * from emp where salary IS NOT NULL -- Retrives records except NULL Value records
---Alter is used for columns ---
alter table emp add Location varchar(10)  --Add a column 
alter table emp modify column Location varchar(15) -- Modify a column 
alter table emp rename column Fname to Lname    --Rename a column 
alter table emp drop column age    -- Delete a column

select count(CustomerName),Country from Customers group by Country
select count(CustomerName) as CC,Country from Customers
group by Country having CC>3 --Having will be used with group by only
----Where > group by > having > order by ----
select count(CustomerName) as CC,Country from Customers
group by Country having CC>3 order by CC

Select C.CustomerName,P.ProductName from Customers C,Products P
Where C.CustomerID = P.ProductID
Select * from Customers Where Country In('Germany','Mexico','UK','USA') -- IN
--Single line sub query--
SELECT * FROM Customers where Country =(Select Country from Customers Where CustomerName ="Toms Spezialitäten")
--2nd Max Price--
select max(Price) from Products where Price<(select max(Price) from Products)

SELECT * FROM Customers
where country like '_S_' --USA

SELECT * FROM Customers
where country like 'S%N' --SPAIN
SELECT * FROM Customers
WHERE City IN ('Paris','London');

SELECT * FROM Products
WHERE Price BETWEEN 50 AND 60;

select city,length(city) as length from customers --display the length of each city name
SELECT * FROM Customers
ORDER BY CustomerID ASC limit 6; --displayes only 6 lines

SELECT * FROM Customers limit 2,6; --After 2nd record display 6 records

select SUBSTR('VASUDEVA',5,4)  -- PRINTS DEVA

select city,INSTR(city,'e') as position from Customers --prints the position of 'e'

select CONCAT('SAI',' ','PRATAP')  --PRINTS SAI PRATAP
select TRIM('  SAI PRATAP    ')  --SPACES WILL REMOVE BEFORE AND AFTER THE TEXT
select trim('a' from 'aruana')---a will be removed from edges output will be ruan
select trim ('n' from columnname) from tablename ---
select GREATEST(9,3,4,5,0,22,76,-5) , LEAST(9,3,4,5,0,22,76,-5) -- PRINTS GREATEST AND LEAST VALUES
select TRUNCATE(983.546,1) --PRINTS 1 DECIMAL VALUE

select curdate() --return date 
select current_date() --return date 

select current_time() --return time
select curtime()--return time

select now() --return both date and time
select sysdate() --return both date and time


----1.NOT NULL Constraint----
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;

----2.Unique Constraint----
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID,LastName)
);

----3.Primary Key Constraint----
CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

CREATE TABLE Persons (
    ID int ,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

ALTER TABLE Persons DROP PRIMARY KEY;

----4.Foreign Key Constraint----
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

----5.Check Constraint----
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Country varchar(30) CHECK(Country in('UK','USA','India'))
);

----6.Default Constraint----
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Ongole' ---If any value is not inserted in City column by default Ongole will be inserted
);

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';
--Drop the constraint--
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

---AUTO_INCREMENT will be done only for only Primary Key---

CREATE TABLE Persons (
    Id int IDENTITY(10,2) PRIMARY KEY, --start with 10 and increment by 2
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

---INSERT INTO SELECT ---Data will be copied from Suppliers to Customers
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

--- SELECT INTO Statement--- Data will be copied from Customers to CustomersBackup
SELECT * INTO CustomersBackup
FROM Customers;

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';

---AS Keyword---Data will be copied from Places to newtable
Create table newtable as 
Select FName,City  from Places

---IFNULL Function -- If Price is NULL then it will take 0 ---
SELECT ProductName, IFNULL(Price, 0)+1000)
FROM Products;

---CASE Example---
SELECT OrderID, Quantity,
CASE
WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText,ProductID
FROM OrderDetails;

SELECT * FROM Customers
Where City= (CASE
WHEN City IS NULL THEN Country
ELSE City
END);

---Delimiter usage in Stored Procedures---
Delimiter //
create procedure Newprocedure()
AS
Begin
Select * from Products;
End//
Exec Newprocedure()

---Indexes---
---If a column has unique or primary constraint, index will be automatically created---
Select * from consumers
create index index1 on consumers(consumertype)
show indexes from consumers

--Grant--
grant select on emptable to user1  --Given permission for only select statement
grant select,insert,update,create,drop,delete on emptable to user1
---revoke the permissions from the user---
revoke select,insert on emptable from user1
---Temporary table---Until we close the SQL it will work
create temporary table temtable(id int,Fname varchar(15));
---Show---
show columns from tablename;
show indexes from tablename;
show privileges;
show grants for 'user1';




