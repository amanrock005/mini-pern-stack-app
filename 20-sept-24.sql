-- what are the 5 different type of sql commands
   DDL, DML, DQL, TCL, DCL
   data definition language
   data manipulation language
   data query language
   transaction control language
   data control language
   
-- create a table with primary key at row level and column level. explain the difference?
   create table employees1(
    emp_id int primary key,
    emp_name varchar2(20)
   );
   
   create table employees2(
    emp_id int,
    emp_name varchar2(20),
    primary key (emp_id)
   );

-- create a table with foreign key
   create table employees3(
    emp_id int primary key,
    emp_name varchar2(20),
    dept_id int,
    foreign key (dept_id) references department(dept_id)
   );

-- create a table with unique constraint
   create table employees4(
    emp_id int primary key,
    emp_name varchar2(20),
    email varchar2(20) unique
    dept_id int,
    foreign key (dept_id) references Departments(dept_id)
   );
   
-- create a table with default constraint
   
-- create a table with autoincrement of primary key
-- create a table with check constraint for salary>0


-- what is the difference between the truncate and delete statement
   Truncate removes all rows from a table
   resets any identity column
   It is DDL operation
   Delete removes rows based on a condition or all the rows if the condition is not mentioned
   It does not reset identity columns
   DML operation
   
-- does the truncate statement fire triggers or execute constraints like on delete cascade on a table? why or why not?
   no truncate does not fire trigger or on delete cascade. It is DDL operation- and does not log deletion- 
   so it bypass triggers

-- explain how truncate afffects the identify column in a table. does it reset the value of the identity column
   yes truncate resets the identity column. This means that if a table has an
   identity column, the next time a row is inserted after truncate, the identity value 
   will start again from the seed value (usually 1)

-- can you truncate a table that has a foreign key relationship with another table? why or why not? what precautions should be taken?
   no you cannot truncate a table that is referenced by a foreign key in another table.
   
   
-- can truncate be rolled back in a transaction? how does this differ from delete?
   yes they can be rolled back. Truncate are part of transactional operation
   if the transaction is not yet commited you can roll truncate.
