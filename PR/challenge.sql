use sakila;
select * from payment;
select * from film;

select customer_id, rental_id, amount, payment_date from payment limit 10;

select title, release_year, rental_duration from film where title like 's%' limit 10;

select rental_duration as Durasi_Rental, count(title) as Banyak_Film, round(avg(length), 2) as Rata_Rata_Durasi_Film from film group by Durasi_Rental order by Durasi_Rental asc;

select title, length, rating from film  where length > (select avg(length) from film) order by length desc limit 25;

select rating as Rating, max(replacement_cost) as Replacement_Cost, min(rental_rate) as Rental_Rate, avg(length) as Rata_Rata_Durasi from film group by Rating order by Rating asc;

select distinct(f.title) as judul, f.length as durasi, l.name as Bahasa from film f join language l on f.language_id = l.language_id where f.title like '%k' order by judul asc limit 15;

select f.title as Judul_Film, a.first_name as first_name, a.last_name from film f join film_actor fa on f.film_id = fa.film_id join actor a on a.actor_id = fa.actor_id where a.actor_id = '14';


SELECT 
    c.city AS Nama_Kota,
    co.country AS Nama_Negara
FROM city AS c
JOIN country AS co ON c.country_id = co.country_id;