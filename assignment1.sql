# Get all customers whose first name starts with 'J' and who are active.
Select first_name from sakila.customer
where first_name  like "J%"
and active = 1 ;

# Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
Select title, description from sakila.film
where title like "%Action%" or description like "%war%";

# List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select first_name, last_name from sakila.customer
where first_name like "%a" and last_name not like "%SMITH%";

#Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
select title from sakila.film
where rental_rate > 3 and 
replacement_cost is NOT NULL;

# Count how many customers exist in each store who have active status = 1.
select count(store_id) from sakila.customer
where active = 1
group by store_id;

# Show distinct film ratings available in the film table.
select distinct rating from sakila.film;

# Find the number of films for each rental duration where the average length is more than 100 minutes.
select rental_duration, count(*) as no_of_films from sakila.film
group by rental_duration
having avg(length) >=100;

# List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
select DATE(payment_date), sum(amount) as paid from sakila.payment
group by date(payment_date)
having count(*) >100;

# Find customers whose email address is null or ends with '.org'.
select * from sakila.customer
where email is null or email like "%.org";

# List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
select * from sakila.film
where rating = 'PG' or rating = 'G'
order by rental_rate desc;

#  Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
select length, count(*) as no_of_films from sakila.film
where title like "T%"
group by length
having count(*) > 5;

SELECT length, COUNT(*) AS no_of_films
FROM sakila.film
WHERE title LIKE 'T%'
GROUP BY length
ORDER BY no_of_films DESC;

# List all actors who have appeared in more than 10 films.
select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as no_of_films from sakila.actor a
Join sakila.film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
having count(fa.film_id) >10;

# Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
select title, rental_rate, length from sakila.film
order by rental_rate desc, length desc
limit 5;

# Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM sakila.customer c
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

SELECT f.film_id, f.title
FROM sakila.film f
LEFT JOIN sakila.inventory i ON f.film_id = i.film_id
LEFT JOIN sakila.rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

