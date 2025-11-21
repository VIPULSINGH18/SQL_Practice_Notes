/* Creating Two Tables*/

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE student_profiles (
  student_id INT PRIMARY KEY,
  address TEXT,
  age INT,
  phone VARCHAR(15)
);

INSERT INTO students (name)
VALUES
('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta');

INSERT INTO student_profiles (student_id, address, age, phone)
VALUES
(1, 'Delhi, India', 22, '9999999999'),
(2, 'Mumbai, India', 21, '8888888888'),
(3, 'Bangalore, India', 23, '7777777777');

SELECT * FROM students
SELECT * FROM student_profiles


/* ONE TO ONE RELATIONSHIP*/

/*in one to one relationship both table is having one commom  column and both columns are equal in nature*/

ALTER TABLE student_profiles
ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) /*convering primary of second table into foreign key*/
REFERENCES students(student_id); /*connecting both the table using primary key of T1 and foreign key of T2*/

/*After connection we perform Join operation on both the table*/

SELECT s.student_id, s.name, sp.address, sp.age, sp.phone
FROM students s
JOIN student_profiles sp 
ON s.student_id = sp.student_id;


/* ONE TO MANY RELATIONSHIP*/

/*creating table*/

CREATE TABLE student (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE marks (
  mark_id SERIAL PRIMARY KEY,
  student_id INT,
  subject VARCHAR(50),
  marks INT
);

/*inserting data*/
INSERT INTO student (name)
VALUES ('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta'),('Vipul Singh'),('Sudhanshu');

INSERT INTO marks (student_id, subject, marks)
VALUES
(1, 'English', 85), (1, 'Math', 89), (1, 'Science', 92),
(2, 'English', 80), (2, 'Math', 75), (2, 'Science', 78),
(3, 'English', 72), (3, 'Math', 70), (3, 'Science', 74);

INSERT INTO marks(student_id,subject,marks)
VALUES(5,'Hindi',90);


SELECT * FROM student
SELECT * FROM marks

ALTER TABLE marks
ADD CONSTRAINT student_id_fk FOREIGN KEY(student_id)
REFERENCES student(student_id);

SELECT *
FROM student st
JOIN marks m
ON st.student_id = m.student_id;




/* now we have multiple types of join function
	Left join(print all the rows of the left table) 
	Rigt join(print all the rows of the right table) 
	Inner join(print only matching rows between T1 and T2)
	Full join(print all the rows and handle with null values if data is not available)
	Cross join( this function is going to print all the permutation and combination of the data of both th table)
*/


/*Inner join*/
SELECT st.name, m.subject,m.marks
FROM student st
JOIN marks m
ON st.student_id = m.student_id;

/*left join*/
SELECT *
FROM student st
LEFT JOIN marks m
ON st.student_id = m.student_id;


/*right join*/
SELECT st.name, m.subject,m.marks
FROM student st
RIGHT JOIN marks m
ON st.student_id = m.student_id;


/*full join*/
SELECT *
FROM student st
FULL JOIN marks m
ON st.student_id = m.student_id;

/*cross join*/

SELECT *
FROM student st
CROSS JOIN marks m;

/*................................*/


