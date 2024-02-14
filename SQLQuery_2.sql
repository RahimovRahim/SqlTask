CREATE DATABASE P336;
USE P336;
CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(55) DEFAULT 'XXXXXX',
    Age INT
);

CREATE TABLE Subjects (
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Exams (
    Id INT PRIMARY KEY IDENTITY,
    SubjectId INT FOREIGN KEY REFERENCES Subjects(Id),
    Date DATE
);

SELECT 
    s.Name AS StudentName,
    s.Surname AS StudentSurname,
    s.Age AS StudentAge,
    subj.Name AS SubjectName,
    e.Date AS ExamDate,
    se.ExamResult AS ExamResult
FROM 
    Students s
JOIN 
    StudentExams se ON s.Id = se.StudentId
JOIN 
    Exams e ON se.ExamId = e.Id
JOIN 
    Subjects subj ON e.SubjectId = subj.Id;
