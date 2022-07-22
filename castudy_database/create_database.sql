DROP  DATABASE if exists castudy;
CREATE DATABASE IF NOT EXISTS  castudy;
USE castudy;

CREATE TABLE vi_tri (
    ma_vi_tri INT   PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
 
);

INSERT INTO vi_tri 
VALUES(1,"Quản Lý"),
(2,"NHân Viên");

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
    
);

INSERT INTO trinh_do
VALUES(1,"Trung Cấp"),
(2,"Cao Đẳng"),
(3,"ĐẠI Học"),
(4,"Sau ĐạI Học");

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

INSERT INTO bo_phan
 VALUES(1,"Sale-Marketing"),
(2,"Hành chính"),
(3,"Phục Vụ"),
(4,"QuẢN Lý");


CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT  PRIMARY KEY ,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY(ma_vi_tri)REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY(ma_trinh_do)REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY(ma_bo_phan)REFERENCES bo_phan(ma_bo_phan)
    
);

INSERT INTO nhan_vien( ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES("Nguyễn Văn An","1970-11-07","456231786","10000000","0901234121","aNnguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
("LÊ VĂN BÌnH","1997-04-09","654231234","7000000","0934212314","Binhlv@gmail.Com","22 Yên Bái, ĐÀ Nẵng",1,2,2),
("Hồ Thị Yến","1995-12-12","999231723","14000000","0412352315","tHiyen@gmail.com","K234/11 Điện Biên Phủ, GiA Lai",1,3,2),
("Võ Công Toản","1980-04-04","123231365","17000000","0374443232","toan0404@gmAil.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
("Nguyễn Bỉnh Phát","1999-12-09","454363232","6000000","0902341231","phatphat@gmaIl.com","43 Yên Bái, ĐÀ Nẵng",2,1,1),
("Khúc Nguyễn An NGhi","2000-11-08","964542311","7000000","0978653213","annghi20@gmail.com","294 Nguyễn TẤt Thành, Đà Nẵng",2,2,3),
("Nguyễn Hữu Hà","1993-01-01","534323231","8000000","0941234553","nHh0101@gmail.com","4 Nguyễn Chí ThAnh, Huế",2,3,2),
("NgUyễn Hà Đông","1989-09-03","234414123","9000000","0642123111","dONGHANGUyEn@gmail.com","111 HùnG Vương, Hà NỘi",2,4,4),
("Tòng HoaNg","1982-09-03","256781231","6000000","0245144444","hoangtong@gmail.COM","213 Hàm Nghi, Đà Nẵng",2,4,4),
("Nguyễn CôNg Đạo","1994-01-08","755434343","8000000","0988767111","nguyencongdao12@gMAIL.COM","6 Hoà Khánh, Đồng Nai",2,3,2);

CREATE TABLE loai_khach (
    ma_loai_Khach INT  PRIMARY KEY,
    Ten_loai_khach VARCHAR(45)
  
);
INSERT INTO loai_Khach
VALUES(	1,"Diamond"),
	(2,"PLAtiNIUM"),
	(3,"Gold"),
	(4,"Silver"),
    (5,"MemBer");



CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
	ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

INSERT INTO khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)

VALUES("Nguyễn Thị Hào","1970-11-07",0,"643431213","0945423362","thiHao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5),
("Phạm Xuân Diệu","1992-08-08",1,"865342123","0954333333","xuAndieu92@gmaiL.com","K77/22 Thái PhiÊn, Quảng Trị",3),
("Trương Đình Nghệ","1990-02-27",1,"488645199","0373213122","NGHenhan2702@gMail.com","K323/12 Ông Ích Khiêm, Vinh",1),
("Dương Văn Quan","1981-07-08",1,"543432111","0490039241","duongqUAN@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
("Hoàng Trần Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhiNhi123@gmail.COM","224 Lý THái Tổ, Gia LAi",4),
("Tôn Nữ Mộc CHâu","2005-12-06",0,"732434215","0988888844","tonnuchau@gmaIl.com","37 YÊN Thế, Đà NẵnG",4),
("Nguyễn Mỹ Kim","1984-04-08",0,"856453123","0912345698","KIMcUong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
("Nguyễn Thị Hào","1999-04-08",0,"965656433","0763212345","haohao99@GMAiL.com","55 Nguyễn Văn Linh, Kon Tum",3),
("Trần Đại Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.cOM","24 Lý Thường Kiệt, QuẢng Ngãi",1),
("Nguyễn Tâm Đắc","1989-07-01",1,"344343432","0987654321","dactam@gmail.com","22 Ngô QuyềN, Đà Nẵng",2);



CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

INSERT INTO loai_dich_vu
VALUES(1,"Villa"),
(2,"House"),
(3,"ROOm");

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

INSERT INTO kieu_thue
VALUES(1,"year"),
(2,"month"),
(3,"DAy"),
(4,"HOUR");

CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT  PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    FOREIGN KEY(ma_loai_dich_vu) REFERENCES  loai_dich_vu(ma_loai_dich_vu),
    FOREIGN KEY(ma_kieu_thue) REFERENCES  kieu_thue(ma_kieu_thue)
);

INSERT INTO dich_vu(ten_dich_vu, dien_ticH, chi_phi_thue,  so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem, ma_kieu_thue,  ma_loai_dich_vu)
	VALUES("Beach Front",25000,10000000,10,"vIp","Có Hồ bơi",500,4,NULL,3,1),	
	("HoUse PriNcess 01",14000,5000000,7,"VIP","Có thêm BẾP NƯỚNG",NULL,3,nulL,2,2),	
	("ROOM TWIN 01",5000,1000000,2,"NORMAL","Có tivi",NULL,NULL,"1XE MÁY, 1 Xe đạp",4,3),
    ("VilLA NO BEACH FRONT",22000,9000000,8,"NORMAL","CÓ HỒ BƠI",300,3,Null,3,1),	
	("HOUSE PRINCESS 02",10000,4000000,5,"noRMAL","CÓ THÊM BẾp nướng",NULL,2,NULL,3,2),	
	("RooM TWIN 02",3000,900000,2,"NORMAL","CÓ TIVI",NULL,NULl,"1 XE MÁY",4,3);	


CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
	
    FOREIGN KEY(ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang), -- on delete set null
    FOREIGN KEY(ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);
INSERT INTO hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
VALUES("2020-12-08","2020-12-08",0,3,1,3),
	("2020-07-14","2020-07-21",200000,7,3,1),
	("2021-03-15","2021-03-17",50000,3,4,2),
	("2021-01-14","2021-01-18",100000,7,5,5),
	("2021-07-14","2021-07-15",0,7,2,6),
	("2021-06-01","2021-06-03",0,7,7,6),
	("2021-09-02","2021-09-05",100000,7,4,4),
	("2021-06-17","2021-06-18",150000,3,4,1),
	("2020-11-19","2020-11-19",0,3,4,3),
	("2021-04-12","2021-04-14",0,10,3,5),
	("2021-04-25","2021-04-25",0,2,2,1),
	("2021-05-25","2021-05-27",0,7,10,1);

CREATE TABLE   dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

INSERT INTO  dich_vu_di_kem
VALUES(1,"karaoke",10000,"giờ","Tiện nghi,hiện tại"),
(2,"THUê XE máy",10000,"chIẾC","Hỏng 1 xe"),
(3,"Thuê xe ĐạP",20000,"chiếc","tốT"),
(4,"Buffet Buổi sánG",15000,"suất","đầy đủ đồ ĂN, TRÁng miệng"),
(5,"Buffet buổi trưa",90000,"suất","đẦY ĐỦ đồ ăn, tráng miệng"),
(6,"BUffet buổI tối",16000,"suất","đầy đủ đồ ăn, tráng MIệNG");

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,  
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY(ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

INSERT INTO hop_dong_chi_tiet 
VALUES(1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.

SELECT 
    *
FROM
    nhan_vien
WHERE
    ((ho_ten LIKE 'H%') OR (ho_ten LIKE 'K%')
        OR (ho_ten LIKE 'T%'))
        AND CHAR_LENGTH(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT 
    *
FROM
    khach_hang
WHERE
    (YEAR(CURDATE()) - YEAR(khach_hang.ngay_sinh) BETWEEN 18 AND 50)
        AND (khach_hang.dia_chi LIKE '% Đà Nẵng'
        OR khach_hang.dia_chi LIKE '% Quảng Trị');
        
 -- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    k.ma_khach_hang,
    k.ho_ten,
    COUNT(h.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang k
        INNER JOIN
    hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
        INNER JOIN
    loai_khach l ON k.ma_loai_khach = l.ma_loai_khach
WHERE
    l.ten_loai_khach = 'Diamond'
GROUP BY h.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
--  Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    dich_vu.ten_dich_vu,
    (IFNULL(dich_vu.chi_phi_thue, 0) + IFNULL((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),
            0)) AS tong_tien
FROM
    loai_khach
        LEFT JOIN
    khach_hang ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY khach_hang.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu 
        LEFT JOIN
    hop_dong  ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
        LEFT JOIN
    loai_dich_vu  ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE
    dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong 
        WHERE
            (DATEDIFF('2021-03-31', hop_dong.ngay_lam_hop_dong) BETWEEN 0 AND 90))
GROUP BY dich_vu.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, 
-- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.so_nguoi_toi_da,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu 
        JOIN
    hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
        JOIN
    loai_dich_vu  ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = '2020'
        AND dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong 
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = '2021')
GROUP BY dich_vu.ma_dich_vu;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.


-- Cách 1:
SELECT 
    ho_ten
FROM
    khach_hang 
GROUP BY khach_hang.ho_ten;

-- Cách 2:
SELECT distinct
    ho_ten
FROM
    khach_hang;
    
    
-- Cách 3:
SELECT 
  ho_ten
FROM
    khach_hang  
UNION
SELECT 
  ho_ten
FROM
    khach_hang ;
    
  --   9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
--     thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.


SELECT 
    MONTH(hop_dong.ngay_lam_hop_dong) AS thang,
    COUNT(MONTH(hop_dong.ngay_lam_hop_dong)) AS so_lan_dat_phong
FROM
    hop_dong 
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = '2021'
GROUP BY MONTH(hop_dong.ngay_lam_hop_dong)
ORDER BY thang;


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT 
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    hop_dong.tien_dat_coc,
    SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong 
        LEFT JOIN
    hop_dong_chi_tiet  ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là
--  “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.


SELECT 
    dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem 
        JOIN
    hop_dong_chi_tiet  ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong  ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        JOIN
    khach_hang  ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        JOIN
    loai_khach  ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    loai_khach.ten_loai_khach = 'Diamond'
        AND (khach_hang.dia_chi LIKE '% Vinh'
        OR khach_hang.dia_chi LIKE '% Quảng Ngãi');
        
        
        
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách ,
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT 
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten AS ho_ten_nhan_vien,
    khach_hang.ho_ten AS ho_ten_khach_hang,
    khach_hang.so_dien_thoai AS sdt_khach_hang,
    dich_vu.ten_dich_vu,
    SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem,
    hop_dong.tien_dat_coc
FROM
    hop_dong_chi_tiet 
        JOIN
    hop_dong  ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        JOIN
    khach_hang  ON hop_dong.ma_khach_hang =khach_hang.ma_khach_hang
        JOIN
    nhan_vien  ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        JOIN
    dich_vu  ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        JOIN
    dich_vu_di_kem  ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE
    (DATEDIFF('2020-12-31', hop_dong.ngay_lam_hop_dong) BETWEEN 0 AND 92)
        AND YEAR(hop_dong.ngay_lam_hop_dong) = '2020'
        AND hop_dong.ma_hop_dong NOT IN (SELECT 
            hop_dong.ma_hop_dong
        FROM
            hop_dong 
        WHERE
            (DATEDIFF('2021-06-30', hop_dong.ngay_lam_hop_dong) BETWEEN 0 AND 181)
                AND YEAR(hop_dong.ngay_lam_hop_dong) = '2021')
                GROUP BY hop_dong_chi_tiet.ma_hop_dong;
                
                
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


SELECT 
    dich_vu_di_kem.ma_dich_vu_di_kem,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu_di_kem 
        JOIN
    hop_dong_chi_tiet  ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
HAVING SUM(hop_dong_chi_tiet.so_luong) >= ALL (SELECT 
        SUM(hop_dong_chi_tiet.so_luong)
    FROM
        hop_dong_chi_tiet 
    GROUP BY hop_dong_chi_tiet.ma_hop_dong_chi_tiet);
    
    
--     14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
--     Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
--     (được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT 
    hop_dong.ma_hop_dong,
    loai_dich_vu.ten_loai_dich_vu,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    COUNT(dich_vu_di_kem.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong 
        JOIN
    dich_vu  ON hop_dong.ma_dich_vu =dich_vu.ma_dich_vu
        JOIN
    loai_dich_vu  ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet  ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        JOIN
    dich_vu_di_kem  ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem
HAVING so_lan_su_dung = 1
ORDER BY hop_dong_chi_tiet.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
--  so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT 
    nhan_vien.ma_nhan_vien,
    nhan_vien.ho_ten,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan,
    nhan_vien.so_dien_thoai,
    nhan_vien.dia_chi
FROM
    nhan_vien 
        JOIN
    hop_dong  ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
        JOIN
    trinh_do  ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan  ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = '2020'
        OR YEAR(hop_dong.ngay_lam_hop_dong) = '2021'
GROUP BY hop_dong.ma_nhan_vien
HAVING COUNT(hop_dong.ma_nhan_vien) <= 3;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

DELETE nv . * FROM nhan_vien nv 
WHERE
    nv.ma_nhan_vien NOT IN (SELECT 
        hd.ma_nhan_vien
    FROM
        hop_dong hd
    WHERE
        year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021
    GROUP BY hd.ma_nhan_vien);
    
--     17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
--     chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            *
        FROM
            (SELECT 
                kh.ma_khach_hang
            FROM
                khach_hang kh
            JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
            JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            JOIN hop_dong_chi_tiet ct ON hd.ma_hop_dong = ct.ma_hop_dong
            JOIN dich_vu_di_kem dk ON ct.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
            WHERE
                lk.ten_loai_khach = 'PLAtiNIUM'
                    AND YEAR(hd.ngay_lam_hop_dong) = '2021'
                    AND (dv.chi_phi_thue + ct.so_luong * dk.gia) > 10000000) AS cap_nhat);
                    
-- 	18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET sql_safe_updates=0;
SET foreign_key_checks=0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        *
    FROM
        (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
        JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        
        WHERE
            YEAR(hd.ngay_lam_hop_dong) < 2021) AS xoa_khach_hang);
		SET foreign_key_checks=1;
		SET sql_safe_updates=1;
				
-- 	19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- SET sql_safe_updates=0;
SET foreign_key_checks=0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem = (SELECT 
            *
        FROM
            (SELECT 
                dk.ma_dich_vu_di_kem
            FROM
                dich_vu_di_kem dk
            JOIN hop_dong_chi_tiet ct ON dk.ma_dich_vu_di_kem = ct.ma_dich_vu_di_kem
            JOIN hop_dong hd ON ct.ma_hop_dong = hd.ma_hop_dong
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = '2020'
                    AND ct.so_luong > 10) AS cap_nhat_gia); 
		SET foreign_key_checks=1;
       --  SET sql_safe_updates=1;
            
            
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id
-- 	(ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.


SELECT 
    nv.ma_nhan_vien as id, 	
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION ALL 
SELECT 
    kh.ma_khach_hang as id,
    kh.ho_ten, 	
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;