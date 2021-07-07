
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các  account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS Store_1;
DELIMITER $$
CREATE PROCEDURE Store_1 (IN in_account_department VARCHAR(50) )
	BEGIN
		SELECT *
        FROM Department   d
        JOIN `Account` a ON d.DepartmentID = a.DepartmentID
        WHERE d.DepartmentName = in_account_department
        ;
    END$$
DELIMITER ;
CALL Store_1 ('Sale');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS Store_2;
DELIMITER $$
CREATE PROCEDURE Store_2( IN in_account_group VARCHAR(50) )
	BEGIN
		SELECT *, count(ga.GroupID)
        FROM `Group` g
        JOIN groupaccount ga ON g.GroupID = ga.GroupID
        WHERE ga.GroupID = in_account_group
        ;
    END$$
DELIMITER ;
CALL Store_2 ('1');
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo  trong tháng hiện tại
DROP PROCEDURE IF EXISTS Store_3;
DELIMITER $$
CREATE PROCEDURE Store_3( IN in_type_of_question VARCHAR(50) )
	BEGIN
		SELECT *, count( q.TypeID)
        FROM typequestion tq 
        JOIN question q ON tq.TypeID = q.TypeID
        WHERE month(q.CreateDate) = month(now())
		;
	END$$
DELIMITER ;
CALL Store_3(1);
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS Store_4;
DELIMITER $$
CREATE PROCEDURE Store_4 ( IN in_idtypequestion_max_question VARCHAR(50) )
	BEGIN
		SELECT * , count(q.TypeID ) 
        FROM typequestion tq
        JOIN question q ON tq.TypeID = q.TypeID 
        GROUP BY q.TypeID 
        HAVING q.TypeID = ( SELECT ( max(abc) ) 
							FROM ( SELECT count(QuestionID) AS abc
									FROM question
                                    GROUP BY QuestionID ) AS abcc )
        ;
    END $$
DELIMITER ;
CALL Store_4(1);
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS Store_5;
DELIMITER $$
CREATE PROCEDURE Store_5 ( IN in_idtypequestion_max_question VARCHAR(50) )
	BEGIN
		SELECT * , count(q.TypeID ) 
        FROM typequestion tq
        JOIN question q ON tq.TypeID = q.TypeID 
        GROUP BY q.TypeID 
        HAVING q.TypeID = ( SELECT ( max(abc) ) 
							FROM ( SELECT count(QuestionID) AS abc
									FROM question
                                    GROUP BY QuestionID ) AS abcc )
        ;
    END $$
DELIMITER ;
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên  chứa chuỗi của người dùng nhập vào hoặc trả về user 
-- có username chứa  chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS Store_6;
DELIMITER $$
CREATE PROCEDURE Store_6 ( IN in_chuoi VARCHAR(50))
	BEGIN 
		SELECT GroupName
        FROM `group` 
        WHERE GroupName LIKE ('%W%')
        UNION
        SELECT Username
        FROM `Account` 
        WHERE Username LIKE ('%W%')
        ;
    END $$
DELIMITER ;
CALL Store_6('w');
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và  trong store sẽ tự động gán:username 
-- sẽ giống email nhưng bỏ phần @..mail positionID: sẽ có default là developer departmentID: sẽ được cho vào 1 phòng chờ Sau đó in ra kết quả tạo thành công
DROP PROCEDURE IF EXISTS Store_7;
DELIMITER $$
CREATE PROCEDURE Store_7 (IN in_fullname VARCHAR(50), IN in_email VARCHAR (50)  )
	BEGIN
        DECLARE v_DepartmentID INT DEFAULT 11;
		DECLARE v_Username VARCHAR(50) DEFAULT SUBSTRING_INDEX( in_email, '@',1);
        DECLARE v_PositionID INT DEFAULT 1;
		DECLARE v_CreateDate DATETIME DEFAULT now();
        INSERT INTO `account` (  Email, Username,  FullName, DepartmentID, PositionID, CreateDate)
		VALUE (  in_email, v_Username,  in_fullname, v_DepartmentID, v_PositionID, v_CreateDate);
				
    END $$ 
DELIMITER ;

Call Store_7('danhcap@viettel.com.vn','danh con nguyen');
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DROP PROCEDURE IF EXISTS Store_6;
DELIMITER $$
CREATE PROCEDURE Store_6 (IN in_cauhoi VARCHAR(50)  )
	BEGIN
		DECLARE v_TypeID INT UNSIGNED;
		SELECT tq.TypeID INTO v_TypeID
        FROM typequestion tq
		WHERE tq.TypeName = in_cauhoi;
        IF in_cauhoi = 'Essay' THEN 
        
			SELECT *
            FROM question q
            WHERE TypeID = v_TypeID AND length(q.Content) = ( SELECT max(length(avc )  )
															FROM ( SELECT length(q.Content) AS avc
																	FROM question q
                                                                    WHERE TypeID = v_TypeID ) AS duyanh );
		ELSEIF in_cauhoi = 'Multiple-Choice' THEN 
			SELECT *
            FROM question q
            WHERE TypeID = v_TypeID AND length(q.Content) = ( SELECT max(length(avc )  )
															FROM ( SELECT length(q.Content) AS avc
																	FROM question q
                                                                    WHERE TypeID = v_TypeID ) AS duyanh );
		END IF;
    END $$
DELIMITER ;
SELECT Content, MAX(LENGTH(Content)) FROM question;
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS Store_9;
DELIMITER $$
CREATE PROCEDURE Store_9( IN xoa_exam INT )
	BEGIN
		DELETE FROM examquestion
			WHERE ExamID = xoa_exam;
		DELETE FROM Exam
			WHERE ExamID = xoa_exam;
	END$$
DELIMITER ;
CALL Store_9(7);


-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng  nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được  
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS Store_11;
DELIMITER $$
CREATE PROCEDURE Store_11(IN var_DepartmentName VARCHAR(50))
	BEGIN
		DECLARE v_DepartmentID VARCHAR(50) ;
		 SELECT D1.DepartmentID INTO v_DepartmentID 
         FROM department D1 
         WHERE D1.DepartmentName = var_DepartmentName;
		UPDATE `account` A 
        SET A.DepartmentID = '11' 
         WHERE A.DepartmentID = v_DepartmentID;
		 DELETE FROM department d 
         WHERE d.DepartmentName = var_DepartmentName;
	END$$
DELIMITER ;
Call SP_DelDepFromName('Marketing');
SELECT * FROM account ;
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay2
DROP PROCEDURE IF EXISTS Store_12;
DELIMITER $$
CREATE PROCEDURE Store_12()
	BEGIN
		WITH CTE_12Months AS (
		 SELECT 1 AS MONTH
		 UNION SELECT 2 AS MONTH
		 UNION SELECT 3 AS MONTH
		 UNION SELECT 4 AS MONTH
		 UNION SELECT 5 AS MONTH
		 UNION SELECT 6 AS MONTH
		 UNION SELECT 7 AS MONTH
		 UNION SELECT 8 AS MONTH
		 UNION SELECT 9 AS MONTH
		 UNION SELECT 10 AS MONTH
		 UNION SELECT 11 AS MONTH
		 UNION SELECT 12 AS MONTH )
		SELECT M.MONTH, count(month(Q.CreateDate)) AS SL 
		FROM CTE_12Months M
			LEFT JOIN (SELECT * FROM question Q1 WHERE year(Q1.CreateDate) = year(now()) ) Q 
			ON M.MONTH = month(Q.CreateDate) 
			GROUP BY M.MONTH;
	END$$
DELIMITER ;
Call Store_12();
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6  tháng gần đây nhất(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
