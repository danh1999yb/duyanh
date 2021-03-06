DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(50) NOT NULL UNIQUE KEY
);
SELECT * FROM Department;

DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
 AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Email VARCHAR(50) NOT NULL UNIQUE KEY,
 Username VARCHAR(50) NOT NULL UNIQUE KEY,
 FullName NVARCHAR(50) NOT NULL,
 DepartmentID TINYINT UNSIGNED NOT NULL,
 PositionID TINYINT UNSIGNED NOT NULL,
 CreateDate DATETIME DEFAULT NOW(),
 FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);


DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
 GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
 GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
 CreatorID TINYINT UNSIGNED,
 CreateDate DATETIME DEFAULT NOW(),
 FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
 GroupID TINYINT UNSIGNED NOT NULL,
 AccountID TINYINT UNSIGNED NOT NULL,
 JoinDate DATETIME DEFAULT NOW(),
 PRIMARY KEY (GroupID,AccountID),
 FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID), 
 FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID) 
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
 TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
 CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
 QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Content NVARCHAR(100) NOT NULL,
 CategoryID TINYINT UNSIGNED NOT NULL,
 TypeID TINYINT UNSIGNED NOT NULL,
 CreatorID TINYINT UNSIGNED NOT NULL, CreateDate DATETIME DEFAULT NOW(),
 FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
 FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
 FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId) 
);


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
 ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 `Code` CHAR(10) NOT NULL,
 Title NVARCHAR(50) NOT NULL,
 CategoryID TINYINT UNSIGNED NOT NULL,
 Duration TINYINT UNSIGNED NOT NULL,
 CreatorID TINYINT UNSIGNED NOT NULL,
 CreateDate DATETIME DEFAULT NOW(),
 FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
 FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
 ExamID TINYINT UNSIGNED NOT NULL,
 QuestionID TINYINT UNSIGNED NOT NULL,
 FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
 FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
 PRIMARY KEY (ExamID,QuestionID)
);



DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
 AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Content NVARCHAR(100) NOT NULL,
 QuestionID TINYINT UNSIGNED NOT NULL,
 isCorrect BIT DEFAULT 1,
 FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);





INSERT INTO Department(DepartmentName) 
VALUES
(N'Marketing' ),
(N'Sale' ),
(N'B???o v???' ),
(N'Nh??n s???' ),
(N'K??? thu???t' ),
(N'T??i ch??nh' ),
(N'Ph?? gi??m ?????c'),
(N'Gi??m ?????c' ),
(N'Th?? k??' ),
(N'No person' ),
(N'B??n h??ng' );

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
VALUES 						(N'C??u h???i v??? Java' , 1 		, '1' 		, '2' 			,'2020-04-05'),
							(N'C??u H???i v??? PHP' 	, 10 		, '2' 		, '2' 			,'2020-04-05'),
							(N'H???i v??? C#' 		, 9 		, '2' 		, '3' 			,'2020-04-06'),
							(N'H???i v??? Ruby' 	, 6 		, '1' 		, '4' 			,'2020-04-06'),
							(N'H???i v??? Postman'	, 5 		, '1' 		, '5' 			,'2020-04-06'),
							(N'H???i v??? ADO.NET' 	, 3 		, '2' 		, '6' 			,'2020-04-06'),
							(N'H???i v??? ASP.NET' 	, 2 		, '1' 		, '7' 			,'2020-04-06'),
							(N'H???i v??? C++' 		, 8 		, '1' 		, '8' 			,'2020-04-07'),
							(N'H???i v??? SQL' 		, 4 		, '2' 		, '9' 			,'2020-04-07'),
							(N'alo Python'		, 7 		, '1' 		, '10'			,'2020-04-07');


INSERT INTO Answer 	( Content 		, QuestionID 	, isCorrect )
VALUES 				(N'Tr??? l???i 01'	, 1 			, 0			),
					(N'Tr??? l???i 02' 	, 1 			, 1			),
					(N'Tr??? l???i 03'	, 1 			, 0 		),
					(N'Tr??? l???i 04'	, 1 			, 1 		),
					(N'Tr??? l???i 05'	, 2 			, 1 		),
					(N'Tr??? l???i 06'	, 3 			, 1 		),
					(N'Tr??? l???i 07'	, 4 			, 0 		),
					(N'Tr??? l???i 08'	, 8 			, 0 		),
					(N'Tr??? l???i 09'	, 9 			, 1 		),
					(N'Tr??? l???i 10'	, 10			, 1			);
 
 
 
 INSERT INTO Exam 	(`Code` 	, Title 			, CategoryID	, Duration 		, CreatorID 	, CreateDate )
