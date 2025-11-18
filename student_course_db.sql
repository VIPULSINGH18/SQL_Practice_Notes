

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100)
);

INSERT INTO students(student_id,student_name)
VALUES(1,'Akarsh'),
	  (2,'Vipul'),
	  (3,'Sudhanshu');
	  
CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100)
);

INSERT INTO courses(course_id,course_name)
VALUES(101,'Python'),
	  (102,'SQL'),
	  (103,'PowerBI');

/*both of the table is having many to many relationship so we will make third table as a junction*/

CREATE TABLE student_courses (
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id))

ALTER TABLE student_courses
ADD CONSTRAINT fk_student_id FOREIGN KEY(student_id)
REFERENCES students(student_id);

ALTER TABLE student_courses
ADD CONSTRAINT fk_course_id FOREIGN KEY(course_id)
REFERENCES courses(course_id);

INSERT INTO student_courses (student_id, course_id) VALUES
(1, 101), (1, 102), (2, 101), (2, 103), (3, 102);

SELECT * FROM student_courses

/*Q1*/
/*printing all the students along with course taken*/
SELECT s.student_name,c.course_name FROM student_courses sc
JOIN students s
ON sc.student_id=s.student_id
JOIN courses c
ON c.course_id=sc.course_id

/*q2*/ 
/*print course taken by vipul only*/

SELECT s.student_name,c.course_name FROM student_courses sc
JOIN students s
ON sc.student_id=s.student_id
JOIN courses c
ON c.course_id=sc.course_id
WHERE s.student_name='Vipul';


/**********************************/









