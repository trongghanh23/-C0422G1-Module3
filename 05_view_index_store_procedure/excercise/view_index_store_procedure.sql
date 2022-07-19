-- Bước 1: Tạo cơ sở dữ liệu demo
DROP DATABASE IF EXISTS product_managements;
CREATE DATABASE IF NOT EXISTS product_managements;
USE product_managements;

-- Bước 2: Tạo bảng Products với các trường dữ liệu 

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(20),
    product_name VARCHAR(20),
    product_price DOUBLE,
    product_amount INT,
    product_desciption VARCHAR(50),
    product_status VARCHAR(50)
);

INSERT INTO product ( product_code,product_name,product_price,product_amount,product_desciption,product_status)
VALUES("dell1","dell",1000000,1,"chất lượng","còn hàng"),
("deLL2","dell",11000000,1,"CHẤT Lượng","còn hàng"),
("dell3","dELl",1200000,1,"chẤT LƯỢNG","còn hàng"),
("asuS1","asus",9000000,2,"bìNh thườNG","CÒN HÀng"),
("asus2","aSus",1000000,2,"Bình thưỜng","cÒN HÀNG");

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

SELECT 
    *
FROM
    product;
CREATE  UNIQUE INDEX i_product_code ON product(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

CREATE INDEX  i_composite_product ON product(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

EXPLAIN SELECT * FROM product WHERE product_code="dell1";
EXPLAIN SELECT * FROM product WHERE product_code="dell1" AND product_price=1000000;

SELECT 
    *
FROM
    product
WHERE
    product_code = 'dell1';

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

CREATE VIEW thong_tin__product AS
    SELECT 
        p.product_code,
        p.product_name,
        p.product_price,
        p.product_status
    FROM
        product p;

-- Tiến hành sửa đổi view

UPDATE thong_tin__product 
SET 
    product_status = 'hết hàng'
WHERE
    product_code = 'dell1';

-- Tiến hành xoá view

DROP VIEW thong_tin__product;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER $$
CREATE PROCEDURE select_product()
BEGIN 
SELECT product.* FROM product;
END $$ 
DELIMITER ;
CALL select_product();

-- Tạo store procedure thêm một sản phẩm mới

DELIMITER $$
CREATE PROCEDURE add_product (product_code VARCHAR(20), 
product_name VARCHAR(20),
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(50),
product_status VARCHAR(50))
BEGIN 
INSERT INTO product (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUE (product_code, product_name, product_price, product_amount, product_description, product_status);
END $$
DELIMITER ;
CALL add_product("lenovo2","lenovo",1000000,2,"bình thường","còn hàng");

-- Tạo store procedure sửa thông tin sản phẩm theo id


DELIMITER $$
CREATE PROCEDURE edit_product(id_update_product INT, product_code VARCHAR(20), 
product_name VARCHAR(20),
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(50),
product_status VARCHAR(50))
BEGIN
UPDATE product set product_code = product_code, product_name = product_name, product_price = product_price, 
product_amount = product_amount, product_description = product_description, product_status = product_status
WHERE id = id_update_product;
END $$
DELIMITER ;
CALL edit_product("dell5","dell",14000000,1,"chất lượng","còn hàng");

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER $$
CREATE PROCEDURE delete_product(id_delete int)
BEGIN 
DELETE FROM product
WHERE id = id_delete;
END $$ 
DELIMITER ;
CALL delete_product(4);