VALUES 				('VTIQ001' 	, N'????? thi C#' 		, 1 			, 30 			, '5' 			,'2019-04-05'),
					('VTIQ002' 	, N'????? thi PHP' 	,10 			, 60 			, '2' 			,'2019-04-05'),
					('VTIQ003' 	, N'????? thi C++' 	, 9 			,120 			, '2' 			,'2019-04-07'),
					('VTIQ004' 	, N'????? thi Java' 	, 6 			, 60			, '3' 			,'2020-04-08'),
					('VTIQ005' 	, N'????? thi Ruby' 	, 5 			, 120			, '4' 			,'2020-04-10'),
					('VTIQ006' 	, N'????? thi Postman' , 3 			,60 			, '6' 			,'2020-04-05'),
					('VTIQ007' 	, N'????? thi SQL' 	, 2 			,60 			, '7' 			,'2020-04-05'),
					('VTIQ008' 	, N'????? thi Python' 	, 8 			,60 			, '8' 			,'2020-04-07'),
					('VTIQ009' 	, N'????? thi ADO.NET' , 4 			,90 			, '9' 			,'2020-04-07'),
					('VTIQ010' 	, N'????? thi ASP.NET' , 7 			,90 			, '10' 			,'2020-04-08');
 
 
 
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
                        


-- Question 1: T???o view c?? ch???a danh s??ch nh??n vi??n thu???c ph??ng ban Marketing
DROP VIEW IF EXISTS account_marketing;
CREATE OR REPLACE VIEW account_marketing AS 
SELECT a.AccountID, a.FullName, a.DepartmentID, d.DepartmentName
FROM  `Account` a 
JOIN Department d ON a.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Marketing';
SELECT * FROM account_marketing;
-- Question 2: T???o view c?? ch???a th??ng tin c??c account tham gia v??o nhi???u group nh???t
DROP VIEW IF EXISTS account_group_max;
CREATE OR REPLACE VIEW account_group_max AS 
SELECT a.AccountID, a.FullName , count(ga.GroupID) AS so_luong_group_tham_gia
FROM `Account` a
INNER JOIN groupaccount ga  ON ga.AccountID = a.AccountID
GROUP BY ga.AccountID
HAVING ga.AccountID = (SELECT (max(Group_account) )	
					   FROM  (SELECT count(AccountID) AS Group_account
							  From groupaccount
						      GROUP BY AccountID) AS P);
SELECT * FROM account_group_max;



-- Question 3: T???o view c?? ch???a c??u h???i c?? nh???ng content qu?? d??i (content qu?? 300 t???  ???????c coi l?? qu?? d??i) v?? x??a n?? ??i
DROP VIEW IF EXISTS Question_max;
CREATE OR REPLACE VIEW Question_max AS 
SELECT *
FROM Question
WHERE length(Content) > 18  ;

SELECT * FROM Question_max;
DROP VIEW Question_max;
-- Question 4: T???o view c?? ch???a danh s??ch c??c ph??ng ban c?? nhi???u nh??n vi??n nh???t
DROP VIEW IF EXISTS department_max_account;
CREATE OR REPLACE VIEW department_max_account AS 
SELECT d.DepartmentID, d.DepartmentName, count(a.AccountID) AS department_max_account
FROM Department d
JOIN `Account` a ON d.DepartmentID = a.DepartmentID
GROUP BY a.DepartmentID
HAVING count(a.DepartmentID) = ( SELECT ( max(abc) ) 
						FROM ( SELECT count(DepartmentID) AS abc
							 FROM `Account`
                             GROUP BY DepartmentID) AS abcd);
SELECT * FROM department_max_account;
												
                        
                        

-- Question 5: T???o view c?? ch???a t???t c??c c??c c??u h???i do user h??? Nguy???n t???o
DROP VIEW IF EXISTS question_nguyen;
CREATE OR REPLACE VIEW question_nguyen AS  
SELECT q.QuestionID, q.Content, a.FullName
FROM Question q
JOIN `Account` a ON q.CreatorID = a.AccountID
WHERE FullName LIKE "Nguy???n%";

SELECT * FROM question_nguyen;
