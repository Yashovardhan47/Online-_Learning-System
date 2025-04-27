 --1. List all admins:
       SELECT * FROM Admin;
--2. Find all students who have enrolled in a course:
SELECT * FROM Student;

--3. List courses in the "Mathematics" category:
SELECT * FROM Courses 	
WHERE Category_ID = 1;

--4. Get all instructors who teach in the "Science" category:
           SELECT * FROM Instructor
WHERE Instructor_ID IN (
    SELECT Instructor_ID FROM Courses
    WHERE Category_ID = 2);

--5. Get all discounts currently active:
           SELECT * FROM Discount
WHERE Start_Date <= CURRENT_DATE AND End_Date >= CURRENT_DATE;

--6. Get all students who have completed the "Physics for Engineers" course:
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Physics for Engineers' AND E.Status = 'Completed';

--7. Find the reviews for the course "Calculus 101":
SELECT * FROM Reviews
WHERE Course_ID = 1;

--8. List all payments for the course "Intro to Programming":
SELECT * FROM Payment
WHERE Course_ID = 3;

--9. Get the list of students enrolled in "Electrical Engineering Fundamentals":
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Electrical Engineering Fundamentals';

--10. Get all certificates issued for "Biology 101":
SELECT * FROM Certificates
WHERE Course_ID = 5;

--11. List the students who attempted the "Calculus Quiz 1":
SELECT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
WHERE QA.Quiz_ID = 1;

--12. Show all the courses with a discount percentage greater than 30:
SELECT * FROM Courses
JOIN Discount D ON Courses.Discount_ID = D.Discount_ID
WHERE D.Discount_Percentage > 30;

--13. Show all forums created by student "John Doe":
SELECT * FROM Discussion_Forums
WHERE Created_By = (SELECT Student_ID FROM Student WHERE S_Name = 'John Doe');

--14. Get the replies in the forum "Understanding Limits in Calculus":

SELECT * FROM Replies
WHERE Forum_ID = 1;

--15. List all lessons in "Calculus 101":
SELECT * FROM Lessons
WHERE Course_ID = 1;

--16. Show the total number of students in each course:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Students
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;

--17. Find the average rating for the course "Physics for Engineers":
SELECT AVG(Rating) AS Average_Rating
FROM Reviews
WHERE Course_ID = 2;

 --18. Find the students who paid for "Organic Chemistry":
SELECT S.S_Name
FROM Payment P
JOIN Student S ON P.Student_ID = S.Student_ID
WHERE P.Course_ID = 4 AND P.Status = 'Completed';

--19. Get the instructors teaching "Shakespearean Literature":
SELECT I.Name
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
WHERE C.Course_Name = 'Shakespearean Literature';

--20. Show all assignments for "Electrical Engineering Fundamentals":
SELECT * FROM Assignments
WHERE Course_ID = 6;

--21. Get all reviews with a rating of 5:
SELECT * FROM Reviews
WHERE Rating = 5;

--22. List all the topics discussed in the forum "Newtons Laws of Motion":
SELECT Topic
FROM Discussion_Forums
WHERE Forum_ID = 2;

--23. Get the replies for the forum "Reactions of Alkanes":
SELECT * FROM Replies
WHERE Forum_ID = 4;

--24. Show the total amount paid for the course "World History: Ancient Civilizations":
SELECT SUM(Amount) AS Total_Amount
FROM Payment
WHERE Course_ID = 10;

--25. Get all the quizzes for "Introduction to Philosophy":
SELECT * FROM Quizzes
WHERE Course_ID = 7;

--26. Get the highest score in "Physics Quiz 1":
SELECT MAX(Score) AS Highest_Score
FROM Quiz_Attempts
WHERE Quiz_ID = 3;

--27. List the students who have not attempted the quiz "Calculus Quiz 1":
SELECT S.S_Name
FROM Student S
WHERE S.Student_ID NOT IN (
    SELECT Student_ID FROM Quiz_Attempts WHERE Quiz_ID = 1);

