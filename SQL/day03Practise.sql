--students isimli bir table oluşturunuz

CREATE TABLE students
(
	id SMALLINT,
	isim VARCHAR(50),
	adres VARCHAR(80),
	sinav_notu SMALLINT
);

--INSERT: Veritabanına yeni veri ekler

INSERT INTO students VALUES(120, 'Ali Can', 'Ankara', '65');
INSERT INTO students VALUES('121', 'Veli Han', 'Trabzon', '75');
--Integer sütunlara tek tırnak içine yada yalın değer girilebilir.
INSERT INTO students VALUES('122', 'Ayşe Tan', 'Bursa', '85');
INSERT INTO students VALUES(123, 'Mary Star', 'Istanbul', 95);
INSERT INTO students VALUES(124, 'Terry Star', 'Ankara', 95);
INSERT INTO students VALUES(125, 'Herry Otar', 'Hatay', 95);
INSERT INTO students VALUES(126, 'Sally Young', 'Isparta', 100);

SELECT * FROM students;
--Soru 1: students tablosundaki id ve isim sütunlarını çağırınız.

SELECT id, isim FROM students;

--Soru 2: Notu 85 üzeri olan öğrenci bilgilerinin tamamını çağırınız.

SELECT * FROM students 
WHERE sinav_notu > 85;

--Soru 3: Adresi Ankara olan öğrencilerin isimlerini çağırınız

SELECT isim FROM students 
WHERE adres = 'Ankara';

--Soru 4: Notu 85 üzeri ve adresi Ankara olan öğrenci isimlerini çağırınız.

SELECT isim FROM students
WHERE sinav_notu > 85 AND adres = 'Ankara';

--Soru 5: sinav_notu 95 veya 65 olan üğrencilerin tüm bilgilerini çağırınız.

--1. Yol:
SELECT * FROM students
WHERE sinav_notu = 95 OR sinav_notu = 65;

--2. Yol:
SELECT * FROM students
WHERE sinav_notu IN(65, 95);

--Soru 6: sinav_notu 75 ve 95 arasında olan öğrencilerin isimlerini çağırınız.

--1. Yol:
SELECT isim FROM students
WHERE sinav_notu >=75 AND sinav_notu <=95;

--2. Yol:
SELECT isim FROM students
WHERE sinav_notu BETWEEN 75 AND 95;--75 ve 95 dahil

--Soru 7: id'si 122 ve 125 arasında olmayan öğrencilerin adreslerini yazdırınız.

--1. Yol:
SELECT adres FROM students
WHERE id<122 OR id>125;

--2. Yol: NOT BETWEEN
SELECT adres FROM students
WHERE id NOT BETWEEN 122 AND 125;--Çağırılacaklara sınırlar dahil değil.

--3. Yol: NOT IN
SELECT adres FROM students
WHERE id NOT IN(122,123,124,125);

--Soru 8: adres'i 'Hatay' olan satırı siliniz
DELETE FROM students
WHERE adres = 'Hatay';

--Soru 9: isim'i 'Ali Can' ve 'Veli Han' olan satırları(record/row) siliniz.

--1. Yol:
DELETE FROM students
WHERE isim = 'Ali Can' OR isim ='Veli Han';

--2. Yol: IN
DELETE FROM students
WHERE isim IN('Ali Can', 'Veli Han');

--Tüm satırları sil
DELETE FROM students;

TRUNCATE students;--Veriler geri gelmeyecek şekilde silinir. Where ile kullanılamaz

--students table'ını siliniz

DROP TABLE students;

SELECT * FROM students;






























