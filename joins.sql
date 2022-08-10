-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
JOIN address 
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM payment
JOIN customer
ON customer.customer_id = payment.customer_id 
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY amount, customer_id 
	HAVING payment.amount > 175
)


-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, country
FROM customer
JOIN address 
ON customer.address_id = address.address_id
JOIN city 
ON address.city_id = city.city_id 
JOIN country
ON city.country_id = country.country_id 
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?

SELECT staff.staff_id, first_name, last_name, COUNT(rental_id) AS transactions
FROM staff 
JOIN rental
ON rental.staff_id = staff.staff_id 
GROUP BY staff.staff_id 
ORDER BY transactions DESC;



-- 6. How many movies of each rating are there?

SELECT rating, COUNT(film_id) AS count
FROM film
GROUP BY rating 
ORDER BY count DESC;


-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer  
WHERE customer_id IN (
	SELECT DISTINCT customer_id
	FROM payment
	WHERE payment.amount > 6.99
	GROUP BY customer_id 
	HAVING COUNT(amount) = 1
)

-- 8. How many free rentals did our stores give away?

SELECT COUNT(amount) FROM payment WHERE amount = 0;


