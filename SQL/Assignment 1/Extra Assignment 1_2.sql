
-- ex1
DROP DATABASE IF EXISTS  Fresher_Training_Management;
CREATE DATABASE  Fresher_Training_Management;
USE Fresher_Training_Management;
CREATE TABLE Trainee (
    TraineeID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(50),
    Birth_Date VARCHAR(50),
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ VARCHAR(20),
    ET_Gmath VARCHAR(20),
    ET_English VARCHAR(50),
    Training_Class VARCHAR(50),
    Evaluation_Notes VARCHAR(50),
    VTI_Account VARCHAR(50) NOT NULL UNIQUE
);


-- ex2
DROP DATABASE IF EXISTS  ex2;
CREATE DATABASE  ex2;

CREATE TABLE bang (
    ID TINYINT  UNSIGNED AUTO_INCREMENT,
    `Name` VARCHAR(20),
    `Code` CHARACTER(5),
    ModifiedDate DATETIME
);

-- ex3
DROP DATABASE IF EXISTS  ex3;
CREATE DATABASE  ex3;

CREATE TABLE bang3 (
    ID TINYINT UNSIGNED PRIMARY KEY   AUTO_INCREMENT ,
    `NAME` VARCHAR(20),
    BirthDate DATE,
    Gender ENUM('0', '1', 'NULL'),
    IsDeletedFlag ENUM('0', '1')
);


