#Lab | SQL Joins on multiple tables

#1. Write a query to display for each store its store ID, city, and country.

select store_id, city, country from sakila.store as a
join sakila.address as b on a.address_id=b.address_id
join sakila.city as c on b.city_id=c.city_id
join sakila.country as d on c.country_id=d.country_id
group by store_id;

#3.What is the average running time(length) of films by category?

use sakila;
select `name`, avg(`length`) as `Length` from category as a
join film_category as b on a.category_id=b.category_id
join film as c on b.film_id=c.film_id
group by `name`;

#2. Write a query to display how much business, in dollars, each store brought in.


#4.Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

use sakila;
select `name`, avg(`length`) as `Length` from category as a
join film_category as b on a.category_id=b.category_id
join film as c on b.film_id=c.film_id
group by `name`
order by `Length` desc
limit 5;

#5. Display the top 5 most frequently(number of times) rented movies in descending order.

select title, count(rental_id) as freq from film as a
join inventory as b on a.film_id=b.film_id
join rental as c on b.inventory_id=c.inventory_id
group by title
order by freq desc
limit 5;


 