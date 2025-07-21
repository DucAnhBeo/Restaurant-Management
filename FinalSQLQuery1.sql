create database CAFE_HOUSE;

use CAFE_HOUSE;


create table CafeHouse(
	id_quan varchar(10) primary key,
	ten_quan varchar(30),
	sdt varchar(30),
	dia_chi varchar(30),
	co_so int
);

insert into CafeHouse(id_quan, ten_quan, sdt, dia_chi, co_so) values ('CF01', 'Nha go', '0988831458', 'Ho Van Quan', 1);
insert into CafeHouse(id_quan, ten_quan, sdt, dia_chi, co_so) values ('CF02', 'Nha go', '0988821341', 'CauGiay', 2);

select * from CafeHouse;
create table NhanVien(
	id_nhan_vien varchar(30) primary key,
    id_quan varchar(10),
    ho varchar(30),
    ten nvarchar(30),
    sdt text,
    gioi_tinh varchar(30),
    luong int,
	foreign key (id_quan) references CafeHouse(id_quan)
);

insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV01','CF01','Nguyen','Duc Anh', '0932641235','nam',10000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV02','CF02','Nguyen',' Ba Tuan', '0195306428','nam',5000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV03','CF01','Ho','Anh Dung', '0956682782','nam',1000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV04','CF02','Luu','Trong Hieu', '0503946962','nam',2000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV05','CF01','Le','Hai Dang', '0493661974','nu',6000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV06','CF02','Bui','Kieu Diem', '0835588398','nu',8000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV07','CF01','Tran','Kim Bien', '0842438743','nu',4000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV08','CF02','Ngo','Kim Quynh', '0906735660','nu',5000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV09','CF01','Tran','Thi Phuong', '0372569017','nu',1000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV10','CF02','Trinh','Nhu Hoa', '0929893151','nu',4000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV11','CF01','Tran','Trong Hieu', '0842438741','nu',4000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV12','CF02','Ngo','Hai Dang', '0906735760','nam',5000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV13','CF01','Tran','Thi Phuong Anh', '0372599017','nu',1000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV14','CF02','Trinh','Quang Bach', '0929853151','nam',4000000);
insert into NhanVien(id_nhan_vien,id_quan,ho,ten,sdt,gioi_tinh,luong) values ('NV15','CF02','Ngo','Chi Thanh', '0929853151','nam',4000000);


select * from NhanVien;
create table BoiBan(
	id_nhan_vien varchar(30),
    danh_gia varchar(30),
    foreign key (id_nhan_vien) references NhanVien(id_nhan_vien)
);



insert into BoiBan(id_nhan_vien, danh_gia) values ('NV02', '5 sao');
insert into BoiBan(id_nhan_vien, danh_gia) values ('NV03', '4 sao');
insert into BoiBan(id_nhan_vien, danh_gia) values ('NV04', '4 sao');
insert into BoiBan(id_nhan_vien, danh_gia) values ('NV05', '5 sao');
insert into BoiBan(id_nhan_vien, danh_gia) values ('NV06', '3 sao');

select * from BoiBan;

create table QuanLi(
	id_nhan_vien varchar(30),
    kinh_nghiem varchar(30),
    foreign key (id_nhan_vien) references NhanVien(id_nhan_vien)
);


insert into QuanLi(id_nhan_vien, kinh_nghiem) values ('NV01', '10 nam');
insert into QuanLi(id_nhan_vien, kinh_nghiem) values ('NV11', '8 nam');
insert into QuanLi(id_nhan_vien, kinh_nghiem) values ('NV12', '6 nam');
insert into QuanLi(id_nhan_vien, kinh_nghiem) values ('NV13', '4 nam');
insert into QuanLi(id_nhan_vien, kinh_nghiem) values ('NV14', '2 nam');

select * from QuanLi;

create table PhaChe(
	id_nhan_vien varchar(30),
    bang_cap varchar(30),
    foreign key (id_nhan_vien) references NhanVien(id_nhan_vien)
);


