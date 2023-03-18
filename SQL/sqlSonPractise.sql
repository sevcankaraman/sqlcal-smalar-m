create table mezunlar
(
id int,
isim varchar(40),
adres varchar(100),
diploma_notu int
);

insert into mezunlar values(1, 'Hasan Varol', 'Antalya', 90);
insert into mezunlar values(2, 'Vedat Can', 'Denizli', 75);
insert into mezunlar values(3, 'Arzu Hak', 'Burdur', 65);
insert into mezunlar values(4, 'Didem Soylu', 'Istanbul', 85);
insert into mezunlar values(5, 'Selim Bal', 'Afyon', 95);
insert into mezunlar values(6, 'Eren Haktan', 'Hatay', 100);
insert into mezunlar values(7, 'Hatice Kul , 'Antalya', 90);

select * from mezunlar

--SORU1: mezunlar tablosundaki id ve isim sütununu listele

select id,isim from mezunlar


--SORU2: diploma_notu 75'den büyük olan mezunların tüm bilgilerini listele

select * from mezunlar where diploma_notu>75

--SORU3: adres'i 'Antalya' olan mezunların tüm bilgilerini listele

select * from mezunlar where adres='Antalya'

--SORU4: diploma_notu 90 ve adres'i 'Antalya' olan mezun isim'ini listele

select isim from mezunlar 
where diploma_notu=90  and adres='Antalya'
							
--SORU5: .diploma_notu 65 veya 85 olan mezunların tüm bilgilerini listele
							
select * from mezunlar where diploma_notu=65 or diploma_notu=85
							
--2.yol

select * from mezunlar where diploma_notu in(65,85)
							
--SORU6: .diploma_notu 75 ve 95 arasında olan mezunların tüm bilgilerini listele
							
select * from mezunlar where diploma_notu between 75 and 95							
							
--2. yol							

select * from mezunlar where diploma_notu>=75 and diploma_notu<=95

--SORU7: .id'si 3 ve 6 arasında olmayan mezunların id, isim'ini ve diploma_notu listele

select id,isim,diploma_notu from mezunlar where id not between 3 and 6

--2.yol

select id,isim,diploma_notu from mezunlar where id <3 or id>6
							
--SORU8: diploma_notu 65 olan satırı siliniz

delete from mezunlar where diploma_notu=65
							
--SORU9: adres'i 'Denizli' olan satırı siliniz
							
delete from mezunlar where adres='Denizli'
	
--SORU10: isim'i 'Didem Soylu' veya 'Selim Bal' olan satırları siliniz							
							
delete from mezunlar where isim='DidemSoylu' or isim='Selim Bal'
							
--2.yol

delete from mezunlar where isim in('DidemSoylu', 'Selim Bal')
							
--SORU11: diploma_notu 100 den küçük olan satırları siliniz

delete from mezunlar where diploma_notu<100		
							
--soru 12:tablodakı tum verileri siliniz							
							
delete from mezunlar	
drop table mezunlar							
	-----------------------------------------------------						
CREATE TABLE tedarikciler     
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO tedarikciler VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO tedarikciler VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO tedarikciler VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO tedarikciler VALUES (204, 'Poco', 'Sedat Koc');

select * from tedarikciler;
    



CREATE TABLE urunler   
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO urunler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO urunler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO urunler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO urunler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO urunler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO urunler VALUES(204, 1006,'TV', 'Ahmet Kan');
INSERT INTO urunler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');								
							
	
select * from urunler						
							
-- SORU1: vergi_no'su 202 olan tedarikcinin 
--sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
							
update tedarikciler set sirket_ismi='VivoBook' where vergi_no=202							
							
--  SORU2: tedarikciler tablosundaki tüm sirket_ismi'ni 'NOKIA' olarak güncelleyeniz.							
							
update tedarikciler set sirket_ismi='NOKIA'							
							
-- SORU3: vergi_no'su 201 olan tedarikcinin 
--sirket_ismi'ni 'nokia' , irtibat_ismi'ni 'Canan Can' olarak güncelleyiniz.							
							
update tedarikciler set sirket_ismi='nokia' , irtibat_ismi='Canan Can'							
							
where vergi_no=201							
							
-- SORU4: sirket_ismi nokia olan tedarikcinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.

update tedarikciler set irtibat_ismi='Bilal Han' where sirket_ismi='nokia'

-- SORU5: urunler tablosundaki 'Telefon' değerlerini,
-- 'Phone' olarak güncelleyiniz.
														
update urunler set malzeme_isim='Phone' where malzeme_isim='Telefon'

-- SORU6: urunler tablosundaki malzeme_id değeri 1004'ten büyük olanların,
 --malzeme_id'lerini 1 artırarak güncelleyiniz.

update urunler set malzeme_id=malzeme_id+1 where malzeme_id>1004							
							
-- SORU7: urunler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.													
							
update urunler set malzeme_id=malzeme_id+ted_vergino
							
--8.soruyu cözmeden önce ,tabloları eskı halıne getırelım

-- SORU8: urunler tablosundaki musteri_isim'i 'Ahmet Kan' olan malzeme_isim'ini,
--tedarikciler  tablosunda irtibat_ismi 'Sedat Koc' olan sirket_ismi ile güncelleyiniz.

	select * from urunler						
							
update urunler set malzeme_isim=
(select sirket_ismi from tedarikciler where irtibat_ismi='Sedat Koç' )
where musteri_isim='Ahmet Kan'							
							
 -- SORU9: urunler tablosundaki malzeme_isim'i 'Laptop' olanların musteri_isim'ini,
 -- tedarikciler  tablosunda sirket_ismi 'Poco' nun irtibat_ismi ile güncelleyiniz.							
							
update urunler set musteri_isim=(select irtibat_ismi from tedarikciler where sirket_ismi='Poco'  ) 
where malzeme_isim='Laptop'							
							
							
							
							
							
							
							
							