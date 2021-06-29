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
                        
                        
                        
                            
-- Question 2: lấy ra tất cả các phòng ban
SELECT * FROM Department;
-- Question 3: lấy ra id của phòng ban "Marketing"
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Marketing';
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `Account`
WHERE length(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id  = 3
SELECT *
FROM `Account`
WHERE DepartmentID = 3 AND length(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT *
FROM `Group`
WHERE CreateDate < '2019-12-20' ;
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID, count(QuestionID) AS SO_CAU_TRA_LOI
FROM answer 
GROUP BY QuestionID 
HAVING  count(QuestionID) >=4;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `Code`
FROM Exam
WHERE Duration >= 60 AND  CreateDate < '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;
-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT DepartmentID, count(AccountID )
FROM `Account`
WHERE DepartmentID = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `Account`
WHERE Username LIKE 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 
FROM Exam
WHERE CreateDate < '2019-12-20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM Question
WHERE Content LIKE 'câu hỏi%';
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account`
	SET	Email = 'loc.nguyenba@vti.com.vn',
		FullName = 'Nguyễn Bá Lộc'
WHERE AccountID = 5;
SELECT * FROM `Account`;
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE GroupAccount
	SET GroupID = 4
WHERE AccountID = 5 ;
