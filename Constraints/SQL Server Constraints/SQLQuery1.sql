--PRIMARY KEY Constraint

create table Department(DeptID int PRIMARY KEY, DeptName varchar(50))

insert into Department values(10,'DBA'),(11,'HR'),(12,'QA')

--insert into Department values(10,'DBA')			--Violation of PRIMARY KEY constraint 

insert into Department values(14,'DBA')

select * from Department

--FOREIGN KEY Constraint

create table EMPLOYEE(EmpID int, EmpName varchar(50), Salary money, DeptID int FOREIGN KEY REFERENCES Department(DeptID))

insert into Employee values(101,'Rohit',30000,10)

insert into Employee values(102,'Krishna',20000,11)

--insert into Employee values(103,'Randy',30000,14)			--conflicted with the FOREIGN KEY constraint

insert into Employee values(104,'Srinu',20000,11)			--Duplicate DeptID

select * from Employee

--Default Constraint

CREATE TABLE Student(StdID int NOT NULL, FirstName varchar(50), LastName varchar(50), DateOfBirth date DEFAULT GETDATE())

insert into Student(StdID,FirstName,LastName) values(101,'Rohit','Dasari'),(102,'Gopi','Bhai'),(103,'krish','M')

select * from Student

--UNIQUE Constraint

CREATE TABLE Customer(CId int UNIQUE, CName VARCHAR(30), Emailid VARCHAR(50) UNIQUE)

insert into Customer values(101,'Srinu','srinu@gmail.com')

--insert into Customer values(102,'Rohit','srinu@gmail.com')			--Violation of UNIQUE KEY constraint

select * from Customer

--NOT NULL Constraint

insert into Student(StdID,FirstName,LastName) values(null,'Rohit','Dasari')			--Cannot insert the value NULL into column 'StdID'

insert into Student(StdID,FirstName,LastName) values(101,'Rohit','Dasari')

select * from Student

--CHECK KEY Constraint

--Column Level
CREATE TABLE Client(Client_ID INT NOT NULL CHECK(Client_ID BETWEEN 0 AND 10), Client_name VARCHAR(30) NOT NULL)

insert into Client values(1,'Rohit'),(2,'Krish')

insert into Client values(11,'Randy')				--The INSERT statement conflicted with the CHECK constraint

select * from Client

--ALTER Table Level
Alter table Client Add constraint Cons_Name Check(Client_ID<10) 

--to drop constraint
ALTER TABLE Client DROP CONSTRAINT Cons_Name
