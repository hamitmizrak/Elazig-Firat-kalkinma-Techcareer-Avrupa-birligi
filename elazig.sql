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
-- as: alias (Takma Ad) kýsaltmak için kullanýyoruz.
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

-- Ýstediðim Sutunu çaðýrmak için kullanýyorum.
select CategoryID,CategoryName from Categories;

select cat.CategoryID,cat.CategoryName from Categories as cat;

-- Bu sorguda direk database adý ile çaðýrýyorum.
select * from [nortwind].[dbo].[Categories] ;

-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olanlarý listeleyelim?
-- select kolonAdi from tabloAdi 
-- where: þart 
select * from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

-- Aggreagate

-- Count: Sayma iþlemlerinden kullanýyorsunuz.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olanlarý kaç tane ?
select count(*) as toplamAdedi from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- sum: toplama.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olan categoryID'sinin toplamý ?
select sum(cat.categoryID) as toplamý from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- min: En küçüðü bulmak için.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olan categoryID'sinin en küçüðü ?
select min(cat.categoryID) as enKüçüðü from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;


-- max: En büyüðünü bulmak için.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olan categoryID'sinin en küçüðü ?
select 
max(cat.categoryID) as enBüyüðü 
from [nortwind].[dbo].[Categories] as cat 
where cat.categoryID>=5;

-- AVG: Ortalamasý
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olan categoryID'sinin ortalamasý ?
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
insert into Categories (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayaklý masa','0x1C2F00');

-- Categories tablosuna CategoryName 
insert into Categories (CategoryName) values ('Baskil');

---------------------------------------------------------
-- Update
select * from Categories;

-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10
UPDATE Categories SET CategoryName='Laptop' where CategoryID=10;
UPDATE [nortwind].[dbo].[Categories] SET CategoryName='Laptop' where CategoryID=10;

-- nortwind databaseste, categoryID en büyük olan veri için categoryName kendi isminizi yazýnýz ?
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
-- top: Benim istediðim kadar veriyi bana getir.
select * from Categories;
select top(2) * from Categories;


---------------------------------------------------------
-- Order By
-- order by: küçükten veya büyükten küçüðe doðru sýralama yapar.
select * from Categories;
select * from Categories order by CategoryID;
select * from Categories order by CategoryID asc;
select * from Categories order by CategoryID desc;
select * from Categories order by CategoryName asc;

-- Nortwind databasesinden Categories tablosundaki CategoryID en büyük olan 3 veriyi gösterin.
select * from Categories;
select top(3)* from Categories;
select top(3)* from Categories order by CategoryID desc;

---------------------------------------------------------
-- distinct
-- distinct: Tekrarsýz veriler
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz olacak þekilde sýralayýn ? 
select * from Categories;
select distinct CategoryName from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz veya tekrarsýz olan kaç tane veri vardýr ?  Keyword: count
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz olan kaç tane veri vardýr ?  Keyword: count, distinct