--28. Show all categories in the system:
SELECT * FROM Categories;

--29. List all active courses with the corresponding discount name:
SELECT C.Course_Name, D.Discount_Name
FROM Courses C
JOIN Discount D ON C.Discount_ID = D.Discount_ID
WHERE D.Start_Date <= CURRENT_DATE AND D.End_Date >= CURRENT_DATE;

--30. Get the student who received the highest score on the "Physics Quiz 1":
          SELECT S.S_Name, QA.Score
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
WHERE QA.Quiz_ID = 3
ORDER BY QA.Score DESC

--31. Get the courses where a discount is currently available:
             SELECT C.Course_Name, D.Discount_Name
FROM Courses C
JOIN Discount D ON C.Discount_ID = D.Discount_ID
WHERE D.Start_Date <= CURRENT_DATE AND D.End_Date >= CURRENT_DATE;

--32. List students who are enrolled in both "Intro to Programming" and "Biology 101":
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E1 ON S.Student_ID = E1.Student_ID
JOIN Enrollment E2 ON S.Student_ID = E2.Student_ID
JOIN Courses C1 ON E1.Course_ID = C1.Course_ID
JOIN Courses C2 ON E2.Course_ID = C2.Course_ID
WHERE C1.Course_Name = 'Intro to Programming' AND C2.Course_Name = 'Biology 101';

--33. Get the total number of enrollments for each course:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;

--34. List all the forums with their topics and creation date:
SELECT Forum_ID, Topic, Created_Date
FROM Discussion_Forums;

--35. List all students who have received a certificate for any course:
SELECT S.S_Name, C.Course_Name
FROM Certificates Ct
JOIN Student S ON Ct.Student_ID = S.Student_ID
JOIN Courses C ON Ct.Course_ID = C.Course_ID;

--36. Find the highest discount percentage offered:
SELECT MAX(Discount_Percentage) AS Highest_Discount
FROM Discount;

--37. Show the students who are enrolled in the course "Introduction to Philosophy":
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Course_ID = 7;


--38. Get all students who have received a certificate with expiry date in the future:
SELECT S.S_Name, C.Course_Name
FROM Certificates Ct
JOIN Student S ON Ct.Student_ID = S.Student_ID
JOIN Courses C ON Ct.Course_ID = C.Course_ID
WHERE Ct.Expiry_Date > CURRENT_DATE;

--39. List all instructors along with their expertise:
SELECT Name, Expertise
FROM Instructor;
       --40. Show the total payment amount for each student:
           SELECT S.S_Name, SUM(P.Amount) AS Total_Payment
FROM Payment P
JOIN Student S ON P.Student_ID = S.Student_ID
GROUP BY S.S_Name;

--41. Find all the students who haven't received a certificate yet:
           SELECT S.S_Name
FROM Student S
WHERE S.Student_ID NOT IN (SELECT Student_ID FROM Certificates);

--42. Get all the students who have enrolled but have not completed any course:
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Status != 'Completed';

--43. List all students who have enrolled in "Electrical Engineering Fundamentals" and completed it:
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Course_ID = 6 AND E.Status = 'Completed';

--44. Show the names of students who have received a rating of 5 for any course:
          SELECT DISTINCT S.S_Name
FROM Student S
JOIN Reviews R ON S.Student_ID = R.Student_ID
WHERE R.Rating = 5;

--45. Show the categories of courses that have at least 5 students enrolled:
SELECT DISTINCT Cat.Name
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY Cat.Name
HAVING COUNT(E.Student_ID) >= 5;

--46. Get the courses with more than 10 students enrolled:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name
HAVING COUNT(E.Student_ID) > 10;

--47. Show the average score in the quiz "Advanced Calculus Quiz":
SELECT AVG(Score) AS Average_Score
FROM Quiz_Attempts
WHERE Quiz_ID = 10;

--48. Find the student with the highest quiz score:
SELECT S.S_Name, MAX(QA.Score) AS Highest_Score
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
GROUP BY S.S_Name
ORDER BY Highest_Score DESC

