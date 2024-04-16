-- Single Comment 
/* 
Multiple Comment
*/

-- Database Se�
use nortwind;

-- Select 
select * from Categories;

------------------------------------------------------------
------------------------------------------------------------
-- Aritmetic Operators
-- + - * / %
-- as: alias (Takma Ad) k�saltmak i�in kullan�yoruz.
select 9+3 as toplam;
select 9-3 as kalan;
select 9*3 as �arpma;
select 9/3 b�l�m;
select 9%3 as "B�l�m�nden kalan";

------------------------------------------------------------
------------------------------------------------------------
-- DQL (Data Query Language)
-- select kolonAdi from tabloAdi 

use nortwind;
select * from Categories;

-- �stedi�im Sutunu �a��rmak i�in kullan�yorum.
select CategoryID,CategoryName from Categories;

select cat.CategoryID,cat.CategoryName from Categories as cat;

-- Bu sorguda direk database ad� ile �a��r�yorum.
select * from [nortwind].[dbo].[Categories] ;

-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olanlar� listeleyelim?
-- select kolonAdi from tabloAdi 
-- where: �art 
select * from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

-- Aggreagate

-- Count: Sayma i�lemlerinden kullan�yorsunuz.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olanlar� ka� tane ?
select count(*) as toplamAdedi from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- sum: toplama.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olan categoryID'sinin toplam� ?
select sum(cat.categoryID) as toplam� from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- min: En k����� bulmak i�in.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olan categoryID'sinin en k����� ?
select min(cat.categoryID) as enK����� from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- max: En b�y���n� bulmak i�in.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olan categoryID'sinin en k����� ?
select 
max(cat.categoryID) as enB�y��� 
from [nortwind].[dbo].[Categories] as cat 
where cat.categoryID>=5;

-- AVG: Ortalamas�
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olan categoryID'sinin ortalamas� ?
select * from Categories;
select count(CategoryID) as count from Categories where CategoryID>=5;
select min(CategoryID) as min from Categories where CategoryID>=5;
select max(CategoryID) as max from Categories where CategoryID>=5;
select sum(CategoryID) as sum from Categories where CategoryID>=5;
select avg(CategoryID) as avg from Categories where CategoryID>=5;

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
insert into Categories (CategoryName,Description) values ('masa','ayakl� masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayakl� masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayakl� masa','0x1C2F00');

-- Categories tablosuna CategoryName 
insert into Categories (CategoryName) values ('Baskil');

---------------------------------------------------------
-- Update
select * from Categories;

-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10
UPDATE Categories SET CategoryName='Laptop' where CategoryID=10;
UPDATE [nortwind].[dbo].[Categories] SET CategoryName='Laptop' where CategoryID=10;

-- nortwind databaseste, categoryID en b�y�k olan veri i�in categoryName kendi isminizi yaz�n�z ?
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
-- top: Benim istedi�im kadar veriyi bana getir.
select * from Categories;
select top(2) * from Categories;


---------------------------------------------------------
-- Order By
-- order by: k���kten veya b�y�kten k����e do�ru s�ralama yapar.
select * from Categories;
select * from Categories order by CategoryID;
select * from Categories order by CategoryID asc;
select * from Categories order by CategoryID desc;
select * from Categories order by CategoryName asc;

-- Nortwind databasesinden Categories tablosundaki CategoryID en b�y�k olan 3 veriyi g�sterin.
select * from Categories;
select top(3)* from Categories;
select top(3)* from Categories order by CategoryID desc;

---------------------------------------------------------
-- distinct
-- distinct: Tekrars�z veriler
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z olacak �ekilde s�ralay�n ? 
select * from Categories;
select distinct CategoryName from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z veya tekrars�z olan ka� tane veri vard�r ?  Keyword: count
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z olan ka� tane veri vard�r ?  Keyword: count, distinct
