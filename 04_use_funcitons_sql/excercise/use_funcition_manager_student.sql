DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class(
	class_id INT AUTO_INCREMENT PRIMARY KEY,
	class_name VARCHAR(60) NOT NULL,
	start_date DATETIME NOT NULL,
	`status` BIT

);

INSERT INTO class(class_name,start_date,`status`) 
 VALUES ('A1',"2018-12-20",1),
	("A2","2018-12-22",1),
	("B3",CURRENT_DATE,0);
	
CREATE TABLE student(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	student_name VARCHAR(30) NOT NULL,
	address VARCHAR(50),
	phone VARCHAR(20),
	`status` BIT,
	class_id INT NOT NULL,
    FOREIGN KEY(class_id) REFERENCES class(class_id)
);

INSERT INTO student(student_name, address,phone,`status`,class_id) 
  VALUES("Hung","Ha noi","0912113113",1,1),
	("hoa","Hai Phong",NULL,1,1),
	("Manh","HCM",0123123123,0,2);
		

CREATE TABLE `subject`(
	subject_id INT AUTO_INCREMENT PRIMARY KEY,
	subject_name VARCHAR(30) NOT NULL,
	credit TINYINT NOT NULL DEFAULT 1 CHECK(credit>=1),
	`status` BIT DEFAULT 1
);

INSERT INTO `subject`(subject_name, credit,`status`) 
  VALUES("CF",5,1),
	("C",6,1),
	("HDJ",5,1),
	("RDBMS",10,1),
	("RDBM",10,1);

	
CREATE TABLE mark(
	mark_id INT AUTO_INCREMENT PRIMARY KEY,
	subject_id INT NOT NULL,
	student_id INT NOT NULL,
	mark FLOAT DEFAULT 0 CHECK(mark BETWEEN 0 AND 100),
	exam_time TINYINT DEFAULT 1,
	UNIQUE(subject_id, student_id),
	FOREIGN KEY(subject_id) REFERENCES `subject`(subject_id),
	FOREIGN KEY(student_id) REFERENCES student(student_id)

);

INSERT  INTO mark( subject_id,student_id,mark,exam_time) 
  VALUES(1,1,8,1),
	(1,2,10,2),
	(2,1,12,1);
    
   --  Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    `subject`
HAVING credit >= ALL (SELECT 
        MAX(credit)
    FROM
        `subject`);

  --   Hiển thị các thông tin môn học có điểm thi lớn nhất.
  
SELECT 
    *
FROM
    `subject` s
        JOIN
    mark m ON s.subject_id = m.subject_id
HAVING m.mark >= ALL (SELECT 
        MAX(mark)
    FROM
        mark);
--   
--   Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT 
  s.*,AVG(m.mark) as diem_trung_binh
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY diem_trung_binh DESC

  
    