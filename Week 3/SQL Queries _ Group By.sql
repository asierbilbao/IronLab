#1

use sakila;
select last_name, count(last_name) as freq from actor
group by last_name
having freq = 1;

#2
select last_name, count(last_name) as freq from actor
group by last_name
having freq > 1;

#3

select staff_id, count(rental_id) from rental
group by staff_id;

#4

select rating, count(rating) from film
group by rating;

#5

select rating, avg(`length`) from film
group by rating;

#6

select rating, avg(`length`) as `avg` from film
group by rating
having `avg`>120;

