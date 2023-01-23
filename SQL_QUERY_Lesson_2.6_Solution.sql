-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the 
-- table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors
--  have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one 
-- time with actor "Angelina Astaire", hence we would want this in our output list.
use sakila;
select * from actor;

select last_name, count((last_name)) as 'No_of_last_name' from sakila.actor
group by last_name
having count(last_name) = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

select last_name, count((last_name)) as 'No_of_last_name' from sakila.actor
group by last_name
having count(last_name) >1;



-- Using the rental table, find out how many rentals were processed by each employee.
select * from sakila.rental;
select staff_id, count(inventory_id) from sakila.rental
group by staff_id;

-- Using the film table, find out how many films were released each year.
select * from sakila.film;
select count(film_id) from sakila.film
group by release_year;

Select count(*), release_year from sakila.film group by release_year;

-- Using the film table, find out for each rating how many films were there.
select count(film_id) as no_of_films, rating from sakila.film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating as 'film rating',  round(avg(length), 2) as 'mean length of film' from sakila.film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating as 'film rating', round(avg(length), 2)  as 'duration_of_film' from sakila.film
group by rating
having round(avg(length), 2) > 120;
/*select rating as 'film rating', SEC_TO_TIME(round(avg(length), 2) * 60) as 'duration_of_film' from sakila.film
group by rating
having SEC_TO_TIME(round(avg(length), 2) * 60) > 02:00:00;
*/

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT
    title, length,
   
    RANK() OVER (PARTITION BY
                     length
                 ORDER BY
                     length desc
					
                ) film_rank 
FROM
    film
    where not length = 0 ;