--49. Get all the assignments with their due dates for "Introduction to Programming":
SELECT A.Assignment_Name, A.Due_Date
FROM Assignments A
JOIN Courses C ON A.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Introduction to Programming';

--50. Show all forum discussions related to "Molecular Biology":
SELECT * 
FROM Discussion_Forums
WHERE Topic LIKE '%Molecular Biology%';

--51. List the most recent forum discussions:
SELECT Forum_ID, Topic, Created_Date
FROM Discussion_Forums
ORDER BY Created_Date DESC

          --52. Get the number of reviews per course:
           SELECT C.Course_Name, COUNT(R.Review_ID) AS Total_Reviews
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name;
--53. Show all students who have reviewed any course:
            SELECT DISTINCT S.S_Name
FROM Student S
JOIN Reviews R ON S.Student_ID = R.Student_ID;

--54. Get the total number of students who have received certificates:
           SELECT COUNT(DISTINCT Student_ID) AS Total_Students
FROM Certificates;

--55. Show all the courses that have more than 3 reviews:
            SELECT C.Course_Name, COUNT(R.Review_ID) AS Review_Count
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
HAVING COUNT(R.Review_ID) > 3;

--56. List all students who have not paid for any course:
            SELECT S.S_Name
FROM Student S
WHERE S.Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Payment);

--57. Get the average payment amount by students:
            SELECT AVG(Amount) AS Average_Payment
FROM Payment;

--58. Find the number of students who have not enrolled in any course:
          SELECT S.S_Name
FROM Student S
WHERE S.Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Enrollment);

--59. Get the name of the course with the most students enrolled:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name
ORDER BY Total_Enrollments DESC

--60. List all categories with the number of courses in each category:
SELECT Cat.Name, COUNT(C.Course_ID) AS Total_Courses
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
GROUP BY Cat.Name;

--61. Get the name of the instructor who taught the course with the highest number of enrollments:
SELECT I.Name, C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY I.Name, C.Course_Name
ORDER BY Total_Enrollments DESC

--62. Show all courses taught by instructors in the "Mathematics" category:
SELECT C.Course_Name, I.Name
FROM Courses C
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
WHERE C.Category_ID = 1;

--63. List all students who have enrolled in at least one course with a discount:
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
JOIN Discount D ON C.Discount_ID = D.Discount_ID;

--64. Get the list of students who attempted more than 5 quizzes:
SELECT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
GROUP BY S.S_Name
HAVING COUNT(QA.Quiz_ID) > 5;

--65. Find the average score of students on a specific quiz:
SELECT AVG(Score) AS Average_Score
FROM Quiz_Attempts
WHERE Quiz_ID = 2;

--66. List all instructors with expertise in "Machine Learning":
SELECT Name
FROM Instructor
WHERE Expertise LIKE '%Machine Learning%';

           --67. Get the number of courses in the "Science" category:
SELECT COUNT(C.Course_ID) AS Total_Science_Courses
FROM Courses C
WHERE C.Category_ID = 2;

--68. Show the details of all courses with "Physics" in the title:
SELECT * 
FROM Courses 
WHERE Course_Name LIKE '%Physics%';

--69. List all students who have completed at least one course:
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Status = 'Completed';

--70. Find all courses that have a review score higher than 4:
SELECT C.Course_Name
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
WHERE R.Rating > 4;

--71. Show all students who have enrolled in courses within the "Technology" category:
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Category_ID = 3;

--72. Get the total number of courses taught by each instructor:
           SELECT I.Name, COUNT(C.Course_ID) AS Total_Courses
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
GROUP BY I.Name;

--73. List all students who have provided feedback on "Biology 101":
              SELECT DISTINCT S.S_Name
FROM Student S
JOIN Reviews R ON S.Student_ID = R.Student_ID
JOIN Courses C ON R.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Biology 101';

--74. Find the average payment for students who have enrolled in "Data Structures":
           SELECT AVG(P.Amount) AS Average_Payment
FROM Payment P
JOIN Enrollment E ON P.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Data Structures';

