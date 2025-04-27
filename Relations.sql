CREATE DATABASE online_learning_systems
CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Role VARCHAR(100)
);

INSERT INTO Admin (Admin_ID, Name, Email, Role)
VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'Super Admin'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Admin'),
(3, 'Charlie Brown', 'charlie.brown@example.com', 'Moderator'),
(4, 'Diana Green', 'diana.green@example.com', 'Admin'),
(5, 'Evan White', 'evan.white@example.com', 'Super Admin');

select * from admin
OUTPUT:
/*
Admin_ID	   Name	                Email	                    Role
       1	Alice Johnson	 alice.johnson@example.com    	Super Admin
       2	Bob Smith	     bob.smith@example.com	          Admin
       3	Charlie Brown	 charlie.brown@example.com	     Moderator
       4	Diana Green	    diana.green@example.com	     Admin
       5	Evan White	    evan.white@example.com	     Super Admin
*/

CREATE TABLE Discount (
    Discount_ID INT PRIMARY KEY,
    Discount_Name VARCHAR(255) NOT NULL,
    Discount_Percentage DECIMAL(5,2) CHECK (Discount_Percentage BETWEEN 0 AND 100),
    Start_Date DATE,
    End_Date DATE
);
INSERT INTO Discount (Discount_ID, Discount_Name, Discount_Percentage, Start_Date, End_Date)
VALUES
(1, 'New Year Sale', 10.00, '2025-01-01', '2025-01-31'),
(2, 'Spring Discount', 15.00, '2025-03-01', '2025-03-31'),
(3, 'Summer Offer', 20.00, '2025-06-01', '2025-06-30'),
(4, 'Black Friday', 50.00, '2025-11-27', '2025-11-27'),
(5, 'Holiday Special', 25.00, '2025-12-01', '2025-12-31');

select * from discount
OUTPUT:
/*Discount_ID	Discount_Name 	Discount_Percentage         	Start_Dat   End_Date
      1	        New Year Sale	           10.00	            2025-01-01	2025-01-31
      2	       Spring Discoun            15.00	            2025-03-01	2025-03-31
      3	       Summer Offer	             20.00	            2025-06-01	2025-06-30
      4	       Black Friday	             50.00	            2025-11-27	2025-11-27
      5	      Holiday Special	           25.00	            2025-12-01	2025-12-31
*/



CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    S_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    Address TEXT
);
INSERT INTO Student (Student_ID, S_Name, Email, Phone, Address)
VALUES
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Springfield, IL'),
(2, 'Jane Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak St, Springfield, IL'),
(3, 'Michael Johnson', 'michael.johnson@example.com', '345-678-9012', '789 Pine St, Springfield, IL'),
(4, 'Emily Davis', 'emily.davis@example.com', '456-789-0123', '101 Maple St, Springfield, IL'),
(5, 'Chris Brown', 'chris.brown@example.com', '567-890-1234', '202 Birch St, Springfield, IL');

select * from student
OUTPUT:
/*Student_ID	S_Name	             Email	           Phone	                           Address
         1  John Doe	     john.doe@example.com	    123-456-7890	   123 Main St, Springfield, IL
         2	Jane Smith	     jane.smith@example.com	    234-567-8901	   456 Oak St, Springfield, IL
         3	Michael Johnson	 michael.johnson@example.com	345-678-9012	789 Pine St, Springfield, IL
         4	Emily Davis	     emily.davis@example.com	456-789-0123	101 Maple St, Springfield, IL
         5	Chris Brown	     chris.brown@example.com	567-890-1234	202 Birch St, Springfield, IL
*/

CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Expertise VARCHAR(255),
    Address TEXT
);
INSERT INTO Instructor (Instructor_ID, Name, Email, Expertise, Address)
VALUES
(1, 'Dr. Alice Turner', 'alice.turner@example.com', 'Mathematics', '123 University Ave, Springfield, IL'),
(2, 'Prof. Bob Mitchell', 'bob.mitchell@example.com', 'Physics', '456 Science Blvd, Springfield, IL'),
(3, 'Dr. Charlie Reynolds', 'charlie.reynolds@example.com', 'Computer Science', '789 Tech Lane, Springfield, IL'),
(4, 'Prof. Diana Harris', 'diana.harris@example.com', 'Chemistry', '101 Chemistry Rd, Springfield, IL'),
(5, 'Dr. Evan Clark', 'evan.clark@example.com', 'Biology', '202 Bio Path, Springfield, IL');

