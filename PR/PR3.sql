use world;
select * from country;
select * from city;
select * from countrylanguage;

-- 1. Tampilkan 10 kota dengan populasi terbesar beserta nama negaranya, urutkan berdasarkan 
-- populasinya dari yang terbesar!
select ci.Name as nama_kota, c.name, ci.population
from city ci join country c on ci.CountryCode = c.Code
order by ci.population desc
limit 10;

-- 2. Tampikan GNP negara Belanda (Netherlands), ibukota, beserta populasi dari ibukotanya!
select c.name as negara, c.GNP, ci.name as ibukota, ci.population 
from city ci join country c on ci.id = c.capital
where c.name = 'Netherlands';

-- 3. Tampilkan 10 negara yang memiliki persentase pemakai bahasa spanyol paling tinggi!
select c.name as negara, cl.Percentage as persentase
from country c join countrylanguage cl on c.code = cl.CountryCode
where cl.language = 'Spanish'
order by persentase desc
limit 10;

-- 4. Tampikan GNP negara Indonesia, ibukota, populasi dari ibukotanya dan bahasa resmi yang dipakai!
select c.GNP, c.Name as Negara, ci.Name as ibuKota, ci.Population as Populasi, cl.language 
from city ci join country c on ci.id = c.capital
join countrylanguage cl on c.code = cl.CountryCode
where c.Name = 'Indonesia' and cl.Isofficial = 'T';

-- SUB QUERY
-- 1. Tampilkan benua dengan jumlah negara lebih dari jumlah negara di benua North America!
select continent, count(Name) as Jumlah_Negara 
from country 
group by continent
having count(Name) > (select count(Name)from country where continent = 'North America');

-- 2. Tampilkan negara di Asia dengan GNP di atas rata-rata GNP negara-negara di benua Eropa, diurutkan dari yang terbesar!
select Name, GNP from country 
where GNP > (select avg(GNP) from country group by continent having continent = 'Europe') and continent = 'Asia'
order by GNP desc;

-- 3. Tampilkan benua berakhiran huruf 'a' dengan jumlah region lebih dari jumlah region benua Asia!
select count(distinct Region) as Jumlah_Region, continent from country
group by continent
having count(distinct Region) > (select count(distinct Region) from country group by continent having continent = 'Asia') and continent like '%a';