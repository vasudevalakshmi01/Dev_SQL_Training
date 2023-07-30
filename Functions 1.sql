----SCALAR VALUED FUNCTIONS----
Create Function add_Function(@num1 as int,@num2 as int)
RETURNS int
AS
BEGIN
RETURN(@num1+@num2)
END
select dbo.add_Function(19,4) as sum1

Create Function sub_Function(@num1 int,@num2 int)
RETURNS int
AS
BEGIN
RETURN(@num1 - @num2)
END
select * , dbo.sub_Function(19,4) as sub1 from Persons

----TABLE VALUED FUNCTIONS----
SELECT * FROM Student_Stored_Procedure ---To know the table data

create function select_course(@course varchar(20))
RETURNS table
AS
RETURN(
select * from Student_Stored_Procedure where Student_Course=@course
)
select * from dbo.select_course('B.tech')

create function Get_PersonByCourse(@course varchar(20))
RETURNS @newtable table(Fname varchar(20),Age int,coursename varchar(20))
AS
Begin
	insert into @newtable
	select Student_Name,Student_Age,Student_Course from Student_Stored_Procedure where Student_Course = @course
RETURN
End
select * from [dbo].[Get_PersonByCourse]('B.tech')

