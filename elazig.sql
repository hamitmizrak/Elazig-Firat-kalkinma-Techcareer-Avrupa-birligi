-- Single Comment
/* 
Multiple Comment
*/

-- Database Se�
use nortwind;

-- Select 
select * from Categories;

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


-- min: En b�y���n� bulmak i�in.
-- Nortwind databasesinden Categories tablosundaki ID>=5 yukar�nda olan categoryID'sinin en k����� ?
select 
max(cat.categoryID) as enB�y��� 
from [nortwind].[dbo].[Categories] as cat 
where cat.categoryID>=5;

-- AVG: Ortalamas�



