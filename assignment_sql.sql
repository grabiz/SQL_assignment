/* ASSIGNMENT 3 */
/* II. Design database and insert data to tables*/
/*1-Create a database with name is LibManagement*/
CREATE DATABASE LibManagement;
USE LibManagement;
/*2-Create tables and insert data on each table*/

/*CREATE TABLES*/
--Categories table : Categories of books--
CREATE TABLE tbCategories
(
  CategoryID CHAR(3) NOT NULL PRIMARY KEY,
  CategoryName nVARCHAR(50) NOT NULL,
  Moreinfo nVARCHAR(255) NULL                       /*Describe about category*/
);

--Books table : Books' information in the library --
CREATE TABLE tbBooks(

BookID CHAR(6) NOT NULL PRIMARY KEY,             /*The code of book*/
Name nVARCHAR(50) NOT NULL,                      /*Name of book*/
Publisher nVARCHAR(50) NULL,                     
Author nVARCHAR(50) NULL,
CategoryID CHAR(3) NOT NULL REFERENCES tbCategories(CategoryID),
Numofpage FLOAT NOT NULL CHECK(Numofpage>0),
Maxdate INT NOT NULL CHECK(Maxdate>0),                            /*Maximum number of day you can borrow a book*/
Num BIGINT NOT NULL CHECK(Num>0),                            /*Number of copy of book in the library*/
Summary nVARCHAR(255) NULL,
Picture VARBINARY     NULL,                      /*Picture of book*/
);
--Students table : Students who borrow books--
CREATE TABLE tbStudents(

CardID CHAR(8) NOT NULL PRIMARY KEY,
Name nVARCHAR(30) NOT NULL,
[Address] nVARCHAR(50) NOT NULL,
Tel CHAR(10) NULL
);
--Receipts table : information about borrow/return books--
CREATE TABLE tbReceipts(

CardID CHAR(8) NOT NULL REFERENCES tbStudents(CardID),
BookID CHAR(6) NOT NULL REFERENCES tbBooks(BookID),
DateBorrow DATETIME NOT NULL,
DateReturn DATETIME NOT NULL,
[Return] BIT NOT NULL,
);

/* INSERT DATA*/
--tbCategories--
INSERT INTO tbCategories VALUES
('CSD',N'Cơ sở dữ liệu',N'Access, Oracle'),
('ECO',N'Ecommerce',N'Sách về thương mại điện tử'),
('GTT',N'Giải thuật',N'Các bài toán mẫu, các giải thuật, cấu trúc dữ liệu'),
('HTT',N'Hệ thống',N'Windows, Linux, Unix'),
('LTT',N'Ngôn ngữ lập trình',N'Visual Basic, C, C++, Java'),
('PTK',N'Phân tích và thiết kế',N'Phân tích và thiết kế giải thuật, hệ thống thông tin v.v..'),
('VPP',N'Văn phòng',N'Word, Excel'),
('WEB',N'Web',N'Javascript, Vbscript,HTML, Flash');
--tbBooks--
INSERT INTO tbBooks VALUES
('CSD001',N'Cơ sở dữ liệu',N'NXB Giáo dục',N'Ðỗ Trung Tấn','CSD',200,3,3,N'Thiết kế CSDL',NULL),
('CSD002',N'SQL Server 7.0',N'NXB Ðồng Nai',N'Elicom','CSD',200,3,2,N'Thiết CSDL và sử dụng SQL Server',NULL),
('CSD003',N'Oracle 8i',N'NXB Giáo dục',N'Trần Tiến Dung','CSD',500,5,3,N'Từng bước sử dụng Oracle',NULL),
('HTT001',N'Windows2000 Professional',N'NXB Giáo dục',N'Anh Thư','HTT',500,3,2,N'Sử dụng Windows 2000',NULL),
('HTT002',N'Windows 2000 Advance Server',N'NXB Giáo dục',N'Anh Thư','HTT',500,5,2,N'Sử dụng Windows 2000 Server',NULL),
('LTT001',N'Lập trình visual Basic 6',N'NXB Giáo dục',N'Nguyễn Tiến','LTT',600,3,3,N'Kỹ thuật lập trình Víual Basic',NULL),
('LTT002',N'Ngôn ngữ lập trình c++',N'NXB Thống kê',N'Tăng Ðình Quí','LTT',500,5,3,N'Hướng dẫn lập trình hướng đối tượng và C++',NULL),
('LTT003',N'Lập trình Windows bằng Visual c++',N'NXB Giáo dục',N'Ðặng Văn Ðức','LTT',300,4,3,N'Hướng dẫn từng bước lập trình trên Windows',NULL),
('VPP001',N'Excel Toàn tập',N'NXB Trẻ',N'Ðoàn Công Hùng','VPP',1000,5,4,N'Trình bày mọi vấn đề về Excel',NULL),
('VPP002',N'Word 2000 Toàn tập',N'NXB Trẻ',N'Ðoàn Công Hùng','VPP',1000,4,3,N'Trình bày mọi vấn đề về Word',NULL),
('VPP003',N'Làm kế toán bằng Excel',N'NXB Thống kê',N'Vu Duy Sanh','VPP',200,5,2,N'Trình bày phuong pháp làm kế toán',NULL),
('WEB001',N'Javascript',N'NXB Trẻ',N'Lê Minh Trí','WEB',200,5,2,N'Từng bước thiết kế Web động',NULL),
('WEB002',N'HTML',N'NXB Giáo Dục',N'Nguyễn Thị Minh Khoa','WEB',100,3,2,N'Từng bước làm quen với WEB',NULL);
--tbStudents--
INSERT INTO tbStudents VALUES
('STIT0001',N'Vy Văn Việt',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0002',N'Nguyễn Khánh',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0003',N'Nguyễn Minh Quốc',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0004',N'Hồ Phước Thoi',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0005',N'Nguyễn Văn Định',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0006',N'Nguyễn Văn Hải',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0007',N'Nguyễn Thị Thuý Hà',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0008',N'Đỗ Thị Thiên Ngân',N'92-Quang Trung- Đà Nãng','0511810583'),
('STIT0009',N'Nguyễn Văn A',N'30- Phan Chu Trinh- Đà Nẵng','0913576890');
--tbReceipts--
INSERT INTO tbReceipts VALUES
('STIT0001','CSD001','30/07/2014','',0);
('STIT0001','LTT001','30/06/2014'	25/07/2014	TRUE
STIT0002	CSD002	15/08/2014	 	FALSE
STIT0002	LTT003	10/08/2014	30/08/2014	TRUE
STIT0003	WEB001	10/07/2014	20/07/2014	TRUE
STIT0004	HTT001	10/08/2014	 	FALSE
STIT0004	HTT002	20/08/2014	25/08/2014	TRUE
STIT0006	WEB001	30/08/2014	 	FALSE
STIT0006	CSD002	10/08/2014	15/08/2014	TRUE
STIT0006	WEB002	15/07/2014	30/07/2014	TRUE
STIT0007	VPP001	30/08/2014	 	FALSE
STIT0007	VPP003	20/08/2014	25/08/2014	TRUE
STIT0008	VPP001	30/08/2014	 	FALSE
STIT0009	CSD001	20/08/2014	23/08/2014	TRUE
DROP TABLE tbReceipts;
SELECT *
FROM tbStudents;






)