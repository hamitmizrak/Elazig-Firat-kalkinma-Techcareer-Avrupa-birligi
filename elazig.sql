-- Single Comment 
/* 
Multiple Comment
*/

-- Database Seç
use nortwind;

-- Select 
select * from Categories;

------------------------------------------------------------
------------------------------------------------------------
-- Aritmetic Operators
-- + - * / %
-- as: alias (Takma Ad) kısaltmak için kullanıyoruz.
select 9+3 as toplam;
select 9-3 as kalan;
select 9*3 as çarpma;
select 9/3 bölüm;
select 9%3 as "Bölümünden kalan";

------------------------------------------------------------
------------------------------------------------------------
-- DQL (Data Query Language)
-- select kolonAdi from tabloAdi 

use nortwind;
select * from Categories;

-- İstediğim Sutunu çağırmak için kullanıyorum.
select CategoryID,CategoryName from Categories;

select cat.CategoryID,cat.CategoryName from Categories as cat;

-- Bu sorguda direk database adı ile çağırıyorum.
select * from [nortwind].[dbo].[Categories];

-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olanları listeleyelim?
-- select kolonAdi from tabloAdi 
-- where: şart 
select * from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

------------------------------------------------------------
------------------------------------------------------------
-- Aggreagate
-- Count: Sayma işlemlerinden kullanıyorsunuz.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olanları kaç tane ?
select count(*) as toplamAdedi from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

-- sum: toplama.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olan categoryID'sinin toplamı ?
select sum(cat.categoryID) as toplamı from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

-- min: En küçüğü bulmak için.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olan categoryID'sinin en küçüğü ?
select min(cat.categoryID) as enKüçüğü from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

-- max: En büyüğünü bulmak için.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olan categoryID'sinin en küçüğü ?
select 
max(cat.categoryID) as enBüyüğü 
from [nortwind].[dbo].[Categories] as cat 
where cat.categoryID>=5;

-- AVG: Ortalaması
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarında olan categoryID'sinin ortalaması ?
select * from Categories;
select avg(CategoryID) as avg from Categories where CategoryID>=5;

-- Genel Aggreagate
select * from Categories;
select avg(CategoryID) as avg from Categories where CategoryID>=5;
select count(CategoryID) as count from Categories where CategoryID>=5;
select min(CategoryID) as min from Categories where CategoryID>=5;
select max(CategoryID) as max from Categories where CategoryID>=5;
select sum(CategoryID) as sum from Categories where CategoryID>=5;


------------------------------------------------------------
------------------------------------------------------------
-- DML : Data Manipulation Language
-- C R U D
-- C: Create (Insert)
-- R: Read (Query)
-- U: Update
-- D: Delete

---------------------------------------------------------
-- Insert: Tabloya veri eklemek
select * from Categories;
-- insert into tabloAdi () values ()

insert into Categories (CategoryName,Description) values ('masa','ayaklı masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayaklı masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayaklı masa','0x1C2F00');

-- Categories tablosuna CategoryName 
insert into Categories (CategoryName) values ('Baskil');

---------------------------------------------------------
-- Update
-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10;

select * from Categories;

-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10
UPDATE Categories SET CategoryName='Laptop' where CategoryID=10;
UPDATE [nortwind].[dbo].[Categories] SET CategoryName='Laptop' where CategoryID=10;

-- nortwind databaseste, categoryID en büyük olan veri için categoryName kendi isminizi yazınız ?
UPDATE Categories SET CategoryName='HamitM' where CategoryID=10;

insert into Categories (CategoryName) values ('pc');
select max(CategoryID) from Categories

-- update and subQuery
UPDATE Categories SET CategoryName='HamitM', Description='Malatya' where CategoryID=(select max(CategoryID) from Categories);

---------------------------------------------------------
-- Delete
-- DELETE FROM tabloAdi where CategoryID=10;
select * from Categories;
delete from Categories where CategoryID=11;
delete from Categories where CategoryID=(select max(CategoryID) from Categories);


---------------------------------------------------------
-- Top
-- top: Benim istediğim kadar veriyi bana getir.
select * from Categories;
select top(2) * from Categories;


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--  Order By
-- order by: küçükten veya büyükten küçüğe doğru sıralama yapar.
select * from Categories;
select * from Categories order by CategoryID;
select * from Categories order by CategoryID asc;
select * from Categories order by CategoryID desc;
select * from Categories order by CategoryName asc;

