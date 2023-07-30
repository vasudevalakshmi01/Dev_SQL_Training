---Create a Table---
CREATE TABLE Student_Stored_Procedure  
(  
Student_ID INT NOT NULL,   
Student_Name varchar(100),  
Student_Course varchar(50),  
Student_Age INT,   
Student_Marks INT  
);   
INSERT INTO Student_Stored_Procedure VALUES (101, 'Anuj', 'B.tech', 20, 88);  
INSERT INTO Student_Stored_Procedure VALUES (102, 'Raman','MCA', 24, 98);  
INSERT INTO Student_Stored_Procedure VALUES (104, 'Shyam', 'BBA', 19, 92);  
INSERT INTO Student_Stored_Procedure VALUES (107, 'Vikash','B.tech', 20, 78);  
INSERT INTO Student_Stored_Procedure VALUES (111, 'Monu', 'MBA', 21, 65);  
INSERT INTO Student_Stored_Procedure VALUES (114, 'Jones', 'B.tech', 18, 93);  
INSERT INTO Student_Stored_Procedure VALUES (121, 'Parul', 'BCA', 20, 97);  
INSERT INTO Student_Stored_Procedure VALUES (123, 'Divya', 'B.tech', 21, 89);  
INSERT INTO Student_Stored_Procedure VALUES (128, 'Hemant', 'MBA', 23, 90);  
select * from Student_Stored_Procedure 

Drop Procedure Students2
---Create a Strored Procedure---
CREATE PROCEDURE Students
AS  
SELECT * FROM Student_Stored_Procedure  
GO;
EXEC Students
---Create a Strored Procedure With Multiple Parameters---
CREATE PROCEDURE Students2 @Student_Course varchar(30),@Student_Age int
AS  
SELECT * FROM Student_Stored_Procedure WHERE Student_Course=@Student_Course AND Student_Age=@Student_Age
GO;
EXEC Students2  @Student_Course = 'B.tech',@Student_Age = 20 
---Create a Strored Procedure With Single Parameter---
CREATE PROCEDURE Students3 @Student_Course varchar(30)
AS  
SELECT * FROM Student_Stored_Procedure WHERE Student_Course=@Student_Course
GO;
EXEC Students3  @Student_Course = 'B.tech';  

---Select
---Insert
---Update
---Delete
---Create a Table---
Drop table CURDSP
Create table CURDSP(ID int PRIMARY KEY, Fname varchar(30), Age int)
select * from CURDSP

Create Proc Employee_Management(@id int,@Empname varchar(40),@age int,@type varchar(30))
As
Begin
	if  @type='Select'
		select * from CURDSP
	if @type ='Insert'
		insert into CURDSP(ID,Fname,Age) values(@id,@Empname,@age)
	if @type='Update'
		Update CURDSP Set Fname=@Empname,Age=@age where ID=@id
	if @type='Delete'
		Delete from CURDSP where ID=@id
End

Exec Employee_Management 1,'Sai',19,'Insert'
Exec Employee_Management @id=02,@Empname='Sai',@age=19,@type='INSERT'
Exec Employee_Management 0,'',0,'SELECT'
Exec Employee_Management 1,'Pratap',35,'UPDATE'
Exec Employee_Management 1,'',0,'Delete'





