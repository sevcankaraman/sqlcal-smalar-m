/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  DROP: Tabloyu siler.
  ALTER: Tabloyu günceller.
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  DELETE:Tablodaki verileri siler
  UPDATE:Tablodaki verileri günceller

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/

--talebeler ısmınde tablo olusturalım

create table talebeler (
	
	ogrenci_tc char(11),  -- uzunlugu bellı olan strıng verıler ıcın char() data turu kullanılır.
	ogrenci_isim varchar(20), --uzunlugu bellı olmayan strıng veriler için varchar() data turu kullanılır.
	not_ort real,          --ondalıklı sayılar ıcın real data turu kullanılır.
	kayit_tarihi date     --tarih için date data turu kullanılır.
);


--talebler tablosundakı verılerı lısteleyelım

select * from talebeler;(-- * from talebeler tablosundan   butun verileri listele demiş olduk
	
--talebeler tablosuna verı ekleyelım
	
insert into talebeler values ('12345678912','Sevcan',72.5,'2020-02-14'); --into talabeler tablosunun ıcıne  ekleyecegım veririnin degerini girecegiz dedık

insert into talebeler values ('12345678978','Ahmet',92.5,'2020-02-16');
	
insert into talebeler values ('12345678965','Veli',86.4,'2021-05-25') ;

insert into talebeler values ('14785236989','Hüseyin',90.6,'2023-02-27');
	
--şimdi tekrar takebeler tablosundakı verileri listeleyelim
	
select * from talebeler;
	
--talebeler tablosunu silelim
	
drop table talebeler;
	
--ogetmenler isminde tablo olusturalım

create table ogretmenler(

ogretmen_ismi varchar(15),
bransi varchar(20),
mezuniyet_derecesi varchar(20),
tel_nu char(11),
maas int
);

	
--ogretmenler tablosuna veri girişi yapalım

insert into ogretmenler values('Sevcan','Yazılım','Lisans','05352313933',10000);
insert into ogretmenler values('Sevde','Matematik','Lisans','05352313934',20000);
insert into ogretmenler values('Eslem','Türkce','Yüksek Lisans','05352313693',30000);
insert into ogretmenler values('Onur','Maliye','Lisans','05352313900',40000);
	
--ögretmenler tablosundakı verileri listeleyelim
	
select * from ogretmenler;
	
--ogretmenler tablosunu sılelim
	
drop table ogretmenler;
	
	/*=====================================SELECT=======================================================
select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler
	
DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'
Syntax:
-------
select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler
========================================================================================================*/
	
create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);





insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);
	

	
--SORU1 : oğrenciler tablosunun tum sutunlarındakı verılerı listeleyınız
	
select * from ogrenciler;
	
--SORU2 : ogreniler tablosundaki 'isim' sutunundaki verileri listeleyiniz.
	
select isim from ogrenciler;
	
--SORU3 : ogreniler tablosundaki 'adres' sutunundakı verılerı listeleyiniz.
	
select adres from ogrenciler;
	
--SORU4 : ogreniler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz.
	
select sinav_notu from ogrenciler;
	
--SORU5 : ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz.
	
select isim,sinav_notu from ogrenciler;
	
	/*
	
	WHERE ==> sart belirtmek gerektiginde kullanılır
	
	*/
	
--SORU6 : ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
	
select * from  ogrenciler where sinav_notu>80;
	
--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele
	
select * from ogrenciler where adres='Ankara';
	
--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele
	

select isim from ogrenciler where adres='Ankara' and sinav_notu=85;
	

--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele


select * from ogrenciler where sinav_notu=65 or sinav_notu=85;
	
-- 2. YOL 
-- NOT: in komutu birden fazla ıfade ıle tanımlayabılecegımız durumları in komutu ıle yazabılırız 
	
select * from ogrenciler where sinav_notu in(65,85);
	
--SORU10: .ogrenciler tablosundaki sinav_notu 65 veya 85 olmayan ogrencilerin tüm bilgilerini listele
	

select * from ogrenciler where sinav_notu not in(65,85);

-- NOT : not in komutu yazdıgımız verılerın dısındakı verileri listeler.
	
--SORU11: ogrenciler tablosunda sinav_notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele
	
select * from ogrenciler where sinav_notu>=65 and sinav_notu<=85;
	
--2.YOL:
--between komutu 
	
select * from ogrenciler where sinav_notu between 65 and 85;
	
--SORU12:.ogrenciler tablosunda sinav_notu 75 ve 90 arasında olmayan ögrencilerin isim'ini ve sinav_notu listele
	
select isim,sinav_notu from ogrenciler where sinav_notu  not between 75 and 90;	
	
--2.YOL : 
	
select isim,sinav_notu from ogrenciler where sinav_notu<75 or sinav_notu>90;	

	













	
	
	
	















