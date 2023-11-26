
-- 1
select * from film f;

---2
select
f.film_id, f.title, c."name"
from film f 
join film_category fc on fc.film_id = f.film_id 
join category c on fc.category_id = c.category_id
where c."name" = 'Action'
order by f.film_id  asc;

--3
select
f.film_id, f.title, concat(a.first_name, ' ' ,a.last_name) as name
from film f 
join film_actor fa on fa.film_id = f.film_id 
join actor a on a.actor_id = fa.actor_id 
where f.title = 'Clash Freddy';

--5
select 
f.film_id, f.title, f.release_year
from film f 
join film_actor fa on fa.film_id = f.film_id 
join actor a on fa.actor_id = a.actor_id 
where concat(a.first_name, ' ', a.last_name) = 'Tom Mckellen';

-- 7
select
a.actor_id, concat(a.first_name, ' ', a.last_name) as actor_name, count(f.film_id) count_film
from film f 
join film_actor fa on fa.film_id = f.film_id 
join actor a on a.actor_id = fa.actor_id
group by a.actor_id;

-- 8
select film_id, title, rating  from film f where f.rating = 'PG-13';

-- 9
select 
f.title, f.release_year 
from film f
where f.release_year > 2010;

-- 10
select 
c.category_id, c."name", count(fc.film_id) as category_count
from category c 
join film_category fc ON c.category_id = fc.category_id
group  by c.category_id ;

-- 11
select 
film_id, title, length
from film
order by length desc
limit 1;

-- 16
select 
rating, count(film_id) as film_count
from film
group by rating;

-- 18
select
film_id, title, release_year 
from film
where title like '%love%';

-- 19
select 
f.film_id, f.title, count(fa.actor_id) as actor_count
from film f 
join film_actor fa on fa.film_id = f.film_id 
group by f.film_id
having count(fa.actor_id) > 3;

-- 21
select
film_id,
title,
rating as rating_code,
case 
	when rating = 'G' then 'Semua umur'
	when rating = 'PG' then 'Anak Bimbingan Orang Tua'
	when rating = 'PG-13' then 'Remaja 13 tahun Bimbingan Orang Tua'
	when rating = 'R' then 'Remaja Bimbingan Orang Tua'
	else 'Dewasa'
end as rating
from film;