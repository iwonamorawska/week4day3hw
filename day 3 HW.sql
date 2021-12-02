--1 List all customers who live in Texas (use JOINs)
select first_name, last_name
from customer 
inner join address
on customer.address_id=address.address_id 
where district like 'Texas';

--2 Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name
from customer 
inner join payment 
on customer.customer_id=payment.customer_id 
where amount >=6.99;

--3 Show all customers names who have made payments over $175(use subqueries)
select first_name,last_name
from customer 
where customer_id in(
	select customer_id
	from payment
	group by customer_id 
	having sum(amount)>175
);

--4 List all customers that live in Nepal (use the city table)
select first_name, last_name
from customer 
inner join address 
on customer.address_id=address.address_id 
inner join city 
on address.city_id=city.city_id 
inner join country 
on city.country_id=country.country_id
where country= 'Nepal';

--5 Which staff member had the most transactions?
select first_name, last_name
from staff 
where staff_id in(
	select count(staff_id)
	from payment 
	group by staff_id 
);

--6 How many movies of each rating are there?
select rating, count(rating)
from film 
group by rating 
order by count desc

--7 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name,last_name
from customer 
where customer_id in(
	select count(amount)
	from payment
	group by amount
	having count(amount) = 1
)

--8 How many free rentals did our stores giveaway?
select count(amount)
from payment 
where amount=0