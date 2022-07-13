create table student(
id_student int auto_increment primary key,
name_student varchar(55),
country_studen varchar(255)
);
insert into student(name_student,country_studen) values("nguyễn văn a","đà nẵng");
-- thêm giá trị vào các trường
select *from student;
-- hiển thị thông tin trường và giá trị của bảng
alter table student add email varchar(255);

update student set email="trfhdfdsfj"
where id_student =8;
-- cập nhập lại giá trị ở các trường
alter table student drop email ;
-- xoá cột






