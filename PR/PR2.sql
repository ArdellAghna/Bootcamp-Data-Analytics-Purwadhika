use world;
select * from country;
select * from countryLanguage;

-- # Exercise SQL Day 2 # Gunakan database World

-- #1. Ada berapa region di database world? Ubah headernya menjadi 'Jumlah_Region'!
select count(distinct region) as Jumlah_Region from country;

#2. Ada berapa negara di Africa? Ubah headernya menjadi 'Jumlah_Negara'!
select count(name) as Jumlah_Negara from country where Region like '%Africa%';

#3. Tampilkan 5 negara dengan populasi terbesar! Ubah headernya menjadi 'Nama_Negara' dan 'Populasi'!
select Name as Nama_Negara, Population as Populasi from country order by Populasi desc limit 5;

#4. Tampilkan rata-rata harapan hidup tiap benua dan urutkan dari yang terendah! Ubah headernya menjadi 'Nama_Benua' dan 'Rata_Rata_Harapan_Hidup'!
select continent as Nama_Benua, avg(LifeExpectancy) as Rata_Rata_Harapan_Hidup from country group by Nama_Benua order by Rata_Rata_Harapan_Hidup asc;

#5. Tampilkan Jumlah region tiap benua dengan jumlah region lebih dari 3! Ubah headernya menjadi 'Nama_Benua' dan 'Jumlah_Region'!
select continent as Nama_Benua, count(distinct Region) as Jumlah_Region from country group by Nama_Benua having jumlah_Region > 3;

#6. Tampilkan rata-rata GNP di Afrika berdasarkan regionnya dan urutkan dari rata-rata GNP terbesar! Ubah headernya menjadi 'Nama_Region' dan 'Rata_Rata_GNP'!
select Region as Nama_Benua, avg(GNP) as rata_rata_GNP from country where continent = 'Africa' group by Nama_Benua order by rata_rata_GNP desc;

#7. Tampilkan negara di Eropa yang memiliki nama dimulai dari huruf I
select Name as Nama_Negara from country where continent = 'Europe' and Name like 'I%';

#8. Tampilkan Jumlah bahasa tiap negara (countrycode)! Urutkan dari yg paling banyak! Ubah headernya menjadi 'Jumlah_Bahasa'
select CountryCode, count(Language) as Jumlah_Bahasa from countrylanguage group by CountryCode order by Jumlah_Bahasa desc;

#9. Tampilkan nama negara yang panjang hurufnya 6 huruf dan berakhiran 'O'
select Name as Nama_Negara from country where Name like '%o' and length(name) = 6;

#10. Tampilkan 7 bahasa terbesar di Indonesia (secara persentase, dengan persentase yg dibulatkan)! Ubah headernya menjadi 'Bahasa' dan 'Persentase'
select Language as Bahasa, round(sum(percentage)) as Persentase from countryLanguage where countryCode = 'IDN' group by language order by Persentase Desc limit 7;

#11. Tampilkan Continent yang memiliki GovernmentForm kurang dari 10
select Continent, count(GovernmentForm) as goverment from country group by Continent having goverment < 10;

#12. Region mana saja yg Rata-Rata GNP-nya mengalami kenaikan dari Rata-Rata GNP sebelumnya (GNPOld)? 
# Urutkan dari yg tertinggi!
Select Region, avg(GNP) as Rata_Rata_GNP_Saat_Ini, avg(GNPOld) as Rata_Rata_GNP_lama from country group by Region having Rata_Rata_GNP_Saat_Ini > Rata_Rata_GNP_lama  order by Rata_Rata_GNP_Saat_Ini desc;