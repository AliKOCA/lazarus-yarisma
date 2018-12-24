Drop Table Yarismalar
;
Create Table Yarismalar(
OKytNo		 	INTEGER PRIMARY KEY AUTOINCREMENT,
YarismaIsmi		VarChar(150) 	Not Null UNIQUE	
);

Insert Into Yarismalar(YarismaIsmi) Values
	('Koro Erkekler'),
	('Koro Kızlar'),
    ('Solo Erkekler'),
	('Solo Kızlar');

Select * From Yarismalar;

Drop Table Yarismacilar;

Create Table Yarismacilar(
OKytNo		 	INTEGER PRIMARY KEY AUTOINCREMENT,
RbtYarismalar	INTEGER	Not Null,
isim			VarChar(150) 	Not Null UNIQUE,
juri1			NUMERIC	Null,
juri2			NUMERIC	Null,
juri3			NUMERIC	Null,
juri4			NUMERIC	Null,
juri5			NUMERIC	Null,
juri6			NUMERIC	Null,
juri7			NUMERIC	Null,
juri8			NUMERIC	Null,
juri9			NUMERIC	Null,
juri10			NUMERIC	Null,
Ortalama		NUMERIC	Null,
FOREIGN KEY (RbtYarismalar) REFERENCES Yarismalar (OKytNo)
);

Delete From Yarismacilar;

insert into Yarismacilar(RbtYarismalar, isim, 
     juri1, juri2, juri3, juri4, juri5) VALUES
	(1, "Bekir", 100, 100, 99, 99, 99),
	(1, "Ömer", 78, 98, 85, 78, 80),
	(1, "Osman", 88, 98, 85, 78, 80),
	(1, "Ali", 100, 98, 85, 78, 80),
	(1, "Hasan", 100, 98, 85, 78, 80),
	(1, "Hüseyin", 58, 98, 85, 78, 80),
	(2, "Hatice", 38, 98, 85, 78, 80),	
	(2, "Fâtımâ", 98, 98, 85, 78, 80),
	(2, "Âişe", 48, 98, 85, 78, 80),
	(2, "Sevde", 28, 98, 85, 78, 80),
	(3, "A", 68, 98, 85, 78, 80),
	(3, "B", 68, 98, 85, 78, 80),
	(4, "C", 68, 98, 85, 78, 80),
	(5, "D", 68, 98, 85, 78, 80);

Select * From Yarismacilar
Order BY isim;

Select OKytNo, isim, Ortalama From Yarismacilar
Where  RbtYarismalar = 1
Order BY Ortalama Desc;




select isim, Ortalama , (select count(*) from Yarismacilar b  where a.OKytNo >= b.OKytNo) as cnt
from Yarismacilar a
Where  RbtYarismalar = 1
Order BY Ortalama Desc;



