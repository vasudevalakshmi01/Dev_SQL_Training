---If Else ---
---EVEN or ODD---
Declare @count int
Declare @reminder int
Set @count=1
While(@count<=10)
Begin 
Set @reminder=@count%2
if(@reminder=0)
print Concat(@count,' is Even')
else
print Concat(@count,' is Odd')
Set @count+=1
End

---While ---
Declare @count int =1
Declare @Table1 int =4
while(@count<=10)
Begin print Concat(@Table1,'*',@count,'=',@Table1*@count)
	Set @count+=1
	if @count=5
	Break
End


SELECT * FROM Student_Stored_Procedure  