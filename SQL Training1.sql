CREATE TABLE Persons (
    Id int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL UNIQUE,
    Age int CHECK (Age>=18),
    City varchar(20) DEFAULT 'Ongole' ---If any value is not inserted in City column by default Ongole will be inserted
);
Insert into Persons Values ('Roja','C',11,'Guntur')
Insert into Persons(Fname,Lname,Age) Values('Ravi','P',16)
select * from Persons
Delete from Persons where City = ''
Update Persons SET Fname='Pratap',City='Bhopal' where Age=19
Truncate table Persons
drop table Persons
select Fname from Persons

---CASE Example---
SELECT *,
CASE
WHEN Age > 30 THEN 'The age is greater than 30'
WHEN Age = 30 THEN 'The age is 30'
ELSE 'The age is under 30'
END AS AgeText
FROM Persons;

CREATE INDEX index_city ON Persons (City); 
Drop index Persons.index_city 
CREATE UNIQUE INDEX Lname_index ON Persons(Lname);  

select *,
case when City='Ongole' then 1
else 0 
End as Num
from Persons

