DROP DATABASE IF EXISTS sales_manager;
CREATE DATABASE IF NOT EXISTS sales_manager;
USE sales_manager;

CREATE TABLE customer(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(25),
	customer_age TINYINT 
);

INSERT INTO customer(customer_name,customer_age) 
  VALUES('Minh Quan',10),
	('Ngoc Oanh',20),
	('Hong Ha',50);

CREATE TABLE `order`(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_date DATETIME,
	order_total_price INT ,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO `order`(customer_id,order_date,order_total_price)
  VALUES(1,"2006-03-21",NULL),
	(2,"2006-03-23",NULL),
	(1,"2006-03-16",NULL);
	

CREATE TABLE product(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name  VARCHAR(25),
	product_price INT 
);

INSERT INTO product(product_name,product_price)
  VALUES("May Giat",3),
	("Tu Lanh",5),
	("Dieu Hoa",7),
	("Quat",1),
	("Bep Dien",2);
	

CREATE TABLE order_detail(
	order_id INT,
	product_id INT,
	order_detail_aty VARCHAR(255),
	PRIMARY KEY(order_id,product_id),
	FOREIGN KEY(order_id) REFERENCES `order`(order_id),
	FOREIGN KEY(product_id) REFERENCES product(product_id)

);
INSERT INTO order_detail(order_id,product_id,order_detail_aty)
  VALUES(1,1,3),
	(1,3,7),
	(1,4,2),
	(2,1,1),
	(3,1,8),
	(2,5,4),
		(2,3,3);	
	
    
  --   Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
  
	SELECT 
    order_id, order_date, order_total_price
FROM
    `order`;
  
  -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
  
	SELECT 
    customer.customer_name, product.product_name
FROM
    customer
        INNER JOIN
    `order` ON customer.customer_id = `order`.customer_id
        INNER JOIN
    order_detail ON `order`.order_id = order_detail.order_id
        INNER JOIN
    product ON order_detail.product_id = product.product_id;
	 
	--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
	  
	SELECT 
    customer.customer_name
FROM
    customer
        LEFT JOIN
    `order` ON customer.customer_id = `order`.customer_id
WHERE
    `order`.order_date IS NULL;
	  
	--   Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
	--   Giá bán của từng loại được tính = odQTY*pPrice)

		SELECT 
    `order`.order_id,
    `order`.order_date,
    SUM(product_price * order_detail_aty) AS invoice_price
FROM
    product
        INNER JOIN
    order_detail ON order_detail.product_id = product.product_id
        INNER JOIN
    `order` ON `order`.order_id = order_detail.order_id
GROUP BY order_id






