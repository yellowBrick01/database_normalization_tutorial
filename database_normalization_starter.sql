/*
This file provides all the code needed to follow the power point presentation.
Here are the information about the platform for this tutorial:
    SQL Version: SQLite
	Platform: SQLite Studio

Table of Contents: 
   Section 01: Creating an unnormalized table
       Lines: 18--74
   Section 02: Normal Form 01
       Lines: 76--141
   Section 03: Normal Form 02
       Lines: 143-175
   Section 04: Normal Form 03
       Lines: 177--216
*/

--Section 01
--The code to make an unnormalized table
CREATE TABLE student (
    cin INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
    school_address INTEGER, 
    skill TEXT,
    how_hard_is_skill TEXT
)
;
--The code to insert values into the unnormalized student table
INSERT INTO student (cin,
    first_name, 
    last_name, 
    school_id, 
    school_address, 
    skill, 
how_hard_is_skill)
VALUES('123456789',
    'Tom',
    'King',
    '145789022',
    '2259 NotReal Ave.',
    'English Java SQL',
'VE E H'); ​

INSERT INTO student(cin,
    first_name, 
    last_name, 
    school_id, 
    school_address, 
skill, how_hard_is_skill)
VALUES('222444666',
    'Sam',
    'Pam',
    '100200300',
    '1234 Fake St.',
    'Python',
'VH');

INSERT INTO student (cin,
    first_name, 
    last_name, 
    school_id, 
    school_address, 
skill, how_hard_is_skill)
VALUES('111222333',
    'Kate',
    'Late',
    '999888777',
    '4321 Noname Ave.',
    'HTML', 
'E'); 
--To test of unnormalized student table
SELECT * FROM student;

--Section 02
/*The code to revise the student table to drop the 2 columns(skill, how_hard_is_skill) 
& create a new table  called 'student_has_skill' to host information about the  students' skills.
Tasks to be performed:
   1) Drop the student table
   2) Recreate the student table as 'student'  
   3) Create a new table called 'student_has_skill'
   4) Insert values into the two tables
Goal: First Normal Form
*/
DROP TABLE student;
CREATE TABLE student(cin INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    school_id INTEGER,
school_address INTEGER);
CREATE TABLE student_has_skill(cin INTEGER,
    skill TEXT,
how_hard_is_skill TEXT);
INSERT INTO student (cin,
    first_name, 
    last_name, 
    school_id, 
school_address)
VALUES('123456789',
    'Tom',
    'King',
    '145789022',
'2259 NotReal Ave.'); ​

INSERT INTO student_has_skill(cin, skill, how_hard_is_skill)
VALUES('123456789', 'English', 'VE');
INSERT INTO student_has_skill(cin, skill, how_hard_is_skill)
VALUES('123456789', 'Java', 'E');
INSERT INTO student_has_skill(cin, skill, how_hard_is_skill)
VALUES('123456789', 'SQL', 'H');

INSERT INTO student(cin,
    first_name, 
    last_name, 
    school_id, 
    school_address)
VALUES('222444666',
    'Sam',
    'Pam',
    '100200300',
'1234 Fake St.');

INSERT INTO student_has_skill(cin, skill, how_hard_is_skill)
VALUES('222444666', 'Python', 'VH');

INSERT INTO student (cin,
    first_name, 
    last_name, 
    school_id, 
    school_address)
VALUES('111222333',
    'Kate',
    'Late',
    '999888777',
'4321 Noname Ave.');
INSERT INTO student_has_skill(cin, skill, how_hard_is_skill)
VALUES('111222333', 'HTML', 'E');
--To test our two new tables
SELECT * FROM student;
SELECT * FROM student_has_skill;

--Section 03
/*The code to revise the student_has_skill to drop the column how_hard_is_skill 
and add a new column 'how_good_is_student'. 
We will create a new table called skill to include the all the information about the skilll.
Tasks to be performed:
   1) Drop the student_has_skill table
   2) Recreate the student_has_skill  table
   3) Create a new table called 'skill'
   4) Insert values into the two tables
Goal: Second Normal Form
*/

