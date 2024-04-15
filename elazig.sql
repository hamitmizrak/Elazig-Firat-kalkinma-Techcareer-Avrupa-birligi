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
use nortwind;
select * from Categories;

-- �stedi�im Sutunu �a��rmak i�in kullan�yorum.
select CategoryID,CategoryName from Categories;

select cat.CategoryID,cat.CategoryName from Categories as cat;



-- Bu sorguda direk database ad� ile �a��r�yorum.
select * from [nortwind].[dbo].[Categories] ;