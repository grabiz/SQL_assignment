--Tạo cơ sở dữ liệu--
CREATE DATABASE BookMS;

USE BookMS;

--Tạo bảng Danh mục--

CREATE TABLE Categories
(
 CategoryID char(3) not null PRIMARY KEY,
 [Category Name] nvarchar(50),
 Moreinfo nvarchar(255)  
);
--Nhập dữ liệu cho Danh mục--

INSERT INTO Categories 
VALUES (N'CSD',N'Cơ sở dữ liệu',N'Access, Oracle'),
	   (N'ECO',N'Ecommerce',N'Sách về thương mại điện tử'),
       (N'GTT',N'Giải thuật',N'Các bài toán mẫu,các giải thuật, cấu trúc dữ liệu'),
       (N'HTT',N'Hệ thống',N'Windows,Linux, Unix'),
       (N'LTT',N'Ngôn ngữ lập trình',N'Visual Basic, C, C++, Java'),
       (N'PTK',N'Phân tích và thiết kế',N'Phân tích và thiết kế giải thuật, hệ thống thông tin v.v..'),
       (N'VPP',N'Văn phòng',N'Word, Excel'),
       (N'WEB',N'Web',N'Javascript, Vbscript,HTML, Flash');

--Tạo bảng sinh viên--
CREATE TABLE Students
(
 CardID char(8) not null PRIMARY KEY,
 Name nvarchar(30),
 Address nvarchar(50),
 Tel char(10)  
);

--Nhập dữ liệu cho sinh viên--

INSERT INTO Students 
VALUES  (N'STIT0001',N'Vy Văn Việt',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0002',N'Nguyễn Khánh',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0003',N'Nguyễn Minh Quốc',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0004',N'Hồ Phước Thoi',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0005',N'Nguyễn Văn Định',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0006',N'Nguyễn Văn Hải',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0007',N'Nguyễn Thị Thúy Hà',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0008',N'Đỗ Thị Thiên Ngân',N'92-Quang Trung- Đà Nãng',N'0511810583'),
(N'STIT0009',N'Nguyễn Văn A',N'30- Phan Chu Trinh- Đà Nẵng',N'0913576890');