--75. Get all courses that have both a discount and are available in the "Engineering" category:
          SELECT C.Course_Name
FROM Courses C
JOIN Discount D ON C.Discount_ID = D.Discount_ID
WHERE C.Category_ID = 4;

--76. List all categories with no courses:
          SELECT Cat.Name
FROM Categories Cat
LEFT JOIN Courses C ON Cat.Category_ID = C.Category_ID
WHERE C.Course_ID IS NULL;


--77. Find the students who have enrolled in courses but haven't attempted any quizzes:
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Quiz_Attempts);

--78. List all active courses:
           SELECT * 
FROM Courses
WHERE Start_Date <= CURRENT_DATE AND End_Date >= CURRENT_DATE;

--79. Show the total number of students enrolled in each category:
           SELECT Cat.Name, COUNT(E.Student_ID) AS Total_Students
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY Cat.Name;

--80. List all the students who have been enrolled in "Organic Chemistry":
           SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Course_ID = 4;

--81. Get the names of all instructors who have taught courses in the "Technology" category:
           SELECT DISTINCT I.Name
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
WHERE C.Category_ID = 3;

--82. Find the instructors who have the highest number of students in their courses:
         SELECT I.Name, COUNT(E.Student_ID) AS Total_Students
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY I.Name
ORDER BY Total_Students DESC

--83. List all students who have failed at least one quiz:
          SELECT DISTINCT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
WHERE QA.Score < 50;

--84. Show the details of the course with the least number of students:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name
ORDER BY Total_Enrollments ASC

--85. Find the students who have enrolled in courses but not yet paid:
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Course_ID NOT IN (SELECT Course_ID FROM Payment);

--86. List all courses with their corresponding discount details:
SELECT C.Course_Name, D.Discount_Name, D.Discount_Percentage
FROM Courses C
JOIN Discount D ON C.Discount_ID = D.Discount_ID;

--87. Find the course with the highest-rated review:
SELECT C.Course_Name, MAX(R.Rating) AS Highest_Rating
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
ORDER BY Highest_Rating DESC

--88. List all assignments with their respective courses:
SELECT A.Assignment_Name, C.Course_Name
FROM Assignments A
JOIN Courses C ON A.Course_ID = C.Course_ID;

--89. Find the most expensive course in terms of payment:
SELECT C.Course_Name, MAX(P.Amount) AS Highest_Payment
FROM Courses C
JOIN Payment P ON C.Course_ID = P.Course_ID
GROUP BY C.Course_Name
ORDER BY Highest_Payment DESC

--90. Show the most frequent course category:
SELECT Cat.Name, COUNT(C.Course_ID) AS Total_Courses
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
GROUP BY Cat.Name
ORDER BY Total_Courses DESC

--91. Get the instructors with the least number of students enrolled in their courses:
SELECT I.Name, COUNT(E.Student_ID) AS Total_Students
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY I.Name
ORDER BY Total_Students ASC

--92. Show all students who have participated in more than 3 quizzes:
SELECT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
GROUP BY S.Student_ID
HAVING COUNT(QA.Quiz_ID) > 3;

--92. Students who scored above average in all their quizzes
SELECT s.S_Name
FROM Student s
WHERE NOT EXISTS (
    SELECT q.Quiz_ID 
    FROM Quizzes q
    JOIN Quiz_Attempts qa ON q.Quiz_ID = qa.Quiz_ID
    WHERE qa.Student_ID = s.Student_ID
    AND qa.Score < (SELECT AVG(Score) FROM Quiz_Attempts WHERE Quiz_ID = q.Quiz_ID));

--94. Get the courses that have not received any reviews:
SELECT C.Course_Name
FROM Courses C
LEFT JOIN Reviews R ON C.Course_ID = R.Course_ID
WHERE R.Review_ID IS NULL;

--95. Show all courses where the instructor has a rating above 4:
SELECT C.Course_Name, I.Name
FROM Courses C
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
HAVING AVG(R.Rating) > 4;