-- Nortwind databasesinden Categories tablosundaki CategoryID en büyük olan 3 veriyi gösterin.
select * from Categories;
select top(3)* from Categories;
select top(3)* from Categories order by CategoryID desc;

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- distinct
-- distinct: Tekrarsız veriler
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsız olacak şekilde sıralayın ? 
select * from Categories;
select distinct CategoryName from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsız veya tekrarsız olan kaç tane veri vardır ?  Keyword: count
select * from Categories;
select count(*) from Categories;
select count(CategoryID) from Categories;
select count(CategoryID) as kacTane from Categories;
select count(CategoryID) as 'kac tane' from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsız olan kaç tane veri vardır ?  Keyword: count, distinct
select * from Categories;
-- doğru syntax
select count(distinct(CategoryName))  as 'kac tane' from Categories;

-- yanlış syntax: Çünkü count için bir tane veri dönderir ancak order by birden fazla veri için kullandım
/*
Msg 8127, Level 16, State 1, Line 161
Column "Categories.CategoryID" is invalid in the ORDER BY clause because it is not contained in either an aggregate function or the GROUP BY clause.
*/
select count(distinct(CategoryName))  as 'kac tane' from Categories order by CategoryID;

-- yanlış syntax
select distinct(count(CategoryName))  as 'kac tane' from Categories;

---------------------------------------------------------
-- Where
-- Where: Conditional(Şart)
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 4'ün üstünde olan verileri listeleyelim ?
select *  from Categories;
select *  from Categories where CategoryID>=4;
select *  from Categories as cat where cat.CategoryID>=4;

-- B-I-L
----------------------
-- Between
-- Between: Datalardaki verilerden aralık bulmak için kullanıyoruz.
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 arasındaki olan verileri listeleyelim ?
use nortwind;
select * from Categories;
-- 4<=X<=6
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;

-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 arasındaki olan kaç tane veri bulunmaktadır?
select count(*) as 'tane' from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;

---------------------------------------------------------
-- In
-- In: içinde yani subQuery yani bir verinin çıktısı başka verinin girdisi için kullanılır.
-- Nortwind databasesinden Categories tablosundaki CategoryID en küçük olan data için Categories tablosundaki CategoryName Computer yazısıyla güncelliyelim ? keyword: min, update, subQuery
select * from Categories;
select * from Categories as cat ;
-- Manuel
update Categories SET CategoryName='computer' where CategoryID=1; 

select min(cat.CategoryID) from Categories as cat;
update Categories SET CategoryName='computer' where CategoryID=(select min(cat.CategoryID) from Categories as cat); 

---------------------------------------------------------
-- Like
-- Like: Benzer demektir. Filtreleme işlemlerinden kullanıyoruz.
-- m% = m harfi ile başlasın sonu neyle biterse bitsin.
-- %m = m harfi ile bitsin başlangıçı ne olursa olsun
select * from Categories;
-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile başlayan dataları listeyelim ?
select * from Categories;
select cat.CategoryName from Categories as cat where cat.CategoryName like 'm%';
select * from Categories as cat where cat.CategoryName like 'm%';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile başlayan kaç tane data var ?
select count(*) from Categories as cat where cat.CategoryName like 'm%';
select count(*) as 'm ile başlayan' from Categories as cat where cat.CategoryName like 'm%';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden son harfi 's' ile başlayan dataları listeyelim ?
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile biten kaç tane data var ?
select count(*) as 's ile biten data sayısı' from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

/*
 Nortwind databasesinden Categories tablosundaki CategoryName'nden 
 11 karakterli olacak 
 1.karakter 'C' 
 2.karakter 'o'
 3.karakter 'n'
 4.karakter 'f'
 son karakteri 's' olan datayı listeleyelim ? 
*/
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Conf______s';

/*
 Nortwind databasesinden Categories tablosundaki CategoryName'nden 
 içinden 'on' geçen datayı listeleyelim ? 
*/
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

select count(*) as tane from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

---------------------------------------------------------

-- is null: Hiç bir data girilmemişse kullandığımız fonksiyondur.
--  Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' olan dataları listeleyelim ?
select * from Categories;
select * from Categories as cat where cat.Picture is null;

-- is not null: Bütün datalar girilmişse kullandığımız fonksiyondur.
--  Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' olmayan dataları listeleyelim ?
select * from Categories;
select * from Categories as cat where cat.Picture is not null;

