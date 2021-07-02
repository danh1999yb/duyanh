DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL UNIQUE KEY
);
SELECT 
    *
FROM
    Department;

DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    Username VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName NVARCHAR(50) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
);


DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID TINYINT UNSIGNED,
    CreateDate DATETIME,
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountId)
);


DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID TINYINT UNSIGNED NOT NULL,
    AccountID TINYINT UNSIGNED NOT NULL,
    JoinDate DATETIME,
    PRIMARY KEY (GroupID , AccountID),
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(100) NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    TypeID TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME ,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountId)
);


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` CHAR(10) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    CategoryID TINYINT UNSIGNED NOT NULL,
    Duration TINYINT UNSIGNED NOT NULL,
    CreatorID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME ,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID)
        REFERENCES `Account` (AccountId)
);


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID TINYINT UNSIGNED NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID),
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID),
    PRIMARY KEY (ExamID , QuestionID)
);



DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(100) NOT NULL,
    QuestionID TINYINT UNSIGNED NOT NULL,
    isCorrect BIT DEFAULT 1,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);





INSERT INTO Department(DepartmentName) 
VALUES
(N'Marketing' ),
(N'Sale' ),
(N'Bảo vệ' ),
(N'Nhân sự' ),
(N'Kỹ thuật' ),
(N'Tài chính' ),
(N'Phó giám đốc'),
(N'Giám đốc' ),
(N'Thư kí' ),
(N'No person' ),
(N'Bán hàng' );

INSERT INTO Position (PositionName ) 
VALUES 	('Dev' ),
		('Test' ),
		('Scrum Master'),
		('PM' )
        
        
        ; 


INSERT INTO `Account`(Email 			 ,  Username	, FullName 	 			, DepartmentID , PositionID, CreateDate)
VALUES 				 ('Email1@gmail.com' , 'duyanh'  	,'Nguyen Phan Duy Anh' 	, '5' 			, '1'		,'2021-03-03'),
					 ('Email2@gmail.com' , 'ducanh'  	,'Nguyen Duc Anh' 		, '1' 			, '2'		,'2021-03-05'),
					 ('Email3@gmail.com' , 'hoanglong'  ,'Ha Hoang Long' 		, '2' 			, '2' 		,'2021-03-08'),
					 ('Email4@gmail.com' , 'duyduc'  	,'Nguyen Duy Duc' 		, '3' 			, '4' 		,'2021-03-04'),
					 ('Email5@gmail.com' , 'nguyenhoa'  ,'Nguyen Thi Hoa' 		, '4' 			, '4' 		,'2022-03-02'),
					 ('Email6@gmail.com' , 'thiuyen' 	,'Nguyen Thi Uyen' 		, '6' 			, '3' 		,'2021-04-14'),
					 ('Email7@gmail.com' , 'thanhcong'  ,'Pham Thanh Cong'		, '2' 			, '2' 		,'2021-06-24'),
					 ('Email8@gmail.com' , 'viethoang'  ,'Le Viet Hoang' 		, '8' 			, '1' 		,'2021-04-21'),
					 ('Email9@gmail.com' , 'thutrang'  	,'Nguyen Thu Trang' 	, '2' 			, '2' 		,'2021-04-22'),
					 ('Email10@gmail.com', 'ngoclinh' 	,'Phan Ngoc Linh'		, '10' 			, '1' 		,'2021-04-30'),
					 ('Email11@gmail.com', 'thuha'		,'Nguyen Thu Ha'		, '10' 			, '1' 		,'2021-01-30'),
					 ('Email12@gmail.com', 'caothanh' 	,'Cao Trung Thanh'		, '10' 			, '1' 		,'2021-08-30');


INSERT INTO `Group` ( GroupName 		, CreatorID , CreateDate )
			VALUES 	(N'Testing System' 	, 5			,'2019-03-05'),
					(N'Development' 	, 1			,'2020-03-07'),
					(N'VTI Sale 01' 	, 2 		,'2020-03-09'),
					(N'VTI Sale 02' 	, 3 		,'2020-03-10'),
					(N'VTI Sale 03' 	, 4 		,'2020-03-28'),
					(N'VTI Creator' 	, 6 		,'2020-04-06'),
					(N'VTI Marketing 01', 7 		,'2020-04-07'),
					(N'Management' 		, 8 		,'2020-04-08'),
					(N'Chat with love'	, 9 		,'2020-04-09'),
					(N'Vi Ti Ai' 		, 10 		,'2020-04-10');


INSERT INTO `GroupAccount` 	( GroupID 	, AccountID , JoinDate	 )
VALUES 						( 1 		, 1			,'2019-03-05'),
							( 1 		, 2			,'2020-03-07'),
							( 3			, 3			,'2020-03-09'),
							( 3 		, 4			,'2020-03-10'),
							( 5 		, 5			,'2020-03-28'),
							( 1		 	, 3			,'2020-04-06'),
							( 1			, 7			,'2020-04-07'),
							( 8 		, 3			,'2020-04-08'),
							( 1		 	, 9			,'2020-04-09'),
							( 10		, 10		,'2020-04-10');



INSERT INTO TypeQuestion (TypeName ) 
VALUES 	('Essay' ), 
		('Multiple-Choice' ); 



INSERT INTO CategoryQuestion (CategoryName )
VALUES 	('Java' ),
		('ASP.NET' ),
		('ADO.NET' ),
		('SQL' ),
		('Postman' ),
		('Ruby' ),
		('Python' ),
		('C++' ),
		('C Sharp' ),
		('PHP' );
        
        INSERT INTO Question(Content 			, CategoryID, TypeID 	, CreatorID		, CreateDate )
VALUES 						(N'Câu hỏi về Java' , 1 		, '1' 		, '2' 			,'2020-04-05'),
							(N'Câu Hỏi về PHP' 	, 10 		, '2' 		, '2' 			,'2020-04-05'),
							(N'Hỏi về C#' 		, 9 		, '2' 		, '3' 			,'2020-04-06'),
							(N'Hỏi về Ruby' 	, 6 		, '1' 		, '4' 			,'2020-04-06'),
							(N'Hỏi về Postman'	, 5 		, '1' 		, '5' 			,'2020-04-06'),
							(N'Hỏi về ADO.NET' 	, 3 		, '2' 		, '6' 			,'2020-04-06'),
							(N'Hỏi về ASP.NET' 	, 2 		, '1' 		, '7' 			,'2020-04-06'),
							(N'Hỏi về C++' 		, 8 		, '1' 		, '8' 			,'2020-04-07'),
							(N'Hỏi về SQL' 		, 4 		, '2' 		, '9' 			,'2020-04-07'),
							(N'alo Python'		, 7 		, '1' 		, '10'			,'2020-04-07');


INSERT INTO Answer 	( Content 		, QuestionID 	, isCorrect )
VALUES 				(N'Trả lời 01'	, 1 			, 0			),
					(N'Trả lời 02' 	, 1 			, 1			),
					(N'Trả lời 03'	, 1 			, 0 		),
					(N'Trả lời 04'	, 1 			, 1 		),
					(N'Trả lời 05'	, 2 			, 1 		),
					(N'Trả lời 06'	, 3 			, 1 		),
					(N'Trả lời 07'	, 4 			, 0 		),
					(N'Trả lời 08'	, 8 			, 0 		),
					(N'Trả lời 09'	, 9 			, 1 		),
					(N'Trả lời 10'	, 10			, 1			);
 
 
 
 INSERT INTO Exam 	(`Code` 	, Title 			, CategoryID	, Duration 		, CreatorID 	, CreateDate )
VALUES 				('VTIQ001' 	, N'Đề thi C#' 		, 1 			, 30 			, '5' 			,'2019-04-05'),
					('VTIQ002' 	, N'Đề thi PHP' 	,10 			, 60 			, '2' 			,'2019-04-05'),
					('VTIQ003' 	, N'Đề thi C++' 	, 9 			,120 			, '2' 			,'2019-04-07'),
					('VTIQ004' 	, N'Đề thi Java' 	, 6 			, 60			, '3' 			,'2020-04-08'),
					('VTIQ005' 	, N'Đề thi Ruby' 	, 5 			, 120			, '4' 			,'2020-04-10'),
					('VTIQ006' 	, N'Đề thi Postman' , 3 			,60 			, '6' 			,'2020-04-05'),
					('VTIQ007' 	, N'Đề thi SQL' 	, 2 			,60 			, '7' 			,'2020-04-05'),
					('VTIQ008' 	, N'Đề thi Python' 	, 8 			,60 			, '8' 			,'2020-04-07'),
					('VTIQ009' 	, N'Đề thi ADO.NET' , 4 			,90 			, '9' 			,'2020-04-07'),
					('VTIQ010' 	, N'Đề thi ASP.NET' , 7 			,90 			, '10' 			,'2020-04-08');
 
 
 
INSERT INTO ExamQuestion(ExamID , QuestionID 	) 
VALUES 					( 1 	, 5 			),
						( 2 	, 10 			), 
						( 3 	, 4 			), 
						( 4 	, 3 			), 
						( 5 	, 7 			), 
						( 6 	, 10 			), 
						( 7 	, 2 			), 
						( 8 	, 10			), 
						( 9 	, 9 			), 
						( 10 	, 8 			);
                        


-- E xercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `Account` a
JOIN Department d ON a.DepartmentID = d.DepartmentID;


-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 
SELECT *
FROM `Account`
WHERE CreateDate > '2010-12-20';
-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT AccountID,Username, FullName , PositionName
FROM `Account`a
JOIN Position p ON a.PositionID = p.PositionID
;
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT *, count(a.DepartmentID) AS So_NV
FROM `Account` a
INNER JOIN Department d ON a.DepartmentID = d.DepartmentID
GROUP BY a.DepartmentID
HAVING count(a.DepartmentID)  > 3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều  nhất
SELECT q.QuestionID, q.Content, count(q.QuestionID)
FROM Question q
INNER JOIN examquestion e ON q.QuestionID = e.QuestionID
GROUP BY e.QuestionID
HAVING count(e.QuestionID) = ( SELECT max(duyanh) FROM (SELECT  count(QuestionID) AS duyanh
														FROM examquestion
                                                        GROUP BY QuestionID ) AS DA)
;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT  count(QuestionID), cq.CategoryName, q.CategoryID
FROM categoryquestion cq
INNER JOIN question q ON cq.CategoryID = q.CategoryID 
GROUP BY q.QuestionID
HAVING count(q.QuestionID);
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
	SELECT q.QuestionID, q.Content  , count(eq.QuestionID) AS question_of_exam
	FROM Question q
	JOIN examquestion eq ON q.QuestionID = eq.QuestionID
	GROUP BY eq.QuestionID
	HAVING count(eq.QuestionID)
;
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất-
SELECT q.QuestionID, q.Content, a.Content, count(a.Content) AS ANSWER_MAX
FROM Question q
JOIN answer a ON q.QuestionID = a.QuestionID
GROUP BY a.QuestionID
HAVING count(a.QuestionID)
LIMIT 1
 ;

-- Question 9: Thống kê số lượng account trong mỗi group 
SELECT a.AccountID , a.FullName, ga.GroupID, count(a.AccountID) AS account_of_group
FROM `Account` a
JOIN groupaccount ga ON a.AccountID = ga.AccountID
GROUP BY a.AccountID
;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT a.PositionID, p.PositionName, count(a.PositionID) AS position_min_account
FROM position p
JOIN `Account` a ON p.PositionID = a.PositionID
GROUP BY a.PositionID 
ORDER BY PositionID DESC
LIMIT 1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT  a.PositionID, p.PositionName, a.AccountID, a.FullName, count(d.DepartmentID ) AS So_luong
FROM `Account` a 
JOIN  position p ON p.PositionID = a.PositionID
JOIN department d ON a.DepartmentID = d.DepartmentID
GROUP BY p.PositionName
;



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của  question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT  q.QuestionID, tq.TypeName , a.Content, ac.FullName AS nguoi_tao
-- , q.CreatorID
FROM Question q
JOIN typequestion	tq 		ON q.TypeID 	= tq.TypeID
JOIN Answer 		a		ON q.QuestionID = a.QuestionID
JOIN `Account` 		ac 		ON q.CreatorID 	= ac.AccountID
;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT   q.QuestionID, t.TypeName , count(t.TypeName) AS so_luong
FROM typequestion t
JOIN Question q ON t.TypeID = q.TypeID
GROUP BY t.TypeName
;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM `Group` g
LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
WHERE ga.GroupID IS NULL;
-- Question 15: Lấy ra group không có account nào-
-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question q
LEFT JOIN answer a ON q.QuestionID = a.QuestionID
WHERE a.QuestionID IS NULL;


-- Exercise 2: Union
/* 1Question 17: 
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
*/
SELECT * 
FROM `Account` a
JOIN Position p ON a.PositionID = p.PositionID
WHERE p.PositionID = 1
UNION
SELECT * 
FROM `Account` a
JOIN Position p ON a.PositionID = p.PositionID
WHERE p.PositionID = 2
;
/*
Question 18: 
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)
*/
SELECT *, count(ga.GroupID) AS so_luong
FROM `Group` g
JOIN groupaccount  ga ON g.GroupID = ga.GroupID
GROUP BY ga.GroupID
HAVING count(ga.GroupID) > 2
UNION
SELECT *, count(ga.GroupID) AS so_luong
FROM `Group` g
JOIN groupaccount  ga ON g.GroupID = ga.GroupID
GROUP BY g.GroupID
HAVING count(ga.GroupID) < 7;