--96. Find the most popular course in terms of quiz attempts:
SELECT C.Course_Name, COUNT(QA.Quiz_ID) AS Total_Quiz_Attempts
FROM Courses C
JOIN Quizzes Q ON C.Course_ID = Q.Course_ID
JOIN Quiz_Attempts QA ON Q.Quiz_ID = QA.Quiz_ID
GROUP BY C.Course_Name
ORDER BY Total_Quiz_Attempts DESC

--97. List all courses available for free (with 0 payment):
SELECT Course_Name
FROM Courses C
JOIN Payment P ON C.Course_ID = P.Course_ID
WHERE P.Amount = 0;

--98. Show the total reviews for each student:
SELECT S.S_Name, COUNT(R.Review_ID) AS Total_Reviews
FROM Student S
JOIN Reviews R ON S.Student_ID = R.Student_ID
GROUP BY S.S_Name;

--99. List all the students who have enrolled in more than 3 courses:
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
GROUP BY S.Student_ID
HAVING COUNT(E.Course_ID) > 3;

--100. Show the details of all courses in the "Programming" category:
SELECT C.Course_Name, C.Description
FROM Courses C
WHERE C.Category_ID = 5;

--101. List all students who have earned certificates in the last month:
SELECT S.S_Name
FROM Student S
JOIN Certificates C ON S.Student_ID = C.Student_ID
WHERE C.Certification_Date >= CURDATE() - INTERVAL 1 MONTH;

--102. Find the course with the most reviews:
SELECT C.Course_Name, COUNT(R.Review_ID) AS Review_Count
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
ORDER BY Review_Count DESC

--103. Get the total number of students who have enrolled in at least one course with a discount:
SELECT COUNT(DISTINCT E.Student_ID) AS Total_Students
FROM Enrollment E
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Discount_ID IS NOT NULL;

--104. List all courses taught by instructors with the title "Professor":
SELECT C.Course_Name, I.Name
FROM Courses C
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
WHERE I.Title = 'Professor';

--105. Get the number of students enrolled in each course:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Students
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;

--106. Find all instructors who have taught a course in the "History" category:
SELECT DISTINCT I.Name
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
WHERE C.Category_ID = 6;

--107. List all students who have paid for "Data Science 101":
SELECT S.S_Name
FROM Student S
JOIN Payment P ON S.Student_ID = P.Student_ID
JOIN Courses C ON P.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Data Science 101';

--108. Show the total number of quizzes taken by each student:
          SELECT S.S_Name, COUNT(QA.Quiz_ID) AS Total_Quizzes
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
GROUP BY S.S_Name;

--109. Get all courses with a review rating higher than 4.5:
           SELECT C.Course_Name, AVG(R.Rating) AS Average_Rating
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
HAVING AVG(R.Rating) > 4.5;

--110. List all students who have not received any certification:
           SELECT S.S_Name
FROM Student S
WHERE S.Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Certificates);

--111. Find all courses that have a price above 200:
          SELECT Course_Name, Price
FROM Courses
WHERE Price > 200;

--112. Show the total number of quizzes for each course:
             SELECT C.Course_Name, COUNT(Q.Quiz_ID) AS Total_Quizzes
FROM Courses C
JOIN Quizzes Q ON C.Course_ID = Q.Course_ID
GROUP BY C.Course_Name;

--113. List all instructors who have the most students enrolled:
             SELECT I.Name, COUNT(E.Student_ID) AS Total_Students
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY I.Name
ORDER BY Total_Students DESC

--114. Get the total number of quizzes attempted by students in the "Math" category:
            SELECT COUNT(QA.Quiz_ID) AS Total_Quizzes_Attempted
FROM Quiz_Attempts QA
JOIN Quizzes Q ON QA.Quiz_ID = Q.Quiz_ID
JOIN Courses C ON Q.Course_ID = C.Course_ID
WHERE C.Category_ID = 2;

