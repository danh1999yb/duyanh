DROP DATABASE IF EXISTS extra4;
CREATE DATABASE  extra4;

USE extra4;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
Department_Number INT PRIMARY KEY,
 Department_Name VARCHAR(50)
 );
INSERT INTO Department (Department_Number, Department_Name)
VALUE					(1 , N'Ke Toan'),
						(2 , N'Phuc vu'),
                        (3 , N'bao ve'),
						(4 , N'lao cong'),
                        (5 , N'quet rac'),
						(6 , N'bao ke'),
                        (7 , N'tai chinh'),
						(9 , N'nhan su'),
                        (10, N'ban hang');
						
DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table (
Employee_Number INT PRIMARY KEY,
 Employee_Name VARCHAR(50), 
Department_Number INT
);
INSERT INTO Employee_Table ( Employee_Number, Employee_Name, Department_Number)
VALUE 						( 1 ,		N'Duy Anh',	'1'),
							( 2 ,		N'Duc Anh',	'2'),
							( 3 ,		N'Danh Anh','3'),
                            ( 4 ,		N'Da Anh',	'4'),
                            ( 5 ,		N'Du Anh',	'2'),
                            ( 6 ,		N'Dao Anh',	'6'),
                            ( 7 ,		N'Di Anh',	'2'),
                            ( 8 ,		N'De Anh',	'7'),
                            ( 9 ,		N'Dac Anh',	'8'),
                            ( 10 ,		N'Dom Anh',	'9');

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table (
Employee_Number INT PRIMARY KEY, 
Skill_Code VARCHAR(50),
`Date Registered` DATETIME
 );
 INSERT INTO Employee_Skill_Table ( Employee_Number, Skill_Code)
 VALUE								( 1 ,	N'C#'),
									( 2 ,	N'C++'),
                                    ( 3 ,	N'python'),
                                    ( 4 ,	N'javaJS'),
                                    ( 5 ,	N'python'),
                                    ( 6 ,	N'javaJS'),
                                    ( 7 ,	N'python'),
                                    ( 8 ,	N'java'),
                                    ( 9 ,	N'javaJS'),
                                    ( 10 ,	N'java');
 

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java Hướng dẫn: sử dụng UNION
SELECT *
FROM Employee_Table et
JOIN Employee_Skill_Table est ON et.Employee_Number = est.Employee_Number
HAVING est.Skill_Code = 'java';



SELECT et.Employee_Number, est.Skill_Code
FROM Employee_Skill_Table est
WHERE Skill_Code = 'java'
UNION
SELECT Employee_Number, Skill_Code
FROM Employee_Table et
;
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT d.Department_Number, d.Department_Name,et.Employee_Name, d.Department_Number, count( d.Department_Name)
FROM department d
JOIN employee_table et ON d.Department_Number = et.Department_Number
GROUP BY et.Employee_Number
HAVING et.Employee_Number >3
;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.  --Hướng dẫn: sử dụng GROUP BY
SELECT et.Employee_Number, et.Employee_Name, et.Department_Number, d.Department_Name,count(d.Department_Number) AS ds_nv
FROM employee_table et
JOIN department d ON et.Department_Number = d.Department_Number
GROUP BY d.Department_Number;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.Hướng dẫn: sử dụng DISTINCT
SELECT DISTINCT et.Employee_Number, et.Employee_Name,  est.Skill_Code, count(est.Skill_Code) AS so_luong_skill 
FROM employee_table et
JOIN employee_skill_table est ON et.Employee_Number = est.Employee_Number
GROUP BY est.Employee_Number
HAVING Skill_Code IN ( 'java','javaJS','python','C#','C++')