select * from instructor
OUTPUT:
/*
Instructor_ID	Name	                Email	                         Expertise	                                  Address
1  Dr. Alice Turne      alice.turner@example.com	           Mathematics	                123 University Ave, Springfield, IL
2  Prof. Bob Mitchell   bob.mitchell@example.com	           Physics	                  456 Science Blvd, Springfield, IL
3  Dr. Charlie     Reynolds  charlie.reynolds@example.com	  Computer Science	            789 Tech Lane, Springfield, IL
4  Prof. Diana Harris	   diana.harris@example.com	           Chemistry	                101 Chemistry Rd, Springfield, IL
5  Dr. Evan Clark	      evan.clark@example.com	             Biology	                    202 Bio Path, Springfield, IL
*/

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);
INSERT INTO Categories (Category_ID, Name)
VALUES
(1, 'Mathematics'),
(2, 'Science'),
(3, 'Engineering'),
(4, 'Philosophy');
(5, 'Literature'),

select * from categories
OUTPUT:
/*Category_ID	       Name
  1	                 Mathematics
  2	                 Science
  3	                Engineering
  4	               Philosophy
  5	               Literature
*/

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Category_ID INT,
    Instructor_ID INT,
    Price DECIMAL(10,2),
    Discount_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID)
);
INSERT INTO Courses (Course_ID, Course_Name, Description, Category_ID, Instructor_ID, Price, Discount_ID)
VALUES
(1, 'Calculus 101', 'An introductory course to calculus.', 1, 1, 150.00, 1),
(2, 'Physics for Engineers', 'A comprehensive physics course for engineering students.', 2, 2, 200.00, 2),
(3, 'Intro to Programming', 'Learn the basics of programming in Python.', 3, 3, 120.00, 1),
(4, 'Organic Chemistry', 'A deep dive into organic chemistry concepts.', 2, 4, 180.00, 3),
(5, 'Biology 101', 'An introductory biology course covering key concepts in biology.', 1, 5, 130.00, 2);

select * from courses
OUTPUT:
/*Course_ID   Course_Name	    Description	                                             Category_ID    Instructor_ID	 Price	Discount_ID
 1	       Calculus 101     	 An introductory course to calculus.	                            1	         1	       150.00	  1
 2	    Physics for Engineers	 A comprehensive physics course for engineering students.      	  2	         2	       200.00	  2
 3	    Intro to Programming	 Learn the basics of programming in Python.                    	  3	         3	       120.00	  1
 4	    Organic Chemistry	     A deep dive into organic chemistry concepts.	                    2	         4	       180.00	  3
 5	     Biology 101	         An introductory biology course covering key concepts in biology.	1	         5	       130.00	  2
*/

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID, Date, Status)
VALUES
(1, 1, 1, '2025-03-01', 'Enrolled'),
(2, 2, 2, '2025-03-02', 'Completed'),
(3, 3, 3, '2025-03-03', 'Enrolled'),
(4, 4, 4, '2025-03-04', 'Dropped'),
(5, 5, 5, '2025-03-05', 'Completed');

select * from enrollment
OUTPUT:
/*         Enrollment_ID       Student_ID	      Course_ID	        Date	     Status
                  1	               1	               1	        2025-03-01	Enrolled
                  2	               2	               2	        2025-03-02	Completed
                  3	               3	               3	        2025-03-03	Enrolled
                  4	               4	               4	        2025-03-04	Dropped
                  5	               5               	5           2025-03-05	Completed
*/

