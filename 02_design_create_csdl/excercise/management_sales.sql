drop database if exists sales_manager;
create database if not exists sales_manager;
use sales_manager;

create table customer(
	customer_id int auto_increment primary key,
	customer_name varchar(55),
	customer_age date
);

create table `order`(
	order_id int auto_increment primary key,
	customer_id int,
	order_date datetime,
	order_total_price double not null,
	foreign key(customer_id) references customer(customer_id)

);
create table product(
	product_id int auto_increment primary key,
	product_name  varchar(55),
	product_price double not null
);

create table order_detail(
	order_id int,
	product_id int,
	order_detail_aty varchar(255),
	primary key(order_id,product_id),
	foreign key(order_id) references `order`(order_id),
	foreign key(product_id) references product(product_id)

);