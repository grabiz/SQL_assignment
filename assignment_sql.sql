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
DateBorrow DATE NOT NULL CHECK (DateBorrow < GETDATE()),
DateReturn DATE NULL,
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
('STIT0001','CSD001','2014-07-30',NULL,0),
('STIT0001','LTT001','2014-06-30','2014-07-25',1),
('STIT0002','CSD002','2014-08-15',NULL,0),	 	
('STIT0002','LTT003','2014-08-10','2014-08-30',1),	
('STIT0003','WEB001','2014-07-10','2014-07-20',1),	
('STIT0004','HTT001','2014-08-10',NULL,0),	
('STIT0004','HTT002','2014-08-20','2014-08-25',1),	
('STIT0006','WEB001','2014-08-30',NULL,0),	
('STIT0006','CSD002','2014-08-10','2014-08-15',1),
('STIT0006','WEB002','2014-07-15','2014-07-30',1),
('STIT0007','VPP001','2014-08-30',NULL,0), 
('STIT0007','VPP003','2014-08-20','2014-08-25',1), 
('STIT0008','VPP001','2014-08-30',NULL,0),	
('STIT0009','CSD001','2014-08-20','2014-08-23',1);



/* III- Simple Queries*/

--1.List all information of books which is office Category (CategoryID of office books is “VPP”).--

SELECT *
FROM tbBooks
WHERE CategoryID ='VPP';

--2.List all receipts which are borrowed on August 2014. (CardID, BookID and borrowdate).--

SELECT CardID,BookID,DateBorrow
FROM tbReceipts
WHERE DateBorrow BETWEEN '2014-08-01' AND '2014-08-30';

--3.List all students who have name start by “N” and borrowed book.--

SELECT *
FROM tbStudents JOIN tbReceipts ON tbStudents.CardID=tbReceipts.CardID
WHERE Name LIKE 'N%';
     
--4.List all the students who borrowed book on July 2014 but not return yet.--

SELECT *
FROM tbStudents JOIN tbReceipts ON tbStudents.CardID=tbReceipts.CardID
WHERE (DateBorrow BETWEEN '2014-07-01' AND '2014-07-31') AND [Return]=0;

--5.List all information about book name, category name, publisher, author and number of copy of books in the library.--

SELECT Name,CategoryName,Publisher,Author,Num
FROM tbBooks JOIN tbCategories ON tbBooks.CategoryID=tbCategories.CategoryID;

--6.List all receipts which is not return yet and sort the data ascending by borrow date.(Name of student, name of book, borrow date)--

SELECT DateBorrow,tbBooks.Name,tbStudents.Name 
FROM tbBooks JOIN tbReceipts ON tbBooks.BookID=tbReceipts.BookID
     JOIN tbStudents ON tbStudents.CardID=tbReceipts.CardID
WHERE [Return]=0
ORDER BY DateBorrow; 
               
/*IV-Complex Queries */

--1.List total of books follow category. (CategotyID, Category name and total copy of each category in library).--

SELECT tbBooks.CategoryID,CategoryName,SUM(tbBooks.Num) AS TotalCopyCategory
FROM tbBooks JOIN tbCategories ON tbBooks.CategoryID=tbCategories.CategoryID
GROUP BY tbBooks.CategoryID,CategoryName; 

--2.List how many students borrow book on August 2014.--

SELECT COUNT(*) AS NumofStudents
FROM (SELECT Name FROM tbStudents JOIN tbReceipts ON tbStudents.CardID=tbReceipts.CardID
      WHERE DateBorrow BETWEEN '2014-08-01' AND '2014-08-31'
      GROUP BY Name) AS tbTemp;

--3.List all books which there are number of copy more than number copy of book have BookID is “LTT001”.--

SELECT *
FROM tbBooks
WHERE Num > (SELECT Num FROM tbBooks WHERE BookID ='LTT001');
 
--4.List the bookID and number of copy of this in Library (Number of copy in library = number of copy – number of copy student borrow but not return yet)--


   SELECT BookID ,Num AS NumofCopyInLibrary
   FROM   tbBooks
   WHERE tbBooks.BookID NOT IN
         (
          SELECT BookID
	  FROM   tbReceipts
	  WHERE  [Return]=0
	 )
UNION 
      SELECT tbBooks.BookID AS BookID, (Num-Num1) AS NumofCopyInLibrary
      FROM tbBooks JOIN (SELECT BookID, COUNT(*) AS Num1 
	                  FROM tbReceipts 
			  WHERE [Return]=0 
			  GROUP BY BookID) AS Temp2
	  ON tbBooks.BookID = Temp2.BookID;
	    
