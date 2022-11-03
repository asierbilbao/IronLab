#1 / List all films whose length is longer than the average of all the films.

select title from sakila.film
where `length` > (select avg(`length`) from sakila.film);

#2 / How many copies of the film Hunchback Impossible exist in the inventory system?


SELECT b.`title`, count(a.film_id) as copies FROM sakila.inventory as a 
LEFT JOIN sakila.film as b on a.film_id=b.film_id
WHERE b.`title`='Hunchback Impossible'
GROUP BY a.film_id;

#3 / Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name from sakila.actor
where actor_id in 
		(select actor_id from sakila.film_actor where film_id=
			(select film_id from sakila.film where `title`='Alone Trip'));
            
#4 / Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
        
select `title` from sakila.film 
where film_id in
	(select film_id from sakila.film_category where category_id in 
		(select category_id from sakila.category where `Name`='Family'));
        
        
#5 / Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
        
#subqueries

select first_name, last_name, email from sakila.customer
where address_id in 
	(select address_id from sakila.address where city_id in 
		(select city_id from sakila.city where country_id in
			(select country_id from sakila.country where country='canada')));

#joints

# 6 / Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

#Find the most prolific actor: actor_id=107

select a.actor_id, a.first_name, a.last_name, count(b.film_id) as appearances from sakila.actor as a
left join sakila.film_actor as b on a.actor_id=b.actor_id
group by a.actor_id
order by appearances desc
limit 1;

#Films starred with the most prolific actor. 

select title from sakila.film
where film_id in 
	(select film_id from sakila.film_actor where actor_id='107');

#all the code together
select title from sakila.film
where film_id in 
	(select film_id from sakila.film_actor where actor_id=
    (select a.actor_id as appearances from sakila.actor as a
	left join sakila.film_actor as b on a.actor_id=b.actor_id
	group by a.actor_id
	order by count(b.film_id) desc
	limit 1));

# 7 / Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

#find most profitable customer: customer_id = 526

select a.customer_id, sum(b.amount) as total_amount from sakila.customer as a
left join sakila.payment as b on a.customer_id=b.customer_id
group by a.customer_id 
order by total_amount desc
limit 1;
 
select title from sakila.film
where film_id in
	(select film_id from sakila.inventory where inventory_id in
			(select inventory_id from sakila.rental where customer_id='526'));
            
#in one code
select title from sakila.film
where film_id in
	(select film_id from sakila.inventory where inventory_id in
		(select inventory_id from sakila.rental where customer_id=
			(select a.customer_id as total_amount from sakila.customer as a
			left join sakila.payment as b on a.customer_id=b.customer_id
			group by a.customer_id 
			order by total_amount desc
			limit 1)));
        