----------------------------------------------------
-- Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' ilk datanın picture kolondaki null yerine şunu yazalım. '0x1ABC'
-- keyword: is null, update, BIL (ın) subQuery
-- Step-1 
select * from Categories as cat where cat.Picture is null;
select min(cat.CategoryID) from Categories as cat where cat.Picture is null;

select * from Categories;
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('pc-1','lenovo');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('pc-2','msi');

-- Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' ilk datanın picture kolondaki null yerine şunu yazalım. '0x1ABC'
-- keyword: is null, update, BIL (ın) subQuery
update Categories set Picture='0x1ABC' 
where CategoryID=(select min(CategoryID) from [nortwind].[dbo].[Categories] as cat where cat.Picture is null);



--------------------------------------------------------
-- Math
-- PI
select PI()

-- Mutlak: abs
select abs(-23) as 'Mutlak Değer';

-- Rastgele
select rand()*3+1  as 'Rastgele Sayılar';
select ceiling(rand()*3+1 ) as 'Rastgele Sayılar';

-- Karekök: sqrt
select sqrt(16) as 'Karekök';

-- Üslü sayılar: pow
select power(2,6) as 'Üslü sayılar';

select floor(4.9)  as 'Aşağı Yuvarla';
select ceiling(4.1) as 'Yukarı Yuvarla';

-- Trigonometrik
select sin(45) as 'Sinüs';
select cos(1)  as  'Cosinüs';
select tan(1)  as 'Tan';
select cot(1)  as 'Cot';
select asin(1) as 'A-Sinüs';

--------------------------------------------------------
--------------------------------------------------------
-- Cast
-- Cast : Dönüşüm tarih, sayılarda 
-- Tamsayılar: 1,2,3,4,99,1000
-- Virgüllü Sayılar: 14.53
-- String: 'Merhabalar'
-- Boolean: true(1), yanlış(0)

select 10+20 as 'sayısal';
select '10'+20 as 'kelimesel+sayısal';
select '10'+'20' as 'kelimesel+kelimesel';
select CAST('10' as INTEGER) +  CAST('20' as INTEGER)  as 'cast(kelimesel)';

--------------------------------------------------------
--------------------------------------------------------
-- String
select * from Categories;
select upper(cat.CategoryName) as 'Bütün Karakterler Büyük' from Categories as cat
select lower(cat.CategoryName) as 'Bütün Karakterler Küçük' from Categories as cat
select ltrim(cat.CategoryName) as 'Soldan gelen boşlukları al' from Categories as cat
select rtrim(cat.CategoryName) as 'Sağdan gelen boşlukları al' from Categories as cat
select substring(cat.CategoryName,1,3) as 'Sadece belli karakterleri gösteriyor' from Categories as cat
select concat(cat.CategoryName,' ekle') as 'sonuna ekle' from Categories as cat
select reverse(cat.CategoryName) as 'tersine çevir' from Categories as cat
select replace(cat.CategoryName,'a','x') as 'Harf değiştirmesi' from Categories as cat

-- Nortwind databasesiden Categories tablosunda CategoryName'lerin sonuna 'INC' ekleyelim.
-- keyword: update, concat

-- Nortwind databasesiden Categories tablosunda CategoryName'lerin ilk 3 karakteri alıp sonuna INC ekleyelim.


--------------------------------------------------------
--------------------------------------------------------
-- DDL
-- Data Definition Language

-- Create Database : Yeni bir database oluştur.
-- Yeni bir database oluştur.
create database deneme;

-- Drop: Database Silmek
-- Var olan database Silmek
drop database deneme23;

-- Database hemen silmek için kullanıyoruz.
USE master
GO
DROP DATABASE deneme23;
GO

-- Rename: Database adını değiştirmek
EXEC sp_renamedb 'deneme', 'deneme23';