--5.List all books which have number of borrow greater than number copy of this book in the library.--

SELECT tbBooks.BookID,Name,Author,Publisher,Numofpage,Num,NumofBorrow
FROM tbBooks LEFT JOIN 
(SELECT BookID, COUNT(*) AS NumofBorrow
FROM tbReceipts
GROUP BY BookID) AS tbBorrowTemp
ON tbBooks.BookID=tbBorrowTemp.BookID
WHERE Num < NumofBorrow;  

/*V-Others Queries */

--1.Write a query to create 2 tables with name Borrows (CardID,BooKID, Dateborrow) and Returns (CardID,BooKID, Datereturn). They are based on Receipts table.--

CREATE TABLE Borrows
(
  CardID CHAR(8) NOT NULL REFERENCES tbStudents(CardID),
  BookID CHAR(6) NOT NULL REFERENCES tbBooks(BookID),
  DateBorrow DATE NOT NULL CHECK (DateBorrow < GETDATE()),
);

CREATE TABLE [Returns]
(
  CardID CHAR(8) NOT NULL REFERENCES tbStudents(CardID),
  BookID CHAR(6) NOT NULL REFERENCES tbBooks(BookID),
  DateReturn DATE NULL,
);
--2.Get all record from Receipts which is not return yet to insert to Borrows table.--

INSERT INTO Borrows
SELECT CardID,BookID,DateBorrow
FROM tbReceipts
WHERE [Return]=0;
GO

/*VI-View */ 
--1.Create a view with a parameter which accept bookid and display number of copy of this book in the library.--
CREATE VIEW vDisplayNumOfCopy
AS
 SELECT BookID ,Num AS NumofCopyInLibrary
   FROM   tbBooks
   WHERE tbBooks.BookID NOT IN
         (
          SELECT BookID
	  FROM   tbReceipts
	  WHERE  [Return]=0
	 )
UNION 
      SELECT tbBooks.BookID AS BookID, (Num-Num1) AS NumofCopyInLibrary
      FROM tbBooks JOIN (SELECT BookID, COUNT(*) AS Num1 
	                  FROM tbReceipts 
			  WHERE [Return]=0 
			  GROUP BY BookID) AS Temp2
	  ON tbBooks.BookID = Temp2.BookID;
GO
--2.Create a view with a parameter to accept a CardID of student and display list of not return book from this student. (Student name, Book name, Return date).--
CREATE VIEW vDisplayListOfNotReturnBook
AS
SELECT tbStudents.CardID,tbBooks.Name AS BooksName,tbStudents.Name AS StudentsName, DateReturn
FROM tbStudents JOIN tbReceipts
     ON tbStudents.CardID=tbReceipts.CardID
	 JOIN tbBooks
	 ON tbReceipts.BookID=tbBooks.BookID
WHERE DateReturn IS NULL;
GO
/*VII-Stored Procedure*/ 
--1.Create a Stored Procedure to list all book are borrow in current date.--
CREATE PROC spListAllBookBorrowedInCurrentDate
AS
  BEGIN   
       SELECT tbBooks.Name
       FROM tbBooks JOIN tbReceipts
            ON tbBooks.BookID=tbReceipts.BookID
       WHERE DateBorrow=GETDATE();
  END;
GO


--2.Create a Stored Procedure to accept bookID by parameter and display all students who borrow this book.--
CREATE PROC spDisplayAllStudenntBorrowedBook
            @bookID CHAR(6)
AS
  BEGIN
     SELECT tbStudents.Name AS StudentName, tbStudents.Address,tbStudents.Tel
	 FROM tbStudents JOIN tbReceipts
	      ON tbStudents.CardID=tbReceipts.CardID
		  JOIN tbBooks
		  ON tbBooks.BookID=tbReceipts.BookID
	WHERE tbBooks.BookID=@bookID
  END;
GO

--3.Create a Stored Procedure to accept input [From date] and [To date] as parameters then displays number of books which are borrowed in this time.--
CREATE PROC spNumOfBookBorrowedInPeriod
            @Fromdate DATE, @Todate DATE
AS
  BEGIN
     SELECT Count(*)
	 FROM tbReceipts
	 WHERE DateBorrow BETWEEN @Fromdate AND @Todate 
  END;

/* VIII-Trigger
1.	Create a trigger to avoid user input same name on category name.
2.	Disconnect the relationship between Students and Receipts and then create a trigger to automatic delete relation records on Receipts if user deletes a student on Students.
*/

 


