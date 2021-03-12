CREATE TABLE teachers
 (
Teacher_Id int not null PRIMARY KEY,
First_Name varchar(15),
Last_Name Varchar(15),
Telephone_Number varchar(11), 
Email_Id varchar(20)
);

CREATE TABLE Teachers_Course_Detail 
(
Course_Detail_Id int not null PRIMARY KEY ,
Teacher_Id int not null,
FOREIGN KEY (Teacher_Id) REFERENCES teachers(Teacher_Id)
);

CREATE TABLE educations 
( 
Education_Id int NOT NULL PRIMARY KEY , 
Education_Name varchar(20), 
Total_Points int
);

CREATE TABLE courses 
(
Course_Id int not null PRIMARY KEY,
Course_Name varchar(20),
Points int, 
Education_Id int ,
FOREIGN KEY (Education_Id) REFERENCES Educations (Education_Id)
);

CREATE TABLE Course_Detail 
(
Course_Detail_Id int not null PRIMARY KEY,
Course_Id int not null,
Teacher_Id int not null,
Responsible_Teacher varchar(20),
Start_Date date,
End_Date date,
Projects_Numbers int,
FOREIGN KEY (Course_Id) REFERENCES courses(Course_Id),
FOREIGN KEY (Teacher_Id) REFERENCES teachers(Teacher_Id)
);

CREATE TABLE Students
(
Personal_Number int not null PRIMARY KEY UNIQUE,
Student_Name varchar(20) not null,
Telephone_Number varchar(11), 
Email_Id varchar(29),
Education_Id int,
FOREIGN KEY (Education_Id) REFERENCES educations(Education_Id)
);

CREATE TABLE City
(
City_Id int not null PRIMARY KEY,
City_Name Varchar(20) not null UNIQUE
);

CREATE TABLE Other_Employees
(
Employee_Id int not null PRIMARY KEY,
Employee_Name varchar(20) not null,
Designation char,
Telephone_Number varchar(11),
Email_Id varchar(20),
City_Id int,
FOREIGN KEY (City_id) REFERENCES City (City_id)
);

CREATE TABLE Teacher_Course 
(
Course_Detail_Id int,
Teacher_Id int PRIMARY KEY,
FOREIGN KEY (Course_Detail_Id) REFERENCES course_detail (Course_Detail_Id),
FOREIGN KEY (Teacher_Id) REFERENCES teachers(Teacher_Id)
);

CREATE TABLE  education_city
(
Education_Id int PRIMARY KEY,
City_Id int,
FOREIGN KEY (Education_Id) REFERENCES educations(Education_Id),
FOREIGN KEY (City_Id) REFERENCES city(City_Id)
);

CREATE TABLE  Grade
(
Personal_Number int PRIMARY KEY,
Course_Detail_Id int,
Grade int,
Grade_Date Date,
FOREIGN KEY (Personal_Number) REFERENCES students(Personal_Number),
FOREIGN KEY (Course_Detail_Id) REFERENCES course_detail(Course_Detail_Id)
);

CREATE TABLE inactive_Students
(
Personal_Number int not null PRIMARY KEY UNIQUE,
Student_Name varchar(20) not null,
Telephone_Number varchar(11), 
Email_Id varchar(29),
Education_Id int,
FOREIGN KEY (Education_Id) REFERENCES educations(Education_Id)
);


DELIMITER $$

CREATE TRIGGER Student_Delete
    AFTER delete
    ON students
    FOR EACH ROW
BEGIN
  INSERT INTO messages(message) VALUES ('data delete');
END
$$



insert into educations values
(101, "Digital Marketing", 375);
insert into educations values
(102, "Backend Developer", 350);
insert into educations values
(103, "IOT Technology", 350);
insert into educations values
(104, "Frontend", 350);
insert into educations values
(105, "CNC Operator", 350);
insert into educations values
(106, ".Net Developer", 380);
insert into educations values
(107, "Digital Marketing", 375);

Insert into students values 
(19851205-4563, "Saurabh Chauhan", 734940043, "Saurabh311@gmail.com", 101);
Insert into students values 
(19911215-7486, "Veena Rani", 734940345, "Veena22@gmail.com", 102);
Insert into students values 
(19960415-5986, "Anders", 726580345, "AndersMor@gmail.com", 107);
Insert into students values 
(19960921-8486, "Jens", 726580345, "Jenchan@gmail.com", 105);
Insert into students values 
(198910246-6422, "Netali", 726580345, "Netalir@gmail.com", 102);
Insert into students values 
(19821415-5106, "Jemin", 726585615, "JsndersMor@gmail.com", 106);
Insert into students values 
(19851417-2106, "Maria", 726533345, "Mariar@gmail.com", 105);



