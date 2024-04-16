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
-- Insert: Tabloya veri eklemek
select * from Categories;
-- insert into tabloAdi () values ()
insert into Categories (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayaklý masa','0x1C2F00');