CREATE TABLE Lessons (
    Lesson_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Course_ID INT,
    Content TEXT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Lessons (Lesson_ID, Title, Course_ID, Content)
VALUES
(1, 'Introduction to Calculus', 1, 'This lesson covers the basics of calculus, including limits and derivatives.'),
(2, 'Differentiation Techniques', 1, 'Learn various methods of differentiation, including product and quotient rules.'),
(3, 'Introduction to Mechanics', 2, 'An introduction to mechanics, covering Newtons laws and basic motion.'),
(4, 'Electrical Circuits Basics', 6, 'This lesson explains the fundamentals of electrical circuits and Ohms Law.'),
(5, 'Organic Chemistry: Alkanes', 4, 'Study the properties and reactions of alkanes in organic chemistry.');

select * from lessons
OUTPUT:
/*Lesson_ID	   Title	              Course_ID	           Content
    1	    Introduction to Calculus	    1	     This lesson covers the basics of calculus, including limits and derivatives.
    2	   Differentiation Techniques	    1	     Learn various methods of differentiation, including product and quotient rules.
    3	   Introduction to Mechanics	    2	     An introduction to mechanics, covering Newtons laws and basic motion.
    4	  Electrical Circuits Basics	    6	    This lesson explains the fundamentals of electrical circuits and Ohms Law.
  5	   Organic Chemistry: Alkanes	      4	    Study the properties and reactions of alkanes in organic chemistry.
*/

CREATE TABLE Assignments (
    Assignment_ID INT PRIMARY KEY,
    Course_ID INT,
    Title VARCHAR(255) NOT NULL,
    Due_Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Assignments (Assignment_ID, Course_ID, Title, Due_Date)
VALUES
(1, 1, 'Calculus Homework 1', '2025-03-15'),
(2, 1, 'Calculus Homework 2', '2025-03-22'),
(3, 2, 'Physics Problem Set 1', '2025-03-18'),
(4, 2, 'Physics Lab Report', '2025-03-25'),
(5, 3, 'Programming Assignment 1', '2025-03-20');

select * from Assignments
OUTPUT:
/*           Assignment_ID   Course_ID	        Title	             Due_Date
                    1	        1	           Calculus Homework 1	    2025-03-15
                    2	        1	          Calculus Homework 2	      2025-03-22
                    3	        2	          Physics Problem Set 1	    2025-03-18
                    4	        2	          Physics Lab Report	      2025-03-25
                    5	        3	        Programming Assignment 1	   2025-03-20
*/

CREATE TABLE Quizzes (
    Quiz_ID INT PRIMARY KEY,
    Course_ID INT,
    Title VARCHAR(255) NOT NULL,
    Total_Marks INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID));
INSERT INTO Quizzes (Quiz_ID, Course_ID, Title, Total_Marks)
VALUES
(1, 1, 'Calculus Quiz 1', 100),
(2, 1, 'Calculus Quiz 2', 80),
(3, 2, 'Physics Quiz 1', 90),
(4, 2, 'Physics Quiz 2', 85),
(5, 3, 'Intro to Programming Quiz 1', 50);

select * from quizzes
OUTPUT:
/*Quiz_ID    Course_ID	            Title	         Total_Marks
   1	       1	             Calculus Quiz 1	    100
   2	       1	             Calculus Quiz 2	     80
   3	       2	             Physics Quiz 1  	     90
   4	       2	             Physics Quiz 2  	      85
   5	       3         Intro to Programming Quiz 1	5
*/

CREATE TABLE Quiz_Attempts (
    Attempt_ID INT PRIMARY KEY,
    Student_ID INT,
    Quiz_ID INT,
    Score INT,
    Attempt_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Quiz_ID) REFERENCES Quizzes(Quiz_ID)
);
INSERT INTO Quiz_Attempts (Attempt_ID, Student_ID, Quiz_ID, Score, Attempt_Date)
VALUES
(1, 1, 1, 85, '2025-03-10'),
(2, 2, 1, 78, '2025-03-12'),
(3, 3, 2, 92, '2025-03-15'),
(4, 4, 2, 75, '2025-03-17');
(5, 5, 3, 45, '2025-03-20'),

select * from quiz_attempts 
OUTPUT:
/*Attempt_ID	Student_ID	Quiz_ID    Score	  Attempt_Date
        1	     1	             1	     85	   2025-03-10
        2	     2	             1	     78	   2025-03-12
        3	     3	            2	       92	   2025-03-1
        4    	 4	            2	       75	    2025-03-17
        5	     5	            3	       45	    2025-03-20
*/


CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Payment (Payment_ID, Student_ID, Course_ID, Amount, Payment_Date, Status)
VALUES
(1, 1, 1, 150.00, '2025-03-01', 'Completed'),
(2, 2, 2, 200.00, '2025-03-02', 'Completed'),
(3, 3, 3, 120.00, '2025-03-03', 'Pending'),
(4, 4, 4, 180.00, '2025-03-04', 'Completed'),
(5, 5, 5, 130.00, '2025-03-05', 'Completed');

select * from payment
OUTPUT:
/*Payment_ID	Student_ID	Course_ID	  Amount    Payment_Date	    Status
    1	          1	         1	         150.00	    2025-03-01	      Completed
    2	          2	         2	          200.00	    2025-03-02	       Completed
    3	          3	         3	          120.00	     2025-03-03	         Pending
    4 	        4	         4	          180.00	      2025-03-04	       Completed
    5	          5	         5	          130.00       2025-03-05          Completed
*/

CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Review_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Reviews (Review_ID, Student_ID, Course_ID, Rating, Comment, Review_Date)
VALUES
(1, 1, 1, 5, 'Excellent course! The content was very well explained and easy to follow.', '2025-03-01'),
(2, 2, 2, 4, 'Good course, but some topics were a bit challenging.', '2025-03-02'),
(3, 3, 3, 3, 'The course was okay, but I felt it could have included more practical examples.', '2025-03-03'),
(4, 4, 4, 5, 'Great content and instructor. Highly recommended!', '2025-03-04'),
(5, 5, 5, 2, 'The course didn’t meet my expectations. The material was outdated.', '2025-03-05');