Insert into city values 
(1, "Stockholm");
Insert into city values 
(2, "Gothenborg" );
Insert into city values 
(3, "Malmo");
Insert into city values 
(4, "Lund" );
Insert into city values 
(5, "Helsingborg" );
Insert into city values 
(6, "Karlskrona" );
Insert into city values 
(7, "Lullia" );

Insert into teachers value 
(1101, "Annika", "Ross", 773467430, "Annika@gmail.com");
Insert into teachers value 
(1102, "Chritiana", "Ronne", 723467434, "Christina@gmail.com");  
Insert into teachers value 
(1103, "Erfan", "khan", 733467837, "Erfan344@gmail.com");  
Insert into teachers value 
(1104, "Markus", "Jhonnson", 733974837, "Markus2@gmail.com");  
Insert into teachers value 
(1105, "Steve", "Waghe", 723956839, "Steve_wagh@gmail.com");  
Insert into teachers value 
(1106, "Bratt", "Lee", 743956672, "Lee_bratt@gmail.com");
Insert into teachers values
(1107, "Peter", "Chen", 745643884, "peter002@gmail.com");


Insert into education_city values 
(101, 1);
Insert into education_city values 
(102, 2);
Insert into education_city values 
(103, 3);
Insert into education_city values 
(104, 4);
Insert into education_city values 
(105, 5);
Insert into education_city values 
(106, 6);
Insert into education_city values 
(107, 7);



Insert into courses values
(1001, "Java", 20, 102);
Insert into courses values
(1002, "Web Marketing", 20, 107);
Insert into courses values
(1003, "C++", 20, 106);
Insert into courses values
(1004, "CAD", 20, 105);
Insert into courses values
(1005, "JavaScript", 20, 104);
Insert into courses values
(1006, "React", 20, 104);
Insert into courses values
(1007, "Spring", 20, 102);
Insert into courses values
(1008, "MySql", 20, 102);
Insert into courses values
(1009, "Economics", 20, 101);
Insert into courses values
(1010, "Corporate Commun", 20, 101);
Insert into courses values
(1011, "Business Law", 20, 101);
Insert into courses values
(1012, "HTML & CSS", 20, 104);

Insert into course_detail values
(501, 1001, 1101, "Annika Ross", "2020-08-28", "2022-06-1", 25);
Insert into course_detail values
(502, 1002, 1102, "Chritiana Ronne", "2020-09-02", "2022-05-1", 22);
Insert into course_detail values
(503, 1003, 1103, "Erfan Khan", "2019-09-02", "2021-05-1", 22);
Insert into course_detail values
(504, 1004, 1104, "Markus Jhonnson", "2020-09-02", "2022-05-1", 22);
Insert into course_detail values
(505, 1005, 1105, "Steve Wagh", "2020-08-21", "2022-05-15", 24);
Insert into course_detail values
(506, 1006, 1106, "Bratt Lee", "2020-08-28", "2022-06-12", 25);
Insert into course_detail values
(507, 1007, 1107, "Peter Chen", "2020-08-28", "2022-06-12", 25);


insert into teacher_course values
(501, 1101);
Insert into teacher_course values
(502, 1102);
Insert into teacher_course values
(503, 1103);
Insert into teacher_course values
(504, 1104);
Insert into teacher_course values
(505, 1105);
Insert into teacher_course values
(506, 1106);
Insert into teacher_course values
(507, 1107);



DELIMITER $$
CREATE VIEW Brief_Details as
Select s.Personal_Number, s.Student_Name, c.Course_Name, e.Education_Name, cd.Responsible_Teacher, cd.Start_Date, cd.End_Date
FROM students s INNER JOIN educations e on s.Education_Id=e.Education_Id
inner join courses c on c.Education_Id=e.Education_Id
inner join education_city ec on ec.Education_Id= e.Education_Id
inner join course_detail cd on cd.Course_Id=c.Course_Id;
$$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE MoveTo_InactiveStudent_ByName (in name varchar(20))
BEGIN
INSERT INTO inactive_Students (Personal_Number, Student_Name, Telephone_Number, Email_Id, Education_Id)   
SELECT Personal_Number, Student_Name, Telephone_Number, Email_Id, Education_Id
FROM students WHERE Student_Name = name;

DELETE from students WHERE Student_Name = name;
END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE `Student_detail_byName`(In name varchar(20))
BEGIN
SELECT * from brief_details WHERE Student_Name=name;
END$$

DELIMITER ;
