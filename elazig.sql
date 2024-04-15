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
use nortwind;
select * from Categories;

-- Ýstediðim Sutunu çaðýrmak için kullanýyorum.
select CategoryID,CategoryName from Categories;

select cat.CategoryID,cat.CategoryName from Categories as cat;



-- Bu sorguda direk database adý ile çaðýrýyorum.
select * from [nortwind].[dbo].[Categories] ;