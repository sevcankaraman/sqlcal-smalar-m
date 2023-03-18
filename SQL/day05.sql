/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
soyisim sutununun data tipi varchar(30) olsun. 


isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.


*/

create table insanlar(
isim varchar(20),
	soyisim varchar(30),
	
constraint pr_ks primary key (isim),
constraint uni_ks unique (soyisim)
);

insert into insanlar values('Harun','Tan');
insert into insanlar values('Azra','Can' );

insert into insanlar values('Harun','Kan');--prımary key sebebıyle hata verdı
insert into insanlar values(null,'Er'); -- primary key sebebıyle eror verır.
insert into insanlar values('Kudret','Can');-- unique sebebıyle tekrarlı verı gıremeyız

/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
cins sutununun data tipi varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.(Composite Primary Key)

*/

create table hayvanlar(
isim varchar(20),
cins varchar(25),

constraint comp_pr_ks primary key (isim,cins)	

);

insert into hayvanlar values('Fındık','Sus Kopegi');
insert into hayvanlar values('Fındık','Coban Kopegi');
insert into hayvanlar values('Duman','Sus Kopegi');

insert into hayvanlar values('Fındık','Sus Kopegi');--composıte prımary key sebebıyle eror verdı

select * from hayvanlar ;

--NOT: constaraınt'leri sutun isimlerinin altında belırtmenın bize sagladıgı kolaylık;
--1 : constraınt ısmını kendımız belırleyebılıyoruz
--2 : composite primary key yapmamıza ımkan sağlar.(iki sutunun birlesiminden bır prımary key olusturulmasına ımkan saglıyor)

create table emekciler
(
id char(5) PRIMARY KEY,   ---> UNIQUE + NOT NULL
isim varchar(50) UNIQUE,
maas int NOT NULL
);


insert into emekciler values(10002, 'Mehmet Yılmaz', 12000); --uygun
insert into emekciler values(10008, null, 5000); -- uygun
insert into emekciler values(10010, null,5000); -- uygun
insert into emekciler values(10020, null, 5000); -- uygun
insert into emekciler values(10004, 'Veli Han', 5000); -- uygun
insert into emekciler values(10005, 'Mustafa Ali', 5000); -- uygun
insert into emekciler values(10006, 'Canan Yaş', null); -- uygun degıl not null olması gerek
insert into emekciler values(10003, 'CAN', 5000); -- uygun
insert into emekciler values(10007, 'CAN', 5000); -- uygun degıl unıque olmadıgı ıcın
insert into emekciler values(10009, 'Cem', '');  -- not null fakat ınt deger gırılmedıgı ıcın eror verır
insert into emekciler values('', 'osman', 2000); -- uygun
insert into emekciler values('', 'osman can', 2000); -- hiçlik bır kez kullanıldı prımary key e uygun degıl eror verır 
insert into emekciler values('', 'veli can', 6000); -- uygun degıl yukardakı gıbı hata verır 
insert into emekciler values(10002, 'ayse Yılmaz', 12000); -- uygun degıl ıd en usttekı ekleme ıslemınde kullanıldı yanı prımary keyden dolayı hata verır
insert into emekciler values(null, 'filiz', 12000); --  uygun degıl prımary key sebebıyle hata verır






/*----------------------------FOREIGN KEY---------------------------------------------------

	FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
	Böylelikle, tablolar arasında parent child ilişkisi oluşur.
	
	FOREIGN KEY'in bulundugu tablo Child tablodur.
	PRIMARY KEY'in bulundugu tablo ise Parent tablodur.

	FOREIGN KEY KISITLAMASI SAYESİNDE:
	---------------------------------
	
	1-) parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz
	(child tablo null deger kabul eder)

	2-) child tablodaki veri silinmeden parent tablodaki veri silinemez

	3-) child tablo silinmeden parent tablo silinemez
----------------------------------------------------------------------------------------------*/


create table hastaneler
(
hastane_adi varchar(30) PRIMARY KEY,
adres varchar(30),
alan_kodu int
);
insert into hastaneler values('Meddem', 'Isparta', '0246');
insert into hastaneler values('Sifa', 'Ankara', '0236');
insert into hastaneler values('Davraz', 'Istanbul', '0216');
insert into hastaneler values('Deva', 'Antalya', '0242');


create table doktorlar
(
gorev_yeri varchar(30),
doktor_adi varchar(30),
diploma_no int,
brans_adı varchar(30),
	
	
constraint fk foreign key(gorev_yeri) references  hastaneler (hastane_adi)
	
);	

insert into doktorlar values('Meddem', 'Hasan Bal', '123456', 'psikiyatri');
insert into doktorlar values('Sifa', 'Vedat Sen', '123865', 'pediatri');
insert into doktorlar values('Davraz', 'Huseyin Oz', '123568', 'noroloji');
insert into doktorlar values('Deva', 'Ahmet Kar', '123852', 'dahiliye');
insert into doktorlar values('Meddem', 'Hakan Kar', '123369', 'dermatoloji');
insert into doktorlar values('Sifa', 'Ramiz Kara', '123147', 'anestezi');
insert into doktorlar values('Davraz', 'Okan Pul', '123147', 'ortopedi');


select * from doktorlar;


--SORU 1: doktorlar tablosuna gorev_yeri 'Meddem' olan veri girişi yapınız


insert into doktorlar values ('Meddem','Hakkı Oz',158745,'noroloji');

select * from doktorlar;

--SORU 2: .doktorlar tablosuna gorev_yeri 'Okmeydanı' olan veri girişi yapınız.


insert into doktorlar values('Okmeydanı','Hatice Kar',147852,'ortapedi');
-- not: parent tabloda olmayan prımary key ıle child tabloya verı gırısı yapılamaz
-- bu sebeple bu kod error verır.
select * from doktorlar;
--SORU 3: doktorlar tablosuna gorev_yeri null olan veri girişi yapınız

insert into doktorlar values(null,'Sevcan Karaman',158963,'dermatalog');

select * from doktorlar;

--SORU 4: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz. 

--->chıld tablodakı verı sılınmeden parent tablodakı verı sılınemez.

delete from hastaneler where hastane_adi='Meddem';--errror verır
select * from doktorlar;
--SORU 5: doktorlar tablosundaki gorev_yeri 'Meddem' olan verileri siliniz

delete from doktorlar where gorev_yeri='Meddem';
select * from doktorlar;

delete from hastaneler where hastane_adi='Meddem';--bu sefer oldu
select * from doktorlar;

--SORU 7: .hastaneler tablosunu siliniz. 

--->chıld tablo sılınmeden parent tablo sılınemez

drop table hastaneler ; -- bu sebeple bu kod error verır
select * from doktorlar;

--SORU 8: doktorlar tablosunu siliniz 

drop table doktorlar;

drop table hastaneler;





























