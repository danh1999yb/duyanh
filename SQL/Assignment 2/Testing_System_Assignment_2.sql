-- DROP DATABASE Testing_System_Assignment_1;



-- DROP TABLE IF EXISTS Department;

DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;


-- bang phong ban
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID	SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL UNIQUE KEY CHECK(length(DepartmentName) >= 5)
);
	

-- bang chuc vu
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName 		ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);


-- bang tai khoan
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    Email 				VARCHAR(50) UNIQUE KEY CHECK (length(Email) >=8) NOT NULL,
    Username			VARCHAR(50) UNIQUE KEY CHECK (length(Username) >= 3 ) NOT NULL,
    FullName			VARCHAR(50) UNIQUE KEY CHECK (length(FullName) >= 8) NOT NULL,
    DepartmentID		SMALLINT UNSIGNED not null,
    PositionID			SMALLINT UNSIGNED not NULL,
    CreateDate			DATETIME,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);



DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName 			VARCHAR(50)  NOT NULL UNIQUE KEY CHECK (length(GroupName) >= 10 ) NOT NULL,
    CreatorID			SMALLINT UNSIGNED not null,
    CreateDate			DATETIME,
	FOREIGN KEY (CreatorID) REFERENCES Account (AccountID)
);


DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
	GroupID 			SMALLINT UNSIGNED ,
    AccountID 			SMALLINT UNSIGNED not null,
    JoinDate			DATETIME,
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
 );

-- loai cau hoi
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID 			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    TypeName 		VARCHAR(50) CHECK (length(TypeName) >= 5) NOT NULL
    
);

-- the loai cau hoi
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName 		VARCHAR(50) CHECK (length(CategoryName) >= 8) NOT NULL
);



DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
	QuestionID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 			VARCHAR(50) CHECK (length(Content) >=5) NOT NULL,
    CategoryID			SMALLINT UNSIGNED not null,
    TypeID				SMALLINT UNSIGNED NOT NULL,
    CreatorID			SMALLINT UNSIGNED NOT NULL,
    CreateDate			DATETIME ,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
	AnswerID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 			VARCHAR(50) CHECK (length(Content) >= 5) NOT NULL,
    QuestionID			SMALLINT UNSIGNED not null,
    isCorrect			ENUM('YES', 'NO'),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);



