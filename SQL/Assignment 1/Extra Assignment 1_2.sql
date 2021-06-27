
-- ex1
DROP DATABASE IF EXISTS  Fresher_Training_Management;
CREATE DATABASE  IF NOT EXISTS  Fresher_Training_Management;
USE Fresher_Training_Management;
CREATE TABLE Trainee (
    TraineeID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(50) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ TINYINT UNSIGNED,
    ET_Gmath TINYINT UNSIGNED,
    ET_English SMALLINT UNSIGNED,
    Training_Class VARCHAR(50),
    Evaluation_Notes VARCHAR(50)
);
ALTER TABLE Trainee 
ADD COLUMN VTI_Account VARCHAR(50) NOT NULL UNIQUE;


INSERT INTO Trainee (TraineeID,Full_Name, Birth_Date,Gender,ET_IQ,ET_Gmath, ET_English, Training_Class,Evaluation_Notes,VTI_Account)
VALUE 	(1, 'Duyanh', '1999-03-03', 'male', 9, 11, 18, 'VTI1', 'LOP15', 'vit15'),
		(2, 'Ducanh', '1999-04-03', 'male', 8, 5, 4, 'VTI2', 'LOP15', 'vit16'),	
        (3, 'tuananh', '1999-05-03', 'male', 9, 5, 4, 'VTI3', 'LOP15', 'vit17'),
        (4, 'theanh', '1999-03-03', 'male', 4, 1, 4, 'VTI4', 'LOP15', 'vit18'),
        (5, 'thuyanh', '1999-04-03', 'male', 2, 4, 4, 'VTI5', 'LOP15', 'vit19'),
        (6, 'Duyanh', '1999-05-03', 'male', 4, 6, 4, 'VTI6', 'LOP15', 'vit14'),
		(7, 'Ducanh', '1999-03-03', 'male', 3, 1, 4, 'VTI5', 'LOP15', 'vit13'),	
        (8, 'tuananh', '1999-04-03', 'male', 5, 9, 1, 'VTI5', 'LOP15', 'vit12'),
        (9, 'theanh', '1999-05-03', 'male', 9, 2, 6, 'VTI5', 'LOP15', 'vit11'),
        (10, 'thuyanh', '1999-03-03', 'male', 4, 8, 4, 'VTI5', 'LOP15', 'vit10');
        
		


				


-- ex2
DROP DATABASE IF EXISTS  ex2;
CREATE DATABASE IF NOT EXISTS  ex2;

CREATE TABLE bang (
    ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(20) NOT NULL,
    `Code` CHARACTER(5) NOT NULL,
    ModifiedDate DATETIME 
);

-- ex3
DROP DATABASE IF EXISTS  ex3;
CREATE DATABASE IF NOT EXISTS  ex3;

CREATE TABLE bang3 (
    ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `NAME` VARCHAR(20) NOT NULL,
    BirthDate DATE,
    Gender ENUM('0', '1', 'NULL') NOT NULL,
    IsDeletedFlag ENUM('0', '1') NOT NULL
);


-- Exercise 1: Tiếp tục với Database quản lý Fresher
-- Question 1: Thêm ít nhất 10 bản ghi vào table
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT *
FROM Trainee
GROUP BY TraineeID 
HAVING ET_IQ >=5 OR ET_Gmath >= 5 OR ET_English >= 5
ORDER BY Birth_Date ASC;

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT *
FROM trainee
WHERE length(Full_Name) = (SELECT max(Length(Full_Name)) FROM trainee);

/* Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
 ET_IQ + ET_Gmath>=20
 ET_IQ>=8
 ET_Gmath>=8
 ET_English>=18 */

SELECT TraineeID, Full_Name, ET_IQ, ET_Gmath, ET_English , concat(ET_IQ + ET_Gmath  ) AS diem_tong_iq_gmath
FROM trainee
WHERE concat(ET_IQ + ET_Gmath  ) >= 20 AND ET_IQ >=8 AND ET_Gmath >= 8 AND ET_English >= 18;



-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE
FROM trainee
WHERE TraineeID = 3;
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee
SET Training_Class = 2
WHERE TraineeID = 5