DROP TABLE IF EXISTS student_has_skill;--Drops the old table
--To create our new tables
CREATE TABLE IF NOT EXISTS student_has_skill(cin INTEGER, skill_name TEXT, how_good_is_student TEXT);
CREATE TABLE IF NOT EXISTS skill(skill_name TEXT, category TEXT, how_hard_is_skill TEXT);
--To insert data into the skills table
INSERT INTO skill (skill_name, category, how_hard_is_skill) values ('English','Language', 'VE');​
INSERT INTO skill (skill_name, category, how_hard_is_skill) values ('Java', 'Programming', 'E');
INSERT INTO skill (skill_name, category, how_hard_is_skill) values ('SQL', 'Programming', 'H');
INSERT INTO skill (skill_name, category, how_hard_is_skill) values ('Python', 'Programming', 'VH');​
INSERT INTO skill(skill_name, category, how_hard_is_skill) values ('HTML', 'Programming', 'E');

INSERT INTO student_has_skill(cin, skill_name, how_good_is_student) VALUES ('111222333', 'HTML', 'VG');
INSERT INTO student_has_skill(cin, skill_name, how_good_is_student) VALUES ('222444666', 'Python', 'G');
INSERT INTO student_has_skill(cin, skill_name, how_good_is_student) VALUES ('123456789', 'SQL', 'B');
INSERT INTO student_has_skill(cin, skill_name, how_good_is_student) VALUES ('123456789', 'Java', 'VB');
INSERT INTO student_has_skill(cin, skill_name, how_good_is_student) VALUES ('123456789', 'English', 'VG');

--To test our tables
Select * from skill;
select * from student_has_skill;
select * from student;

--Section 04
/*The code to revise the student table to drop the columns ('school_id', 'school_address') 
We will create a new table called school to include the all the information about the school.
Tasks to be performed:
   1) Drop the student table
   2) Recreate the student table  
   3) Create two new tables called 'school' & 'student_school'
   4) Insert values into the two tables
Goal: Third Normal Form
*/

DROP TABLE IF EXISTS student;--To drop the old student table
--Code to create the new student and insert data.
CREATE TABLE IF NOT EXISTS student_tn (cin INTEGER, first_name TEXT, last_name TEXT);
INSERT INTO student_tn (cin, first_name, last_name) VALUES ('111222333', 'Kate', 'Late');
INSERT INTO student_tn (cin, first_name, last_name) VALUES ('222444666','Sam','Pam');
INSERT INTO student_tn (cin, first_name, last_name) VALUES('123456789', 'Tom', 'King');

--Code to create the new school table and insert data.
CREATE TABLE IF NOT EXISTS school(school_id INTEGER, school_name TEXT, school_address TEXT, mascot TEXT);
INSERT INTO school(school_id, school_name, school_address, mascot) VALUES ('100200300', 'Flat Mesa High', '1234 Fake St.', 'Mesa Raiders');
INSERT INTO school(school_id, school_name, school_address, mascot) VALUES ('999888777', 'Microsoft High', '4321 Noname Ave.', 'Windows OS');

--Code to create the assocaitve table and insert data.
CREATE TABLE IF NOT EXISTS student_school(cin INTEGER, school_id INTEGER);
INSERT INTO student_school (cin, school_id) VALUES ('123456789', '145789022');
INSERT INTO student_school (cin, school_id) VALUES ('222444666', '100200300');
INSERT INTO student_school (cin, school_id) VALUES ('111222333', '999888777');

 --Query to test our fully normalize table.
SELECT student_tn.cin, first_name AS Name, 
    school.school_name AS School, 
    school.mascot, 
    student_has_skill.skill_name AS skill, 
    student_has_skill.how_good_is_student AS proficiency,
    skill.how_hard_is_skill AS diffculty
FROM student_tn JOIN student_school ON student_tn.cin = student_school.cin
    JOIN school ON student_school.school_id = school.school_id
    JOIN student_has_skill on student_tn.cin = student_has_skill.cin
    JOIN skill on skill.skill_name = student_has_skill.skill_name;