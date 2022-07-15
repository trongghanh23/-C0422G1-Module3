drop database if exists quan_ly_sinh_vien;
create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
	class_id int auto_increment primary key,
	class_name varchar(60) not null,
	start_date datetime not null,
	`status` bit

);

insert into class(class_name,start_date,`status`) values
('A1',"2018-12-20",1),
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

insert into student(student_name, address,phone,`status`,class_id) values
("Hung","Ha noi","0912113113",1,1),
("hoa","Hai Phong",null,1,1),
("Manh","HCM",0123123123,0,2);

create table `subject`(
	subject_id int auto_increment primary key,
	subject_name varchar(30) not null,
	credit tinyint not null default 1 check(credit>=1),
	`status` bit default 1
);

insert into `subject`(subject_name, credit,`status`) values
("CF",5,1),
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

insert  into mark( subject_id,student_id,mark,exam_time) values
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);