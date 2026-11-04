# List all customers along with the films they have rented.
select  distinct first_name, last_name,t4.title from sakila.customer as t1 
INNER JOIN sakila.rental as t2 ON t1.customer_id = t2.customer_id 
INNER JOIN sakila.inventory AS t3 ON t2.inventory_id = t3.inventory_id 
INNER JOIN sakila.film as t4 ON t3.film_id = t4.film_id;

# List all customers and show their rental count, including those who haven't rented any films.
select t1.customer_id,first_name, last_name, count(t2.rental_id) as rc from sakila.customer as t1
left join sakila.rental as t2 on t1.customer_id = t2.customer_id 
group by t1.customer_id ORDER BY rc asc;

# Show all films along with their category. Include films that don't have a category assigned.
select t1.film_id, t1.title, c.name from sakila.film as t1 left join sakila.film_category as t2 on t1.film_id = t2.film_id
join sakila.category as c on t2.category_id = c.category_id;

# Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).
select email from sakila.staff union all select email from sakila.customer;

SELECT
    c.customer_id,
    c.email AS customer_email,
    s.staff_id,
    s.email AS staff_email
FROM sakila.customer AS c
LEFT JOIN sakila.staff AS s
    ON c.email = s.email

UNION

SELECT
    c.customer_id,
    c.email AS customer_email,
    s.staff_id,
    s.email AS staff_email
FROM sakila.customer AS c
RIGHT JOIN sakila.staff AS s
    ON c.email = s.email;

select count(*) from sakila.staff;

# Find all actors who acted in the film "ACADEMY DINOSAUR".
select t3.first_name, t3.last_name, t1.title from sakila.film 
as t1 inner join sakila.film_actor as t2 on t1.film_id = t2.film_id
inner join sakila.actor as t3 on t2.actor_id = t3.actor_id
where t1.title = "ACADEMY DINOSAUR";

# List all stores and the total number of staff members working in each store, even if a store has no staff.
select t1.store_id, count(t2.staff_id) as total from sakila.store as t1
left join sakila.staff as t2 on t1.store_id = t2.store_id
group by t1.store_id;

# List the customers who have rented films more than 5 times. Include their name and total rental count.
select t1.customer_id,t1.first_name,t1.last_name, count(t2.rental_id) as total_rc from sakila.customer as t1 
inner join sakila.rental as t2 on t1.customer_id = t2.customer_id
group by t1.customer_id
having total_rc > 5;