insert into PhaChe(id_nhan_vien, bang_cap) values ('NV07', 'level A');
insert into PhaChe(id_nhan_vien, bang_cap) values ('NV08', 'level B');
insert into PhaChe(id_nhan_vien, bang_cap) values ('NV09', 'level C');
insert into PhaChe(id_nhan_vien, bang_cap) values ('NV10', 'level A');
insert into PhaChe(id_nhan_vien, bang_cap) values ('NV15', 'level B');

select * from PhaChe;
create table CaLam(
	id_nhan_vien varchar(30),
    gio_lam int,
	ngay_lam varchar(20),
    foreign key (id_nhan_vien) references NhanVien(id_nhan_vien)
);

select * from calam;
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV01', 8, '2024-6-12');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV02', 8, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV03', 4, '2024-6-11');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV04', 8, '2024-6-11');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV05', 8, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV06', 4, '2024-6-11');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV07', 8, '2024-6-12');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV08', 4, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV09', 8, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV10', 4, '2024-6-11');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV11', 8, '2024-6-12');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV12', 4, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV13', 8, '2024-6-13');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV14', 4, '2024-6-11');
insert into CaLam(id_nhan_vien, gio_lam, ngay_lam) values ('NV15', 8, '2024-6-13');


create table KhachHang(
	id_khach_hang varchar(30) primary key,
    sdt text,
    ho_va_ten varchar(50)
);


insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH01','0725757239', 'Nguyen Le Thu Ha');
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH02','0957572397', 'Vu Quang Anh' );
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH03','0725574239', 'Ho Nhat Minh');
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH04','0815832393', 'Ba Van Kim' );
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH05','0725183239', 'Truong Thu Phuong');
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH06','0725757339', 'Nguyen Le Thu');
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH07','0957572497', 'Vu Quang Liem' );
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH08','0725574339', 'Ho Nhat Thuc');
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH09','0815832493', 'Ba Van Quat' );
insert into KhachHang(id_khach_hang,sdt,ho_va_ten) values('KH10','0725183339', 'Truong Thu Ha');

select * from KhachHang;

create table DoUong(
	id_do_uong varchar(30) primary key,
    ten_do_uong varchar(30),
    gia int
);


insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU01','cafe den', '30000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU02','cafe nau', '35000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU03','tra quyt', '40000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU04','tra vai', '45000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU05','cacao', '50000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU06','hong tra sua', '55000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU07','o long tra sua', '52000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU08','tra dao', '42000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU09','tra tac', '47000');
insert into DoUong(id_do_uong,ten_do_uong,gia) values ('DU10','cafe bac xiu', '37000');


create table PhucVu(
	id_khach_hang varchar(30),
    id_do_uong varchar(30),
    id_quan varchar(10)
	foreign key (id_khach_hang) references KhachHang(id_khach_hang),
	foreign key (id_do_uong) references DoUong(id_do_uong),
	foreign key (id_quan) references CafeHouse(id_quan)
);



insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH01','DU01','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH02','DU01','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH02','DU02','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH02','DU05','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH03','DU06','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH03','DU07','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH04','DU03','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH04','DU10','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH05','DU08','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH05','DU09','CF01');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH05','DU04','CF02');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH06','DU04','CF02');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH07','DU06','CF02');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH08','DU03','CF02');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH09','DU01','CF02');
insert into PhucVu(id_khach_hang,id_do_uong,id_quan) values ('KH10','DU02','CF02');

SELECT KH.id_khach_hang, COUNT(DU.id_do_uong) AS tong_so
FROM KhachHang KH
JOIN PhucVu PV ON KH.id_khach_hang = PV.id_khach_hang
JOIN DoUong DU ON PV.id_do_uong = DU.id_do_uong
WHERE id_quan = 'CF01'
GROUP BY KH.id_khach_hang;

create table HoaDon(
	id_hoa_don varchar(30) primary key,
	gia_tien text,
	thoi_gian varchar(20),
);

insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD01', '30000', '2024-6-11');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD02', '115000', '2024-6-12');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD03', '107000', '2024-6-13');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD04', '77000', '2024-6-11');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD05', '134000', '2024-6-11');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD06', '45000', '2024-6-21');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD07', '55000', '2024-6-21');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD08', '40000', '2024-6-30');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD09', '30000', '2024-6-11');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD10', '35000', '2024-6-11');
insert into HoaDon(id_hoa_don,gia_tien,thoi_gian) values ('HD20', '45000', '2024-6-12');

select * from HoaDon;

create table ThanhToan(
	id_hoa_don varchar(30),
	id_khach_hang varchar(30),
	id_quan varchar(10),
	foreign key (id_quan) references CafeHouse(id_quan),
	foreign key (id_hoa_don) references HoaDon(id_hoa_don),
	foreign key (id_khach_hang) references KhachHang(id_khach_hang)
);

insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD01', 'KH01', 'CF01');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD02', 'KH02', 'CF01');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD03', 'KH03', 'CF01');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD04', 'KH04', 'CF01');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD05', 'KH05', 'CF01');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD06', 'KH06', 'CF02');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD07', 'KH07', 'CF02');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD08', 'KH08', 'CF02');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD09', 'KH09', 'CF02');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD10', 'KH10', 'CF02');
insert into ThanhToan(id_hoa_don, id_khach_hang, id_quan) values ('HD20', 'KH05', 'CF02');



create table NhaCungCap(
	id_nha_cung_cap varchar(30) primary key,
	ten_nha_cung_cap varchar(30),
	dia_chi varchar(30),
	sdt text
);

insert into NhaCungCap(id_nha_cung_cap,ten_nha_cung_cap,dia_chi,sdt) values ('NCC01', 'Phong Ho Supplier', 'Ha Noi', '0819219785');
insert into NhaCungCap(id_nha_cung_cap,ten_nha_cung_cap,dia_chi,sdt) values ('NCC02', 'Khoa Van Supplier', 'Hai Phong', '0828008645');
insert into NhaCungCap(id_nha_cung_cap,ten_nha_cung_cap,dia_chi,sdt) values ('NCC03', 'Cong La Supplier', 'Nghe An', '0523575928');
insert into NhaCungCap(id_nha_cung_cap,ten_nha_cung_cap,dia_chi,sdt) values ('NCC04', 'Duy Tran Company', 'Ha Tinh', '0304066831');
insert into NhaCungCap(id_nha_cung_cap,ten_nha_cung_cap,dia_chi,sdt) values ('NCC05', 'Duy La Company', 'Ha Noi', '0773436692');



create table NguyenLieu(
	ten_nguyen_lieu varchar(30),
	xuat_xu varchar(30),
	gia int,
	primary key( xuat_xu, ten_nguyen_lieu)
);


insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('hong tra','Lang Son',1500000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('hop vai','Bac Giang',2000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('hop dao','Hai Phong',3000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('bot cafe arabica','Buon Ma Thuat',4000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('bot cafe robusta','Buon Ma Thuat',6000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('bot cacao','Buon Ma Thuat',3000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('tra o long','Thai Nguyen',3000000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('qua chanh','Ha Noi',200000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('nuoc duong','Ha Noi',300000);
insert into NguyenLieu(ten_nguyen_lieu,xuat_xu,gia) values('ong hut','Ha Noi',150000);


CREATE TABLE CungCap (
    id_quan VARCHAR(10),
    id_nha_cung_cap VARCHAR(30),
    ten_nguyen_lieu VARCHAR(30),
    xuat_xu VARCHAR(30),
    PRIMARY KEY (xuat_xu, ten_nguyen_lieu),
    FOREIGN KEY (id_quan) REFERENCES CafeHouse(id_quan),
    FOREIGN KEY (id_nha_cung_cap) REFERENCES NhaCungCap(id_nha_cung_cap),
    FOREIGN KEY (xuat_xu, ten_nguyen_lieu) REFERENCES NguyenLieu(xuat_xu, ten_nguyen_lieu)
);

insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF01','NCC01','hong tra', 'Lang Son');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF01','NCC01','hop vai', 'Bac Giang');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF01','NCC02','hop dao', 'Hai Phong');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF01','NCC03','bot cafe arabica', 'Buon Ma Thuat');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF01','NCC03','bot cafe robusta', 'Buon Ma Thuat');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF02','NCC03','bot cacao', 'Buon Ma Thuat');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF02','NCC04','tra o long', 'Thai Nguyen');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF02','NCC04','qua chanh', 'Ha Noi');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF02','NCC05','nuoc duong', 'Ha Noi');
insert into CungCap(id_quan,id_nha_cung_cap,ten_nguyen_lieu,xuat_xu) values ('CF02','NCC05','ong hut', 'Ha Noi');

EXPLAIN ANALYZE
SELECT C.*, COUNT(N.id_quan) AS SoLuongNhanVien
FROM CafeHouse C 
JOIN NhanVien N ON C.id_quan = N.id_quan
GROUP BY C.id_quan, C.ten_quan, C.sdt, C.dia_chi, C.co_so
HAVING COUNT(N.id_quan) > 7;


WITH avg_luong AS (
    SELECT id_quan, AVG(luong) AS avg_luong
    FROM NhanVien
    GROUP BY id_quan
)

SELECT * FROM NhanVien
SELECT avg(luong) as trungbinh from nhanvien

EXPLAIN ANALYZE
SELECT id_nhan_vien, luong from nhanvien
group by id_nhan_vien, luong
having luong > (SELECT AVG(luong) FROM nhanvien)

--Phân quyền quản lý người dùng
CREATE USER AdminUser FOR LOGIN AdminUser;
CREATE USER QuanLyUser FOR LOGIN QuanLyUser;
CREATE USER NhanVienUser FOR LOGIN NhanVienUser;

--Chủ cửa hàng
GRANT CONTROL ON DATABASE::[CAFE_HOUSE] TO AdminUser;

--Quản lý cửa hàng
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON CaLam TO QuanLyUser;
GRANT SELECT ON HoaDon TO QuanLyUser;
GRANT SELECT ON NguyenLieu TO QuanLyUser;
GRANT SELECT ON DoUong TO QuanLyUser;
GRANT SELECT ON PhucVu TO QuanLyUser;
GRANT SELECT ON CungCap TO QuanLyUser;
GRANT SELECT ON CafeHouse TO QuanLyUser;
GRANT SELECT ON ThanhToan TO QuanLyUser;
GRANT SELECT ON NhaCungCap TO QuanLyUser;
GRANT SELECT ON BoiBan TO QuanLyUser;
GRANT SELECT ON QuanLi TO QuanLyUser;
GRANT SELECT ON PhaChe TO QuanLyUser;

--Nhân viên
GRANT SELECT ON HoaDon TO NhanVienUser;
GRANT SELECT ON DoUong TO NhanVienUser;
GRANT SELECT ON CafeHouse TO NhanVienUser;
GRANT SELECT ON ThanhToan TO NhanVienUser;
GRANT SELECT ON PhucVu TO NhanVienUser;

SELECT * FROM HoaDon
Join ThanhToan on HoaDon.id_hoa_don = ThanhToan.id_hoa_don

CREATE OR REPLACE FUNCTION auto_insert_thanhtoan()
RETURNS TRIGGER AS $$
DECLARE
    latest_kh VARCHAR(30);
BEGIN
    -- Lấy khách hàng gần nhất (có thể dựa vào ID lớn nhất)
    SELECT id_khach_hang INTO latest_kh
    FROM KhachHang
    ORDER BY id_khach_hang DESC
    LIMIT 1;

    -- Thêm dữ liệu vào bảng ThanhToan
    INSERT INTO ThanhToan(id_hoa_don, id_khach_hang, id_quan)
    VALUES (NEW.id_hoa_don, latest_kh, 'CF01');

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_auto_thanhtoan
AFTER INSERT ON HoaDon
FOR EACH ROW
EXECUTE FUNCTION auto_insert_thanhtoan();