--115. Find the students who have enrolled in both "Data Science" and "Machine Learning" courses:
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Enrollment E1 ON S.Student_ID = E1.Student_ID
JOIN Courses C1 ON E1.Course_ID = C1.Course_ID
JOIN Enrollment E2 ON S.Student_ID = E2.Student_ID
JOIN Courses C2 ON E2.Course_ID = C2.Course_ID
WHERE C1.Course_Name = 'Data Science' AND C2.Course_Name = 'Machine Learning';

--116. Show all instructors who teach in both the "Programming" and "Technology" categories:
         SELECT DISTINCT I.Name
FROM Instructor I
JOIN Courses C1 ON I.Instructor_ID = C1.Instructor_ID
JOIN Courses C2 ON I.Instructor_ID = C2.Instructor_ID
WHERE C1.Category_ID = 5 AND C2.Category_ID = 3;

--117. Get the list of students who have received more than one certification:
          SELECT S.S_Name
FROM Student S
JOIN Certificates C ON S.Student_ID = C.Student_ID
GROUP BY S.Student_ID
HAVING COUNT(C.Certificate_ID) > 1;

--118. List all courses where the instructor is "John Doe":
SELECT C.Course_Name
FROM Courses C
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
WHERE I.Name = 'John Doe';

--119. Find the total payment amount for courses in the "Business" category:
SELECT SUM(P.Amount) AS Total_Payment
FROM Payment P
JOIN Courses C ON P.Course_ID = C.Course_ID
WHERE C.Category_ID = 7;

--120. Show all students who have participated in at least one quiz:
          SELECT DISTINCT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID;

--121. Get the courses with the highest number of enrolled students:
SELECT C.Course_Name, COUNT(E.Student_ID) AS Total_Enrollments
FROM Courses C
JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name
ORDER BY Total_Enrollments DESC

--122. List all courses that have a quiz with more than 5 questions:
SELECT C.Course_Name
FROM Courses C
JOIN Quizzes Q ON C.Course_ID = Q.Course_ID
WHERE Q.Total_Questions > 5;

--123. Find the total number of certifications earned by students:
SELECT COUNT(C.Certificate_ID) AS Total_Certifications
FROM Certificates C;

--124. Get the students who have enrolled in courses with "Physics" in the title:
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
WHERE C.Course_Name LIKE '%Physics%';

--125. List all students who have reviewed "Intro to Programming":
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Reviews R ON S.Student_ID = R.Student_ID
JOIN Courses C ON R.Course_ID = C.Course_ID
WHERE C.Course_Name = 'Intro to Programming';

--126. Get the total number of reviews for each category:
SELECT Cat.Name, COUNT(R.Review_ID) AS Total_Reviews
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY Cat.Name;

--127. Find the average price of courses in the "Design" category:
SELECT AVG(Price) AS Average_Price
FROM Courses
WHERE Category_ID = 8;

--128. Show all students who have failed a quiz:
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
WHERE QA.Score < 50;

--129. List all courses with a discount greater than 20%:
SELECT C.Course_Name, D.Discount_Percentage
FROM Courses C
JOIN Discount D ON C.Discount_ID = D.Discount_ID
WHERE D.Discount_Percentage > 20;

--130. Get the total number of reviews per instructor:
SELECT I.Name, COUNT(R.Review_ID) AS Total_Reviews
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY I.Name;

--131. Find the students who have enrolled in more than 2 courses.
SELECT S_Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    GROUP BY Student_ID
    HAVING COUNT(Course_ID) > 2
);

--132. Get the average score of students who scored above 80 in any quiz.
SELECT AVG(Score)
FROM Quiz_Attempts
WHERE Score > 80;

--133. List the courses that have more than 3 students enrolled.
SELECT Course_Name
FROM Courses
WHERE Course_ID IN (
    SELECT Course_ID
    FROM Enrollment
    GROUP BY Course_ID
    HAVING COUNT(Student_ID) > 3
);

          --134. Find students who have not completed any course.
SELECT S_Name
FROM Student
WHERE Student_ID NOT IN (
    SELECT Student_ID
    FROM Enrollment
    WHERE Status = 'Completed'
);

