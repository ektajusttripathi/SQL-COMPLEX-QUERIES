select [First name]+ ' '+ [Last name] as [Name]
from ['Employee fuzzy$']

-- write a query to give an employee whose name is Ekta

select *
from ['Employee fuzzy$']
where [First name]= 'Ekta'

--Get all employees whose name starts with 'A'

select *
from ['Employee fuzzy$']
where [First name] like 'a%'

--Get the employee details whose first name contains 'V'

select *
from ['Employee fuzzy$']
where [First name] like '%v%'

--get employee details whose first name ends with 'u'

select *
from ['Employee fuzzy$']
where [First name] like '%u'

--get employee details whose first name starts with any character between A-P

select *
from ['Employee fuzzy$']
where [First name] like '[a-p]%'

--get employee details whose first name not starts with any character between a-p

select *
from ['Employee fuzzy$']
where [First name] like '[^a-p]%'

--get all details from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. 

select *
from ['Employee fuzzy$']
where Gender like '__le'

--Get all employee detail from EmployeeDetail table whose "FirstName" start with 'v' and contain 5 letters.

select *
from ['Employee fuzzy$']
where [First name] like 'v%' and LEN([First name]) = 5


--Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as". 

select *
from ['Employee fuzzy$']
where [First name] like '%[%]%'

--Get all unique "Department" from EmployeeDetail table. 

select distinct([Department])
from ['Employee fuzzy$']

Get the highest "Salary" from EmployeeDetail table. 

select *
from ['Employee fuzzy$']

select MAX(Salary) as Highest_Salary
from ['Employee fuzzy$']


--Show joining date in "dd/mm/yyyy" format, ex - "15 feb 2013"

SELECT FORMAT([Joining date], 'dd MMM yyyy') AS Formatted_Joining_Date
from ['Employee fuzzy$']

--Get the year of the joining date of the employees

select [First name], [Last name], DATEPART(Year, [Joining date])
from ['Employee fuzzy$']


Get only month part of the joining date

select [First name], [Last name], DATEName(Month, [Joining date])
from ['Employee fuzzy$']


Get system date

select Format(GETDATE(), 'dd MM yyyy')

--Get the first name, last name, current date, joiningdate and diff between current date and joining date in months.

select [First name], [Last name], GETDATE() as [Current_Date], [Joining date], DATEDIFF(Month, [Joining date], getdate()) as Months_Diff
from ['Employee fuzzy$']

-- Get the first name, current date, joiningdate and diff between current date and joining date in days. 

select [First name], [Last name], GETDATE() as [Current_Date], [Joining date], DATEDIFF(DAY, [Joining date], getdate()) as days_Diff
from ['Employee fuzzy$']

--Get all employee details from EmployeeDetail table whose joining year is 2013. 

select *
from ['Employee fuzzy$']
where DATEPART(Year, [Joining Date]) = '2013'

--Get all employee details from EmployeeDetail table whose joining month is Jan(1). 

select *
from ['Employee fuzzy$']
where DATEname(Month, [Joining date]) = 'January'


-- Get all employee details from EmployeeDetail table whose joining date between "2013-01-01" and "2013-12-01"

select *
from ['Employee fuzzy$']
where [Joining date] between '2013-01-01' AND '2013-12-01'


--Get how many employee exist in "EmployeeDetail" table. 

select COUNT([Employee ID]) as Total_Employee
from ['Employee fuzzy$']


-- Select only one/top 1 record from "EmployeeDetail" table. 

select top 1* 
from ['Employee fuzzy$']


--Select first name from "EmployeeDetail" table after removing white spaces from right side 


select RTRIM([First name]) as First_NAme
from ['Employee fuzzy$']



--JOIN RElATED QUESTIONS

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already. 

select [First name], [Project Name]
from ['Employee fuzzy$']A INNER JOIN ['Project detials$']B
on A.[Employee ID] = B.[Employee detail ID]
order by [First name]


select *
from ['Project detials$']


--Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project. 

select [First name], [Project name]
from ['Employee fuzzy$']A left outer join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail ID]
order by [First name]

--Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned". 

select [First name], ISNULL([Project name], 'No project assigned')
from ['Employee fuzzy$']A left outer join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail id]
order by [First name]


--Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail". 

select [First name], [Project name], [Employee detail id]
from ['Employee fuzzy$']A right outer join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail id]
order by [First name]

-- Write a query to find out the employeename who has not assigned any project, and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]).


select [First name], ISNULL([Project name], 'No project assigned')
from ['Employee fuzzy$']A left outer join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail id]
where [Project name] is null


--Write a query to find out the project name which is not assigned to any employee (tables :- [EmployeeDetail],[ProjectDetail]). 

select [Project name]
from ['Employee fuzzy$']A right outer join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail id]
where [First name] is null

--Write down the query to fetch EmployeeName & Project who has assign more than one project. 

select [First name], [Project name], [Employee ID]
from ['Employee fuzzy$']A inner join ['Project detials$']B
on A.[Employee ID] = B.[Employee detail id]
where [Employee ID] in (select [Employee detail id] FROM ['Project detials$'] 
GROUP by [Employee detail id] HAVING COUNT(*) >1 ) 


--Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName. 


select E.[First name], P.[Project name]
from ['Project detials$']P inner join ['Employee fuzzy$']E
on E.[Employee ID] = P.[Employee detail id]
where P.[Project name] in (select [Project name] FROM ['Project detials$'] 
GROUP by [Project name] HAVING COUNT(*) >1 ) 


select *
from ['Employee fuzzy$']

select *
from ['Project detials$']


