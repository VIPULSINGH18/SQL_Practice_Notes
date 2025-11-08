/* Now we are going to perform CRUD operation..*/


/*creating table*/

CREATE TABLE students(
student_id INT,
student_name char(20),
age   INT,
grade char(1)
);

/*inserting data*/

INSERT INTO students(student_id,student_name,age,grade)
values(1,'Vipul',21,'A'),
	  (2,'Sudhanshu',19,'A'),
	  (3,'Roshan',18,'A');

/*Reading table*/

SELECT * FROM students;

/* selecting any specific data*/

SELECT age FROM students
WHERE student_name = 'Vipul';


/* Updating values*/
UPDATE students
SET grade= 'B'
WHERE student_name= 'Roshan';

UPDATE students
SET student_id=1
WHERE student_name= 'Sudhanshu';

UPDATE students
SET student_id=2
WHERE student_name='Vipul'


/* deleting values from the table*/
/* either we can delete the whole table or we can delete the single row of a table*/

DELETE  FROM students
WHERE student_name='Vipul';


/* Data types in SQL*/

CREATE TABLE number(
id_1 SMALLINT(), /*2byte*/
id_2 BIGINT(),	/*8byte*/
id_3 INT(),		/*4byte*/
id_4 real,		/*4 decimal point*/
id_5 Serial		/*auto increment, we dont need to pass the value*/
id_6 Double Precision /*8 decimal points*/
id_7 NUMERIC(p,s)/*p stands for bytes and s stands for decimal points*/
id_8 CHAR(n) /* text of having fixed size == n*/
id_9 VARCHAR(n)/*text of having maximum size==n*/
id_9 TEXT()/* text having unlimited size*/

/* boolean, date,time,timestamp,timestampz are some of the data types that are also used*/
)



/* constraints*/

CREATE TABLE  random(
id_1 INTEGER PRIMARY KEY,
age SMALLINT NOT NULL,
email TEXT UNIQUE,
created_at date DEFAULT now()
)