--135. Get the highest-rated course based on student reviews.
SELECT Course_ID, AVG(Rating) AS Average_Rating
FROM Reviews
GROUP BY Course_ID
ORDER BY Average_Rating DESC

--136. List the names of instructors who have taught courses with an average price above 200.
SELECT Name
FROM Instructor
WHERE Instructor_ID IN (
    SELECT Instructor_ID
    FROM Courses
    GROUP BY Instructor_ID
    HAVING AVG(Price) > 200
);

--137. Find students who have paid for all their enrolled courses.
SELECT S_Name
FROM Student
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Enrollment
    WHERE Enrollment_ID NOT IN (
        SELECT Enrollment_ID
        FROM Payment
    )
    GROUP BY Student_ID
    HAVING COUNT(*) = 0
);

--138. Get the course with the most number of assignments.
SELECT Course_ID, COUNT(*) AS Assignment_Count
FROM Assignments
GROUP BY Course_ID
ORDER BY Assignment_Count DESC

--139. List courses that have at least one student with a payment status 'Pending'.
SELECT Course_Name
FROM Courses
WHERE Course_ID IN (
    SELECT Course_ID
 FROM Payment
    WHERE Status = 'Pending');

--140. Get the names of students who have posted in discussion forums.
SELECT S_Name
FROM Student
WHERE Student_ID IN (
    SELECT Created_By
    FROM Discussion_Forums);

--141. Get the number of courses in each category:
SELECT Cat.Name, COUNT(C.Course_ID) AS Total_Courses
FROM Categories Cat
JOIN Courses C ON Cat.Category_ID = C.Category_ID
GROUP BY Cat.Name;

--142. Find the course with the most recent certification:
SELECT C.Course_Name, MAX(Certification_Date) AS Latest_Certification
FROM Courses C
JOIN Certificates Cert ON C.Course_ID = Cert.Course_ID
GROUP BY C.Course_Name
ORDER BY Latest_Certification DESC
  
--143. List all students who have enrolled in courses but haven't paid yet:
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
LEFT JOIN Payment P ON S.Student_ID = P.Student_ID
WHERE P.Payment_ID IS NULL;

--144. Get the courses with the highest number of reviews:
SELECT C.Course_Name, COUNT(R.Review_ID) AS Total_Reviews
FROM Courses C
JOIN Reviews R ON C.Course_ID = R.Course_ID
GROUP BY C.Course_Name
ORDER BY Total_Reviews DESC
  
--145. List all students who have enrolled in courses taught by "Jane Smith":
SELECT S.S_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID
JOIN Instructor I ON C.Instructor_ID = I.Instructor_ID
WHERE I.Name = 'Jane Smith';

--146. Show the total number of quiz attempts for each course:
SELECT C.Course_Name, COUNT(QA.Quiz_ID) AS Total_Attempts
FROM Courses C
JOIN Quizzes Q ON C.Course_ID = Q.Course_ID
JOIN Quiz_Attempts QA ON Q.Quiz_ID = QA.Quiz_ID
GROUP BY C.Course_Name;

--147. Get the list of courses that do not have a discount:
SELECT C.Course_Name
FROM Courses C
WHERE C.Discount_ID IS NULL;

--148. Show the students who have received a certification in the "Data Science" field:
SELECT DISTINCT S.S_Name
FROM Student S
JOIN Certificates C ON S.Student_ID = C.Student_ID
WHERE C.Certificate_Name LIKE '%Data Science%';

--149. List all instructors who have taught courses with a price above $500:
SELECT DISTINCT I.Name
FROM Instructor I
JOIN Courses C ON I.Instructor_ID = C.Instructor_ID
WHERE C.Price > 500;

 --150. Find the number of quizzes each student has taken, including those who have not taken any:
SELECT S.S_Name, COUNT(QA.Quiz_ID) AS Total_Quizze
FROM Student S
LEFT JOIN Quiz_Attempts QA ON S.Student_ID = QA.Student_ID
GROUP BY S.S_Name;


