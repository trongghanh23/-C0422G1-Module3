drop database if exists quan_ly_diem_thi;
create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh(
	mahs varchar(20) primary key,
	tenhs varchar(50) ,
	ngaysinh datetime,
	lop varchar(20),
	gt varchar(20)
);
create table mon_hoc(
mamh varchar(20) primary key,
tenmh varchar(50)
);


create table bang_diem(
mahs varchar(20) ,
mamh varchar(20),
diemthi int ,
ngaykt datetime,
primary key(mahs,mamh),
foreign key (mahs) references hoc_sinh(mahs),
foreign key (mamh) references mon_hoc(mamh)

);

create table giao_vien(
magv varchar(20) primary key,
tengv varchar(20),
sdt varchar(10)
);
alter table mon_hoc add magv varchar(20);
alter table mon_hoc add constraint fk_magv foreign key(magv) references giao_vien(magv);
