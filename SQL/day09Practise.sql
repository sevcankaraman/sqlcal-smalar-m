/*
student_info adında bir table oluşturunuz.
student_id(PRIMARY KEY), student_name(UNIQUE), student_age(NOT NULL) ve student_dob adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
student_age sütunu 0-20 arası dışında değer alamaz.
student_name sütunu küçük harf karakter alamaz.
*/

CREATE TABLE student_info
(
	student_id SMALLINT PRIMARY KEY,--> Primary Key = Not Null + Unique
	student_name VARCHAR(30) UNIQUE,
	student_age SMALLINT NOT NULL,
	student_dob DATE,
	CONSTRAINT student_age_check CHECK(student_age BETWEEN 15 AND 20),
	CONSTRAINT student_name_upper_case CHECK(student_name = UPPER(student_name))
);



--Tüm sütunlara veri girerek 2 record oluşturunuz:

insert into student_info values(101,'ALI CAN',15,'12.09.2007');
insert into student_info values(102,'SEVCAN KARAMAN',20,'29.06.1984');
insert into student_info values(103,'AYSE TAN',17,'2006.Sep.03');
INSERT INTO student_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO student_info VALUES('105', 'TOM HANKS', 20, '12-Sep-2003');
INSERT INTO student_info VALUES('106', 'ANGELINA JULIE', 15, '12-Sep-2013');
INSERT INTO student_info VALUES('107', 'BRAD PITT', 16, '10-Aug-2021');

select * from student_info;

--Spesifik iki sütuna veri giriniz:
insert into student_info(student_id,student_age) values('108',18);
insert into student_info(student_id,student_age,student_name) values('109',17,'JOHN DOE');

--student_id değeri 108 olan satırın student_name değerini 'LEO OCEAN' olarak güncelleyin.

update student_info 
set student_name='LEO OCEAN'
where student_id=108;

--John Doe, student_dob sütununu 11-Dec-1997 değeriyle değiştiriniz.
update student_info
set student_dob = '11-Dec-1997 '
where student_name='JOHN DOE';

--105 id'li dob hücresini 11-Apr-1996 değerine ve name hücresini MARK TWAIN değerine güncelle.

update student_info
set student_name='MARK TWAIN',
    student_dob='11-Apr-1996'
where student_id=105;

--id'si 106'dan küçük tüm student_dob değerlerini 01-Aug-2021'e güncelle.

update student_info
set student_dob='01.Aug.2021'
where student_id<106;

--Tüm student_age değerlerini en yüksek student_age değerine güncelleyin.

update student_info
set student_age=(select max(student_age)as max_age from student_info);

--Tüm student_dob değerlerini en düşük student_dob değerine güncelleyin.

update student_info
set student_dob=(select min (student_dob) as min_dob from student_info);

select * from student_info;

----------------------------------------------------

CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);
INSERT INTO workers VALUES(101, 'Ali Can', 12000);
INSERT INTO workers VALUES(102, 'Veli Han', 2000);
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 8500);

--Veli Han'ın salary değerini en yüksek salary değerinin %20 düşüğüne yükseltin.

update workers
set worker_salary = (select max(worker_salary)*0.8 from workers )
where worker_name ='Veli Han';

--Ali Can'ın salary değerini en düşük salary değerinin %30 fazlasına düşürün.

update workers
set worker_salary = (select min(worker_salary)*1.3 from workers )
where worker_name ='Ali Can';

--Ortalama salary değerinden düşük olan salary değerlerini 1000 artırın.

update workers
set worker_salary = worker_salary+1000
where worker_salary<(select avg (worker_salary) from workers);

--Ortalama salary değerinden düşük salary değerlerine ortalama salary değeri atayın.

update workers
set worker_salary =( select avg (worker_salary) from workers)
where worker_salary<(select avg (worker_salary) from workers);

select * from workers;

---------------------------------------------------------------


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);
INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');


--null name değerlerini "To be inserted later" değerine güncelleyin.

update people
set name='To be insert later'
where name isnull; -- =null kullanmayınız

--null address değerlerini "To be inserted later" değerine güncelleyin.
UPDATE people
SET address='To be inserted later'
WHERE address IS NULL;



--İsimsiz recordları silin.
delete from people
where name='To be inserted later';

--ssn değeri 123456789'dan büyük ve 345678901'den küçük olan recordları sil.

delete from people 
where ssn>123456789 and ssn<345678901;

--adres  değeri NULL olmayan tüm recordları silin.

delete from people
where address is not null;

--address değeri Michigan olmayan recordları siliniz.

delete from people
where address <> 'Michigan';

delete from people
where address != 'Michigan';


-- !=   ==>    (SQL) <> -->esit degildir anlamına gelır

select * from people;

----------------------------------------

CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
salary SMALLINT,
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);
INSERT INTO workers VALUES(101, 'Ali Can', 12000);
INSERT INTO workers VALUES(102, 'Veli Han', 2000);
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 8500);

--En düşük ve en büyük salary değerlerine sahip recordları çağırın.
SELECT * FROM workers
where salary=(select min(salary) from workers), (select max(salary) from workers);


--En düşük salary değerini bulun.
SELECT MIN(salary) as min_salary
		  FROM workers ;

--Record sayısını(adetini) bulun.

select count(salary) as satır_sayısı
from workers
 
--Interview Question: En yüksek ikinci salary değerini çağırın.
--1.yol subquery ıle
select max(salary) as ikinci_en_yuksek_salary
from workers
WHERE salary <(select max(salary) FROM workers);

--2.yol-- önerilen bu yoldur
select * from workers
order by salary desc
offset 1
limit 1

--3.yol

select * from workers
order by salary desc
offset 1 row
fetch next 1 row only -- limit 1 ile aynı sey demek

---------------------------------------

CREATE TABLE employees
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees;

CREATE TABLE companies
(
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

--number_of_employees değeri 15000'den büyük olan name ve company değerlerini çağırın.

select name, company
from employees
where company in (select company from companies where number_of_employees>15000)





























