--------------------------------------------------------
--------------------------------------------------------
-- Datatypes
/*
Sıklıkla Kullanılan Data Types;
Tamsayılarda: int
Virgüllü Sayılarda: float
Kelimelerde: nvarchar
Tarih: Date veya DateTime


TINYINT: Çok küçük tamsayı değerlerini saklamak için kullanılır. Örneğin, 0 ile 255 arasındaki değerler TINYINT türünde saklanabilir. Boyut olarak 1 byte alana sahiptir.
0<=TINYINT<=255
SMALLINT: Küçük tamsayı değerlerini saklamak için kullanılır. INT'ten daha küçük tamsayı değerlerini saklayabilir. Boyut olarak 2 byte alana sahiptir.
INT: Tamsayı değerleri saklamak için kullanılır. Örneğin, 1, 2, -100, 0 gibi değerler INT türünde saklanabilir. Boyut olarak 4 byte alana sahiptir.
BIGINT: Büyük tamsayı değerlerini saklamak için kullanılır. INT'ten daha büyük tamsayı değerlerini saklayabilir. Boyut olarak 8 byte alana sahiptir.
TINYINT<SMALLINT<INT<BIGINT


DECIMAL(p, s) veya NUMERIC(p, s): Ondalık sayıları saklamak için kullanılır. p, toplam basamak sayısını (ondalık noktadan önce ve sonra toplam basamak sayısı) belirtirken s, ondalık basamak sayısını belirtir.
FLOAT: Kayan nokta sayılarını saklamak için kullanılır. Büyük veya küçük ondalık sayılar için uygundur.
Örnek: 44.10
REAL: İkili hassaslıkta kayan nokta sayılarını saklamak için kullanılır. FLOAT'tan daha düşük bir hassasiyete sahiptir.
Örnek: 44.101222222


VARCHAR(n) veya NVARCHAR(n): Değişken uzunluklu karakter dizilerini saklamak için kullanılır. 
n, maksimum karakter sayısını belirtir. 
VARCHAR, ASCII karakterlerini (sadece ingilizce harfler) 
NVARCHAR ise Unicode karakterlerini saklar. (Çince, Arapça , Japonca vs)
Dikkat: nvarchar Dynamics bir datatypes'dir.
Örnek  nvarchar(255) Anlamı: En fazla 255 karakter kullanabilirsin. ancak eğer siz 10 karakter kullanırsanız geriye kalan 255-10= 245 kadar bit kadar yer kaplamıyor.

CHAR(n) veya NCHAR(n): Sabit uzunluklu karakter dizilerini saklamak için kullanılır. n, sabit karakter dizisinin uzunluğunu belirtir.
Daha hızlı ve ilkeldir.
Dinamik değildir.

DATE: Tarih değerlerini saklamak için kullanılır. YYYY-MM-DD biçimindedir.

TIME: Saat değerlerini saklamak için kullanılır. HH:MM:SS.SSS biçimindedir.

DATETIME: Tarih ve saat değerlerini saklamak için kullanılır. YYYY-MM-DD HH:MM:SS.SSS biçimindedir.


*/

/*
truncate: Tablonun içeriğini temizlemek için kullanıyoruz.
truncate table tabloAdi
*/

/*
Table Rename:
EXEC sp_rename 'eski_tablo_adi', 'yeni_tablo_adi';
EXEC sp_rename 'cars', 'yeni_cars';
*/

/* 
Script
*/

-- Biraz sonra vereceğim table creati için isimlendirme farklı ise table oluştur
if not exists (select * from sysobjects where name='notes' and xtype='U')
-- Pascal Case
create table StudentData(
studentID INT PRIMARY KEY IDENTITY NOT NULL ,
studentName nvarchar(100),
studentSurname nvarchar(150),
emailAddress nvarchar(100) UNIQUE,
vizeNotes int,
finalNotes int,
created_at DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP, 
);
go
insert into StudentData (studentName,studentSurname,emailAddress,vizeNotes,finalNotes) values ('isim-3','soyisim-3','email3@gmail.com',80,70);
select * from StudentData;

-- Constraint: kısıtlayıcılar
-- PRIMARY KEY
-- FOREIGN KEY
-- UNIQUE
-- DEFAULT

/*
 Nortwind databasesinden studentData tablosundaki her bir data için
 VizeNotes*(40/100)+finalNotes*(60/100) sonuçu sorgusunu yapınız ?
 */
 select * from [nortwind].[dbo].[StudentData];
 -- hayali sutun
 select (stu.vizeNotes*0.4+stu.finalNotes*0.6) as sonuc  from [nortwind].[dbo].[StudentData] as stu;
 select stu.studentID, stu.studentName, stu.studentSurname, (stu.vizeNotes*0.4+stu.finalNotes*0.6) as 'geçer notu'  from [nortwind].[dbo].[StudentData] as stu;