select * from reviews
OUTPUT:
/*Review_ID	 Student_ID	 Course_ID	 Rating	        Comment	                                                                Review_Date
      1      	1	          1	          5       Excellent course! The content was very well explained and easy to follow.    	2025-03-01
      2	      2	          2	          4      Good course, but some topics were a bit challenging.	                           2025-03-02
      3	      3	          3	          3     The course was okay, but I felt it could have included more practical examples.	 2025-03-03
      4	      4	          4	          5       Great content and instructor. Highly recommended!	                             2025-03-04
      5	      5	          5	          2      The course didn’t meet my expectations. The material was outdated.	              2025-03-05
*/

CREATE TABLE Certificates (
    Certificate_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Issued_Date DATE,
    Expiry_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
INSERT INTO Certificates (Certificate_ID, Student_ID, Course_ID, Issued_Date, Expiry_Date)
VALUES
(1, 1, 1, '2025-03-15', '2027-03-15'),
(2, 2, 2, '2025-03-16', '2027-03-16'),
(3, 3, 3, '2025-03-17', '2027-03-17'),
(4, 4, 4, '2025-03-18', '2027-03-18'),
(5, 5, 5, '2025-03-19', '2027-03-19');

select * from Certificates 
OUTPUT:
/*Certificate_ID	Student_ID	Course_ID	      Issued_Date   	Expiry_Date
           1	     1	              1	         2025-03-15	   2027-03-15
           2	     2	              2	         2025-03-16	   2027-03-16
           3	     3	              3	          2025-03-17	  2027-03-17
           4	     4	              4	          2025-03-18	  2027-03-18
           5	     5	              5	          2025-03-19	   2027-03-19
*/

CREATE TABLE Discussion_Forums (
    Forum_ID INT PRIMARY KEY,
    Course_ID INT,
    Topic VARCHAR(255) NOT NULL,
    Created_By INT,
    Created_Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Created_By) REFERENCES Student(Student_ID)
);
INSERT INTO Discussion_Forums (Forum_ID, Course_ID, Topic, Created_By, Created_Date)
VALUES
(1, 1, 'Understanding Limits in Calculus', 1, '2025-03-01'),
(2, 2, 'Newtons Laws of Motion: Real-Life Applications', 2, '2025-03-02'),
(3, 3, 'Introduction to Python Functions', 3, '2025-03-03'),
(4, 4, 'Reactions of Alkanes: A Deep Dive', 4, '2025-03-04'),
(5, 5, 'Organic Chemistry: Mechanisms of Reactions', 5, '2025-03-05');

select * from Discussion_Forums
OUTPUT:
/*Forum_ID   Course_ID	             Topic	                          Created_By    	Created_Date
  1	          1       	Understanding Limits in Calculus	                 1	         2025-03-01
  2	          2         Newtons Laws of Motion: Real-Life Applications	   2	         2025-03-02
  3	          3	        Introduction to Python Functions	                 3	        2025-03-03
  4	          4	        Reactions of Alkanes: A Deep Dive	                 4	        2025-03-04
  5         	5	        Organic Chemistry: Mechanisms of Reactions	       5	        2025-03-05*/

CREATE TABLE Replies (
    Reply_ID INT PRIMARY KEY,
    Forum_ID INT,
    Student_ID INT,
    Comment TEXT,
    Reply_Date DATE,
    FOREIGN KEY (Forum_ID) REFERENCES Discussion_Forums(Forum_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);
INSERT INTO Replies (Reply_ID, Forum_ID, Student_ID, Comment, Reply_Date)
VALUES
(1, 1, 2, 'I find limits a bit tricky. Can anyone explain with more examples?', '2025-03-02'),
(2, 1, 3, 'Sure! Limits are the foundation of calculus. Consider the function approaching a value...', '2025-03-03'),
(3, 2, 4, 'Newtons Laws of Motion are fascinating! Especially the second law when applied in real life.', '2025-03-04'),
(4, 2, 5, 'Yes, the law of inertia in the first law helps explain many everyday phenomena.', '2025-03-05'),
(5, 3, 6, 'Python functions are easy to understand once you get the syntax right. Start simple!', '2025-03-06');

select * from Replies
OUTPUT: 
/*Reply_ID   Forum_ID	 Student_ID	        Comment	                                                                           Reply_Date
       1	     1	      2        	I find limits a bit tricky. Can anyone explain with more examples?	                        2025-03-02
       2	     1	      3     	Sure! Limits are the foundation of calculus. Consider the function approaching a value...	     2025-03-03
       3	     2	      4     	Newtons Laws of Motion are fascinating! Especially the second law when applied in real life.	2025-03-04
       4	     2	      5	     Yes, the law of inertia in the first law helps explain many everyday phenomena.	               2025-03-05
       5	     3	      6	     Python functions are easy to understand once you get the syntax right. Start simple!           	2025-03-06
*/

