select * from album

Q.1) Who is the senior most employee based on job title ?

     select * from employee
     order by levels desc
     limit 1

Q.2) Which countries have the most invoices ?

     select * from invoice
     select count (*) as c, billing_country
     from invoice
     group by billing_country
     order by c desc

Q.3) What are top 3 values of total invoice ?

     select total from invoice
     order by total desc
     limit 3

Q.4) Which has the best customers? we would like to throw a promotional music festival
    in the city we made the most money. write a query that returns one city that has the
   highest sum of invoice totals. Return both the city name & sum of all invoice totals.

	select sum(total) as invoice_total, billing_city
    from invoice
    group by billing_city
    order by invoice_total desc

Q.5) Who is the best customer ? The customer who has spent the most money will be 
    declared the best customer. Write a query that returns the person who has spent the 
     most money.

	select * from customer
    select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
    from customer
    join invoice on customer.customer_id = invoice.customer_id
    group by customer.customer_id
    order by total desc
    limit 1

Q.6) Write a query to return the email, first name, last name, and genre of all Rock
    Music listeners. Return your list ordered alphabetically by email starting with A.

	select distinct email, first_name, last_name
    from customer
    join invoice on customer.customer_id = invoice.customer_id
    join invoice_line on invoice.invoice_id = invoice_line.invoice_id
    where track_id in(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
	)
    order by email;

Q.7) Let's invite th artists who have written the most rock music in our dataset.
	Write a query that returns the artist name and total track count of the top 10
	rock bands.

	select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
	from track
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	JOIN genre ON genre.genre_id = track.genre_id
	WHERE genre.name LIKE 'Rock'
	Group by artist.artist_id
	order by number_of_songs DESC
	limit 10;

Q.8) Return all the track names that have a song length longer than the average song
	lenth. Return the name and milliseconds for each track. order by the song length
	with the longest songs listed first.

	select name,milliseconds
	from track
	where milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	from track)
	order by milliseconds DESC;
	)
	
    