drop database if exists product_management ;
create database if not exists product_management ;
use product_management;

create table phieu_nhap(
	so_pn int primary key auto_increment,
	ngay_nhap datetime 
);

create table vat_tu(
	ma_vtu int primary key auto_increment,
	ten_vtu varchar(20)
);

create table chi_tiet_phieu_nhap(
	dg_nhap double not null,
	sl_nhap int not null,
	so_pn int  ,
	ma_vtu int  ,
	primary key(so_pn,ma_vtu),
	foreign key(so_pn) references phieu_nhap(so_pn),
	foreign key(ma_vtu) references vat_tu(ma_vtu)

);

create table phieu_xuat(
	so_px int primary key auto_increment,
	ngay_xuat datetime
);

create table chi_tiet_phieu_xuat(
	dg_xuat double not null,
	sl_xuat int ,
	so_px int,
	ma_vtu int,
	primary key(so_px,ma_vtu),
	foreign key(so_px)references phieu_xuat(so_px),
	foreign key(ma_vtu)references vat_tu(ma_vtu)

);
create table nha_cc(
	ma_ncc varchar(20) primary key,
	ten_ncc varchar(20),
	dia_chi varchar(155)

);

create table don_dh(
	so_dh int primary key auto_increment,
	ngay_dh datetime,
	ma_ncc varchar(20),
	foreign key (ma_ncc) references nha_cc(ma_ncc)

);


create table chi_tiet_don_dat_hang(
	ma_vtu int ,
	so_dh int ,
	primary key(ma_vtu,so_dh),
	foreign key(ma_vtu) references vat_tu(ma_vtu),
	foreign key(so_dh) references don_dh(so_dh)

);

create table so_dien_thoai(
	id_sdt int primary key auto_increment,
	sdt varchar(20) not null,
	ma_ncc varchar(20),
	foreign key(ma_ncc)references nha_cc(ma_ncc)

);
