-- Single Comment
/* 
Multiple Comment
*/

-- Database Seç
use nortwind;

-- Select 
select * from Categories;

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


-- min: En büyüðünü bulmak için.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olan categoryID'sinin en küçüðü ?
select 
max(cat.categoryID) as enBüyüðü 
from [nortwind].[dbo].[Categories] as cat 
where cat.categoryID>=5;

-- AVG: Ortalamasý



