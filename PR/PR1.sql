use world;
select * from country;
select * from countryLanguage;

-- # 1. Ada berapa negara di database world?
select count(Name) as jumlah_negara from country;

-- # 2. Tampilkan rata-rata harapan hidup di benua Asia!
select avg(LifeExpectancy) as ratarata_harapan_hidup from country where continent = 'Asia';

-- # 3. Tampilkan total populasi di Asia Tenggara!
select sum(Population) as total_populasi from country where Region ='Southeast Asia';

-- # 4. Tampilkan rata-rata GNP di benua Afrika region Eastern Africa. Gunakan alias 'Average_GNP' untuk rata-rata GNP!
select avg(GNP) as Average_GNP from country where Region = 'Eastern Africa';

-- # 5. Tampilkan rata-rata Populasi pada negara yang luas areanya lebih dari 5 juta km2!
select avg(Population) as ratarata_populasi from country where SurfaceArea > 5000000;

-- # 6. Ada berapa bahasa (unique) di dunia?
select count(distinct Language) as jumlah_bahasa from countrylanguage;

-- # 7. Tampilkan GNP dari 5 negara di Asia yang populasinya di atas 100 juta penduduk!
select GNP, Name from country where Continent = 'Asia' and Population > 100000000 limit 5;

-- # 8. Tampilkan negara di Afrika yang memiliki SurfaceArea di atas 1.200.000!
select name from country where continent = 'Africa' and SurfaceArea > 1200000;

-- # 9. Tampilkan negara di Asia yang sistem pemerintahannya adalah republik. Ada berapa jumlah negaranya?
select name as Negara_Republik from country where GovernmentForm like '%Republic%' and continent = 'Asia';
select count(name) as Jumlah_Negara_Republik from country where GovernmentForm like '%Republic%' and continent = 'Asia';

-- # 10. Tampilkan jumlah negara di Eropa yang merdeka sebelum 1940!
select count(name) from country where continent = 'Europe' and IndepYear < 1940;