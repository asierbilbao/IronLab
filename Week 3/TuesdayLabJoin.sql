#1. Which actor has appeared in the most films?

SELECT count(a.film_id) as Appearances, b.first_name, b.last_name FROM sakila.film_actor as a
LEFT JOIN sakila.actor as b on a.actor_id=b.actor_id
GROUP BY a.actor_id
ORDER BY Appearances desc
LIMIT 1;

#2. Most active customer (the customer that has rented the most number of films)


SELECT count(a.rental_id) as activity, b.first_name, b.last_name as num_rentals FROM sakila.rental as a
LEFT JOIN sakila.customer as b on a.customer_id=b.customer_id #join ...... using (ustomer id)
GROUP BY a.customer_id
ORDER BY activity desc
LIMIT 1;

#3. List number of films per category.

SELECT b.`name`, COUNT(a.film_id) AS num_films FROM film_category AS a
LEFT JOIN sakila.category as b on a.category_id=b.category_id
GROUP BY a.category_id;

#4. Display the first and last names, as well as the address, of each staff member.

SELECT a.first_name, a.last_name, b.address FROM sakila.staff as a
LEFT JOIN sakila.address AS b ON a.address_id=b.address_id;

#5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending. 

SELECT a.title, b.`name` FROM sakila.film as a
LEFT JOIN sakila.`language` as b on a.language_id=b.language_id
WHERE a.title LIKE 'M%' AND b.`name` LIKE (b.name = 'English' OR b.name = 'Italian')
ORDER BY title desc;

#6. Display the total amount rung up by each staff member in August of 2005.


#7. List each film and the number of actors who are listed for that film.

SELECT a.title, COUNT(b.actor_id) as num_actors FROM film as a
LEFT JOIN film_actor as b on a.film_id=b.film_id #using film_id
GROUP BY a.title
ORDER BY num_actors desc;

#8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT a.first_name, a.last_name , SUM(b.amount) as payment_amount FROM sakila.customer as a
LEFT JOIN sakila.payment as b on a.customer_id=b.customer_id
GROUP BY a.customer_id
ORDER BY last_name 


 
