

DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE testing_system_assignment_1;

USE testing_system_assignment_1;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
    PositionID INT PRIMARY KEY,
    PositionName VARCHAR(50)
);

DROP TABLE IF EXISTS `account`;
CREATE TABLE `Account` (
    AccountID INT,
    Email VARCHAR(50),
    Username VARCHAR(50),
    FullName VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(50),
    CreatorID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount` (
    GroupID INT PRIMARY KEY ,
    AccountID INT,
    JoinDate DATE
);

DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion` (
    TypeID INT PRIMARY KEY,
    TypeName VARCHAR(50)
);


DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion` (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question` (
    QuestionID INT PRIMARY KEY,
    Content VARCHAR(50),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer` (
    AnswerID INT PRIMARY KEY,
    Content VARCHAR(50),
    QuestionID INT,
    isCorrect VARCHAR(50)
);



DROP TABLE IF EXISTS `Exam`;
CREATE TABLE `Exam` (
    ExamID INT PRIMARY KEY,
    `Code` VARCHAR(50),
    Title VARCHAR(50),
    CategoryID INT,
    Duration VARCHAR(50),
    CreatorID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion` (
    ExamID INT PRIMARY KEY,
    QuestionID INT
);

/* Daay la comment tu dong */