-- bang thi (duration = thoi luong, title = tieu de)
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` 			VARCHAR(50) CHECK (length(Code) >= 2) NOT NULL,
    Title			VARCHAR(50) CHECK (length(Title)>= 5) NOT NULL,
    CategoryID		SMALLINT UNSIGNED not null,
    Duration		SMALLINT UNSIGNED NOT NULL,
    CreatorID		SMALLINT UNSIGNED NOT NULL,
    CreateDate		DATETIME,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) 
);


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
	ExamID 			SMALLINT UNSIGNED NOT NULL,
    QuestionID 		SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) ,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)

);



-- add data

INSERT INTO Department (DepartmentID, Departmentname)
VALUES
( 1,		N'Marketing'	), 
( 2,		N'quản lí'		),
( 3,		N'Bảo vệ'		),
( 4,		N'Nhân sự'		),
( 5,		N'Kỹ thuật'		),
( 6,		N'Tài chính'	),
( 7,		N'Phó giám đốc'	),
( 8,		N'Giám đốc'		),
( 9,		N'Thư kí'		),
( 10,		N'Bán hàng'		);


INSERT INTO Position (PositionID, PositionName ) 
VALUES 	(1	,	'Dev' ),
		(2	,	'Test' ),
		(3	,	'Scrum Master'),
		(4	,	'PM' ); 

INSERT INTO `Account` 	(AccountID	, 	Email					, 	Username		,	 FullName				, DepartmentID, PositionID	, CreateDate)
VALUES	
						( 1			,	N'Danhcon9933@gmail.com',	N'ducanh'		,	N'Nguyễn Phan Duy Anh'	, '1'			,'1'		,'1999-09-09'),
						( 2			,	N'Danhcon3399@gmail.com',	N'duyanh'		,	N'Nguyễn tuấn Anh'	  	, '2'			,'2'		,'1999-08-09'),
						( 3			,	N'Danhcon3123@gmail.com',	N'Danhcon9933'	,	N'Nguyễn duy anh'	 	, '3'			,'3'		,'1999-08-09'),
						( 4			,	N'Danhcon321@gmail.com'	,	N'duyanhpro'	,	N'Nguyễn duc anh'	  	, '3'			,'3'		,'1999-08-09'),
						(5			,	N'Email4@gmail.com' 	,	N'duyduc'  		,	N'Nguyen Duy Duc' 		, '3' 			, '4' 		,'2021-03-04'),
						(6			,	N'Email5@gmail.com' 	, 	N'nguyenhoa'	,	N'Nguyen Thi Hoa' 		, '4' 			, '4' 		,'2022-03-02'),
						(7			,	N'Email6@gmail.com' 	, 	N'thiuyen' 		,	N'Nguyen Thi Uyen' 		, '6' 			, '3' 		,'2021-04-14'),
						(8			,	N'Email7@gmail.com' 	, 	N'thanhcong'	,	N'Pham Thanh Cong'		, '2' 			, '2' 		,'2021-06-24'),
						(9			,	N'Email8@gmail.com' 	, 	N'viethoang'	,	N'Le Viet Hoang' 		, '8' 			, '1' 		,'2021-04-21'),
						(10			,	N'Email9@gmail.com' 	, 	N'thutrang'  	,	N'Nguyen Thu Trang' 	, '2' 			, '2' 		,'2021-04-22'),
						(11			,	N'Email10@gmail.com'	, 	N'ngoclinh' 	,	N'Phan Ngoc Linh'		, '10' 			, '1' 		,'2021-04-30');

INSERT INTO `Group` (GroupID, GroupName, CreatorID, CreateDate)
VALUE
(1,		N'nhomhocbaiC#'		,	1	,'1998-03-03'),
(2,		N'nhomhocbaijava'	,	1	,'1997-03-03'),
(3,		N'nhomhocbaipython'	,	1	,'1996-03-30'),
(4,		N'nhomhocbaiC++	'	,	2	,'2000-03-30'),
(5,		N'nhomhocbaiC' 		, 	8 	,'2020-04-08'),
(6,		N'nhomhocbaisql'	,	9 	,'2020-04-09'),
(7,		N'nhomhocbaiJS' 	,	10 	,'2020-04-10'),
(8,		N'nhomhocbaiC++02'	,	2	,'2000-03-30'),
(9,		N'nhomhocbaiC02' 	, 	8 	,'2020-04-08'),
(10,	N'nhomhocbaiJS02' 	,	10 	,'2020-04-10');


INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUE
(1,		1,	'2000-8-5'),
(2,		2,	'2000-8-8'),
(3,		3,	'2000-5-8'),
(4,		4,	'2000-6-8'),
(5,		1,	'2000-8-5'),
(6,		2,	'2000-8-8'),
(7,		3,	'2000-5-8'),
(8,		4,	'2000-6-8'),
(9,		1,	'2000-8-5'),
(10,	2,	'2000-8-8');

INSERT INTO TypeQuestion (TypeID, TypeName)
VALUE
(1, N'trắc nhiệm'),
(2, N'tự luận');



INSERT INTO CategoryQuestion (CategoryID, CategoryName)
VALUE
(1, N'câu hỏi về dễ'),		
(2, N'câu hỏi khó'),
(3, N'câu hỏi JAVA'),
(4, N'câu hỏi vê C#'),
(5, N'câu hỏi SQL'),
(6, N'câu hỏi PYTHON'),
(7, N'câu hỏi JAVA'),
(8, N'câu hỏi vê C#'),
(9, N'câu hỏi SQL');

INSERT INTO Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate )
VALUE
(1,		N'câu hỏi về động vật'	,	1,	1,	1,	'1999-8-8'),
(2,		N'câu hỏi về cây cối'	,	2,	2,	2,	'1998-7-8'),
(3,		N'câu hỏi C#'			,	3,	2,	3,	'1999-8-8'),
(4,		N'câu hỏi về JAVA'		,	4,	1,	4,	'1999-8-8'),
(5,		N'câu hỏi về JAVA'		,	4,	1,	4,	'1999-8-8');



INSERT INTO Answer (AnswerID	, 	Content				, 		QuestionID		, 	isCorrect		)
VALUE				(1			,	N'câu trả lời 1'	,		1				, 	'YES'			),
					(2			,	N'câu trả lời 2'	,		2				, 	'NO'			),
                    (3			,	N'câu trả lời 3'	,		1				, 	'YES'			),
                    (4			,	N'câu trả lời 4'	,		1				, 	'YES'			),
                    (5			,	N'câu trả lời 5'	,		1				, 	'YES'			);
                    
INSERT INTO Exam (ExamID		, 	`Code`	, 					Title				, 	CategoryID  , 	Duration		, 	CreatorID			, 	CreateDate		)
VALUE			   (1			,	N'Mã 1'	,					N'Đề thi học kì'	, 	1			,	N'60'			,	1					,	'2019-9-8'		),
				   (2			,	N'Mã 2'	,					N'Đề thi quốc gia'	, 	1			,	N'90 '			,	2					,	'2020-8-7'		),
                   (3			,	N'Mã 3'	,					N'Đề thi qua moon'	, 	1			,	N'180 '			,	1					,	'2018-9-8'		),
                   (4			,	N'Mã 4'	,					N'Đề thi 15 phut'	, 	1			,	N'15 '			,	1					,	'2023-9-8'		),
                   (5			,	N'Mã 5'	,					N'Đề thi vip'		, 	1			,	N'30 '			,	1					,	'2017-9-8'		),
                   (6			,	N'Mã 6'	,					N'Đề thi java'		, 	1			,	N'180 '			,	1					,	'2019-3-8'		);
					
                   
INSERT INTO ExamQuestion(ExamID , QuestionID ) 
VALUES 						( 1 , 1 ),
							( 2 , 2 ),
                            ( 3 , 3 ),
                            ( 4 , 4 ),
                            ( 5 , 1 ),
                            ( 6 , 4 );
                            
                            