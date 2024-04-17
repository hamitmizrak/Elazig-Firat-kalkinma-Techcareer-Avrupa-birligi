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
select * from [nortwind].[dbo].[Categories];

-- Nortwind databasesinden Categories tablosundaki ID>=5 yukarýnda olanlarý listeleyelim?
-- select kolonAdi from tabloAdi 
-- where: þart 
select * from [nortwind].[dbo].[Categories] as cat where cat.categoryID>=5;

------------------------------------------------------------
------------------------------------------------------------
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

insert into Categories (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description) values ('masa','ayaklý masa');
insert INTo [nortwind].[dbo].[Categories] (CategoryName,Description,Picture) values ('masa','ayaklý masa','0x1C2F00');

-- Categories tablosuna CategoryName 
insert into Categories (CategoryName) values ('Baskil');

---------------------------------------------------------
-- Update
-- update tabloAdi set kolonAdi='yazmak' where CategoryID=10;

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


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--  Order By
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

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- distinct
-- distinct: Tekrarsýz veriler
-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz olacak þekilde sýralayýn ? 
select * from Categories;
select distinct CategoryName from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz veya tekrarsýz olan kaç tane veri vardýr ?  Keyword: count
select * from Categories;
select count(*) from Categories;
select count(CategoryID) from Categories;
select count(CategoryID) as kacTane from Categories;
select count(CategoryID) as 'kac tane' from Categories;

-- Nortwind databasesinden Categories tablosundaki CategoryName tekrarsýz olan kaç tane veri vardýr ?  Keyword: count, distinct
select * from Categories;
-- doðru syntax
select count(distinct(CategoryName))  as 'kac tane' from Categories;

-- yanlýþ syntax: Çünkü count için bir tane veri dönderir ancak order by birden fazla veri için kullandým
/*
Msg 8127, Level 16, State 1, Line 161
Column "Categories.CategoryID" is invalid in the ORDER BY clause because it is not contained in either an aggregate function or the GROUP BY clause.
*/
select count(distinct(CategoryName))  as 'kac tane' from Categories order by CategoryID;

-- yanlýþ syntax
select distinct(count(CategoryName))  as 'kac tane' from Categories;

---------------------------------------------------------
-- Where
-- Where: Conditional(Þart)
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 4'ün üstünde olan verileri listeleyelim ?
select *  from Categories;
select *  from Categories where CategoryID>=4;
select *  from Categories as cat where cat.CategoryID>=4;

-- B-I-L
----------------------
-- Between
-- Between: Datalardaki verilerden aralýk bulmak için kullanýyoruz.
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 arasýndaki olan verileri listeleyelim ?
use nortwind;
select * from Categories;
-- 4<=X<=6
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;

-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ve 6 arasýndaki olan kaç tane veri bulunmaktadýr?
select count(*) as 'tane' from [nortwind].[dbo].[Categories] as cat where cat.CategoryID between 4 and 6 ;

---------------------------------------------------------
-- In
-- In: içinde yani subQuery yani bir verinin çýktýsý baþka verinin girdisi için kullanýlýr.
-- Nortwind databasesinden Categories tablosundaki CategoryID en küçük olan data için Categories tablosundaki CategoryName Computer yazýsýyla güncelliyelim ? keyword: min, update, subQuery
select * from Categories;
select * from Categories as cat ;
-- Manuel
update Categories SET CategoryName='computer' where CategoryID=1; 

select min(cat.CategoryID) from Categories as cat;
update Categories SET CategoryName='computer' where CategoryID=(select min(cat.CategoryID) from Categories as cat); 

---------------------------------------------------------
-- Like
-- Like: Benzer demektir. Filtreleme iþlemlerinden kullanýyoruz.
-- m% = m harfi ile baþlasýn sonu neyle biterse bitsin.
-- %m = m harfi ile bitsin baþlangýçý ne olursa olsun
select * from Categories;
-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile baþlayan datalarý listeyelim ?
select * from Categories;
select cat.CategoryName from Categories as cat where cat.CategoryName like 'm%';
select * from Categories as cat where cat.CategoryName like 'm%';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile baþlayan kaç tane data var ?
select count(*) from Categories as cat where cat.CategoryName like 'm%';
select count(*) as 'm ile baþlayan' from Categories as cat where cat.CategoryName like 'm%';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden son harfi 's' ile baþlayan datalarý listeyelim ?
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- Nortwind databasesinden Categories tablosundaki CategoryName'nden ilk harfi 'm' ile biten kaç tane data var ?
select count(*) as 's ile biten data sayýsý' from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

/*
 Nortwind databasesinden Categories tablosundaki CategoryName'nden 
 11 karakterli olacak 
 1.karakter 'C' 
 2.karakter 'o'
 3.karakter 'n'
 4.karakter 'f'
 son karakteri 's' olan datayý listeleyelim ? 
*/
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Conf______s';

/*
 Nortwind databasesinden Categories tablosundaki CategoryName'nden 
 içinden 'on' geçen datayý listeleyelim ? 
*/
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

select count(*) as tane from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%on%';

---------------------------------------------------------

-- is null: Hiç bir data girilmemiþse kullandýðýmýz fonksiyondur.
--  Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' olan datalarý listeleyelim ?
select * from Categories;
select * from Categories as cat where cat.Picture is null;

-- is not null: Bütün datalar girilmiþse kullandýðýmýz fonksiyondur.
--  Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' olmayan datalarý listeleyelim ?
select * from Categories;
select * from Categories as cat where cat.Picture is not null;

----------------------------------------------------
--  Nortwind databasesinden Categories tablosundaki Picture sutunda 'null' ilk datanýn picture kolondaki null yerine þunu yazalým. '0x1ABC'
-- keyword: is null, update, BIL (ýn) subQuery