/*
 Nortwind databasesinden studentData tablosundaki en küçük ID'ye sahip olan data için
 VizeNotes*(40/100)+finalNotes*(60/100) sonuçu sorgusunu yapınız ?
 */
 select stu.studentID, stu.studentName, stu.studentSurname, (stu.vizeNotes*0.4+stu.finalNotes*0.6) as 'geçer notu'  from [nortwind].[dbo].[StudentData] as stu where stu.studentID=(select min(stu2.studentID) from StudentData as stu2);

 --------------------------------------------------------
--------------------------------------------------------
-- union 
-- union: Farklı tabloları aynı yerde göstermeye yarar.
-- Şart: aynı kolon sayısına sahip olmalıdır.

-- STUDENT
create table StudentData(
studentID INT PRIMARY KEY IDENTITY NOT NULL ,
studentName nvarchar(100),
studentSurname nvarchar(150),
emailAddress nvarchar(100) UNIQUE,
vizeNotes int,
finalNotes int,
created_at DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP, 
);
go
insert into StudentData (studentName,studentSurname,emailAddress,vizeNotes,finalNotes) values ('isim-3','soyisim-3','email3@gmail.com',80,70);
select * from StudentData;

-- TEACHER
create table TeacherData(
teacherID INT PRIMARY KEY IDENTITY NOT NULL ,
teacherName nvarchar(100),
teacherSurname nvarchar(150),
emailAddress nvarchar(100) UNIQUE,
vizeNotes int,
finalNotes int,
created_at DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP, 
);
go
insert into TeacherData (teacherName,teacherSurname,emailAddress,vizeNotes,finalNotes) values ('isim-1','soyisim-1','email1@gmail.com',80,80);
insert into TeacherData (teacherName,teacherSurname,emailAddress,vizeNotes,finalNotes) values ('isim-2','soyisim-2','email2@gmail.com',70,80);
insert into TeacherData (teacherName,teacherSurname,emailAddress,vizeNotes,finalNotes) values ('isim-3','soyisim-2','email3@gmail.com',90,80);
select * from TeacherData;


-- union
select * from StudentData
select * from TeacherData

select * from StudentData
union 
select * from TeacherData


-- union all
select * from StudentData
union all
select * from TeacherData


--------------------------------------------------------
--------------------------------------------------------
-- JOIN
select * from Categories;
select * from Products;
select * from Products as pro INNER JOIN Categories as cat ON pro.CategoryID=cat.CategoryID
select * from Products as pro LEFT JOIN Categories as cat ON pro.CategoryID=cat.CategoryID
select * from Products as pro RIGHT JOIN Categories as cat ON pro.CategoryID=cat.CategoryID

-- GROUP BY
/*
Bir kolonumuzdaki kaç kere tekrar yaptığını, minumum değerini bulmak ,maksimum değerini bulma (aggregate function) değerler üzerinde işlem yapabilmemizi sağlar.

Group By : Where, Aggregate, columnName
group by: Kolonun gruplama yapabilmemize olanak sağlar.
Where ile group by sıkı sıkı birbirine bağlıdır.

select kolon_adi ,aggregate_function from tablo_adi where şart group by kolon_adi;

*/

-- Nortwind databasesinden employees tablosundaki çalışanların bölümlerine göre maaş ortalaması
select * from [nortwind].[dbo].[Employees] 
select emp.department, avg(emp.salary) as 'Maaş ortalaması' from [nortwind].[dbo].[Employees] as emp  GROUP BY emp.department ;


-- Nortwind databasesinden employees tablosundaki çalışanların bölümlerine göre en düşük maaşlar 
select * from [nortwind].[dbo].[Employees] 
select emp.department, min(emp.salary) as 'Maaş ortalaması' from [nortwind].[dbo].[Employees] as emp  GROUP BY emp.department ;

----------------------------------------------------
-- HAVING
/*
HAVING ifadesi, SQL'de GROUP BY ifadesiyle kullanılarak gruplama yapıldıktan sonra belirli bir koşulu sağlayan grupları seçmek için kullanılır. HAVING ifadesi WHERE ifadesine benzerdir, ancak WHERE ifadesi verileri filtrelemek için kullanılırken, HAVING ifadesi grupları filtrelemek için kullanılır.
*/

-- Nortwind databasesinden employees tablosundaki çalışanların bölümlerine göre maaş ortalaması 30K olanları listeleyelim ?
-- Keyword: group, aggreagate, having
select emp.department, min(emp.salary) as 'Maaş ortalaması' from [nortwind].[dbo].[Employees] as emp  GROUP BY emp.department having avg(emp.salary)>30;


