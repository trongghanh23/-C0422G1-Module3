drop database if exists quan_ly_sinh_vien;
create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
	class_id int auto_increment primary key,
	class_name varchar(60) not null,
	start_date datetime not null,
	`status` bit

);

insert into class(class_name,start_date,`status`) 
 values ('A1',"2018-12-20",1),
	("A2","2018-12-22",1),
	("B3",current_date,0);
	
create table student(
	student_id int auto_increment primary key,
	student_name varchar(30) not null,
	address varchar(50),
	phone varchar(20),
	`status` bit,
	class_id int not null,
    foreign key(class_id) references class(class_id)
);

insert into student(student_name, address,phone,`status`,class_id) 
  values("Hung","Ha noi","0912113113",1,1),
	("hoa","Hai Phong",null,1,1),
	("Manh","HCM",0123123123,0,2);
		

create table `subject`(
	subject_id int auto_increment primary key,
	subject_name varchar(30) not null,
	credit tinyint not null default 1 check(credit>=1),
	`status` bit default 1
);

insert into `subject`(subject_name, credit,`status`) 
  values("CF",5,1),
	("C",6,1),
	("HDJ",5,1),
	("RDBMS",10,1);

	
create table mark(
	mark_id int auto_increment primary key,
	subject_id int not null,
	student_id int not null,
	mark float default 0 check(mark between 0 and 100),
	exam_time tinyint default 1,
	unique(subject_id, student_id),
	foreign key(subject_id) references `subject`(subject_id),
	foreign key(student_id) references student(student_id)

);

insert  into mark( subject_id,student_id,mark,exam_time) 
  values(1,1,8,1),
	(1,2,10,2),
	(2,1,12,1);
	
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’

select *
from student 
where student_name like "H%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select*
from class 
where month(start_date)=12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

select*
from `subject` 
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student set class_id=2
where student_name="Hung";

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select 
    student.student_name, `subject`.subject_name, mark.mark
from
    student
         inner join
    mark on student.student_id = mark.student_id
        join
    `subject` on `subject`.subject_id = mark.subject_id
order by mark.mark desc , student.student_name;



