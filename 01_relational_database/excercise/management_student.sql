drop database if exists management_student;
create database IF NOT EXISTS management_student;
use management_student;

create table class(
	class_id int PRIMARY KEY auto_increment,
	`name` varchar(255)
);

insert into class(name) values("C0422G1");
alter table class add adress varchar(255);
update class set adress="đà nẵng"
where class_id=1;
select*from class;
delete from class where name="C0422G1";
alter table class drop address;



create table teacher(
	teacher_id int PRIMARY KEY auto_increment,
	`name` varchar(255),
	age int,
	country varchar(255)
);

insert into teacher(name,age,country) values("nguyễn văn a",30,"Đà Nẵng");
alter table teacher add email varchar(255);
update teacher set email="truongfh@gmail.com"
where teacher_id=1;
select*from teacher;
delete from teacher where teacher_id=2;








