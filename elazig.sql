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
select * from [nortwind].[dbo].[Categories];

-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olanlar� listeleyelim?
-- select kolonAdi from tabloAdi 
-- where: �art 
select * from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

------------------------------------------------------------
------------------------------------------------------------
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

insert into Categories (CategoryName,Description) values ('masa','ayakl� masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayakl� masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayakl� masa','0x1C2F00');

-- Categories tablosuna CategoryName 
insert into Categories (CategoryName) values ('Baskil');

---------------------------------------------------------
-- Update
-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10;

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


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--  Order By
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

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- distinct
-- distinct: Tekrars�z veriler
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z olacak �ekilde s�ralay�n ? 
select * from Categories;
select distinct CategoryName from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z veya tekrars�z olan ka� tane veri vard�r ?  Keyword: count
select * from Categories;
select count(*) from Categories;
select count(CategoryID) from Categories;
select count(CategoryID) as kacTane from Categories;
select count(CategoryID) as 'kac tane' from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrars�z olan ka� tane veri vard�r ?  Keyword: count, distinct
select * from Categories;
-- do�ru syntax
select count(distinct(CategoryName))  as 'kac tane' from Categories;

-- yanl�� syntax: ��nk� count i�in bir tane veri d�nderir ancak order by birden fazla veri i�in kulland�m
/*
Msg 8127, Level 16, State 1, Line 161
Column "Categories.CategoryID" is invalid in the ORDER BY clause because it is not contained in either an aggregate function or the GROUP BY clause.
*/
select count(distinct(CategoryName))  as 'kac tane' from Categories order by CategoryID;

-- yanl�� syntax
select distinct(count(CategoryName))  as 'kac tane' from Categories;

---------------------------------------------------------
-- Where
-- Where: Conditional(�art)
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 4'�n �st�nde olan verileri listeleyelim ?
select *  from Categories;
select *  from Categories where CategoryID>=4;
select *  from Categories as cat where cat.CategoryID>=4;

-- B-I-L
-- Between
-- Between: Datalardaki verilerden aral�k bulmak i�in kullan�yoruz.
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 aras�ndaki olan verileri listeleyelim ?
use nortwind;
select * from Categories;
-- 4<=X<=6
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;

-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 aras�ndaki olan ka� tane veri bulunmaktad�r?
select count(*) as 'tane' from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;


-- In
-- In: i�inde yani subQuery yani bir verinin ��kt�s� ba�ka verinin girdisi i�in kullan�l�r.
-- Nortwind databasesinden Categories tablosundaki CategoryID en b�y�k olan data nedir ?


-- Like


