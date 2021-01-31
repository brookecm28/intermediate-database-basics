--PRACTICE JOINS	

-- SELECT * FROM invoice
-- JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
-- WHERE invoice_line.unit_price > 0.99;

-- SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total 
-- FROM invoice
-- JOIN customer ON invoice.customer_id = customer.customer_id;

-- SELECT c.first_name, c.last_name, e.first_name, e.last_name
-- FROM customer c
-- JOIN employee e ON c.support_rep_id = e.employee_id;

-- SELECT al.title, ar.name
-- FROM album al
-- JOIN artist ar ON al.artist_id = ar.artist_id;

-- SELECT pt.track_id 
-- FROM playlist_track pt
-- JOIN playlist p ON pt.playlist_id = p.playlist_id
-- WHERE p.name = 'Music';

-- SELECT t.name
-- FROM playlist_track pt
-- JOIN track t ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id
-- WHERE pt.playlist_id = 5;

-- SELECT t.name, p.name
-- FROM playlist_track pt
-- JOIN track t ON t.track_id = pt.track_id
-- JOIN playlist p ON pt.playlist_id = p.playlist_id;

-- SELECT t.name, al.title
-- FROM track t
-- JOIN album al ON t.album_id = al.album_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Alternative & Punk';

---------------------

--PRACTICE NESTED QUERIES

-- SELECT * FROM invoice
-- WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price> 0.99);

-- SELECT *
-- FROM playlist_track pt
-- WHERE pt.playlist_id IN (SELECT p.playlist_id FROM playlist p WHERE name = 'Music');

-- SELECT track.name FROM track
-- WHERE track.track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

-- SELECT * FROM track
-- WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

-- SELECT * FROM track
-- WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

-- SELECT * FROM track
-- WHERE album_id IN 
-- (SELECT album_id FROM album WHERE artist_id IN
-- (SELECT artist_id FROM artist WHERE name = 'Queen'));

----------------------

--PRACTICE UPDATING ROWS

-- UPDATE customer
-- SET fax = null
-- WHERE fax IS NOT null;

-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS null;

-- UPDATE customer
-- SET last_name = 'Thompson'
-- WHERE first_name = 'Julia' AND last_name = 'Barnett';

-- UPDATE customer
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl';

-- UPDATE track
-- SET composer = 'The darkness around us'
-- WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Metal')
-- AND composer IS null;

------------------------

--GROUP BY

-- SELECT COUNT(*), genre.name
-- FROM track
-- JOIN genre ON track.genre_id = genre.genre_id
-- GROUP BY genre.name;

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- WHERE g.name = 'Pop' OR g.name = 'Rock'
-- GROUP BY g.name;

-- SELECT ar.name, COUNT(*)
-- FROM album al
-- JOIN artist ar ON ar.artist_id = al.artist_id
-- GROUP BY ar.name;

------------------------

--USE DISTINCT

-- SELECT DISTINCT composer
-- FROM track;

-- SELECT DISTINCT billing_postal_code
-- FROM invoice;

-- SELECT DISTINCT company
-- FROM customer;

------------------------

--DELETE ROWS

-- CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

-- SELECT * FROM practice_delete;

-- DELETE FROM practice_delete
-- WHERE type = 'bronze';

-- DELETE FROM practice_delete
-- WHERE type = 'silver';

-- DELETE FROM practice_delete
-- WHERE value = 150;

-------------------------


--ECOMMERCE SIMULATION

-- CREATE TABLE my_user (
--   u_id SERIAL PRIMARY KEY, 
--   name varchar(100), 
--   weapon_of_choice varchar(100)
-- );

-- CREATE TABLE my_product (
--   product_id SERIAL PRIMARY KEY, 
--   name varchar(150), 
--   price FLOAT
--   );
  
-- CREATE TABLE my_order (
--   order_id SERIAL PRIMARY KEY, 
--   user_id INT, 
--   product_id INT, 
--   quantity INT
--   );

-- INSERT INTO my_user (name, weapon_of_choice) VALUES ('Caitlyn', 'Sniper Rifle');
-- INSERT INTO my_user (name, weapon_of_choice) VALUES ('Ashe', 'Bow & Arrow');
-- INSERT INTO my_user (name, weapon_of_choice) VALUES ('Garen', 'Broadsword');

-- INSERT INTO my_product (name, price) VALUES ('Frost Arrow', 11);
-- INSERT INTO my_product (name, price) VALUES ('Dorans Blade', 57);
-- INSERT INTO my_product (name, price) VALUES ('Ward', 5);

-- INSERT INTO my_order (user_id, product_id, quantity) VALUES (2, 1, 15);
-- INSERT INTO my_order (user_id, product_id, quantity) VALUES (1, 2, 2);
-- INSERT INTO my_order (user_id, product_id, quantity) VALUES (3, 3, 5);

-- SELECT mp.name
-- FROM my_order mo
-- JOIN my_product mp ON mo.product_id = mp.product_id
-- WHERE mo.order_id = 1;

-- SELECT * FROM my_order;

-- SELECT mp.price * mo.quantity
-- FROM my_order mo
-- JOIN my_product mp ON mo.product_id = mp.product_id;

-- ALTER TABLE my_order
-- ADD FOREIGN KEY (user_id) REFERENCES my_user(u_id);

-- SELECT mo.order_id, mu.name, mp.name, mo.quantity, mo.quantity * mp.price
-- FROM my_order mo
-- JOIN my_user mu ON mo.user_id = mu.u_id
-- JOIN my_product mp ON mo.product_id = mp.product_id
-- WHERE mu.u_id = 2;

-- SELECT COUNT(order_id)
-- FROM my_order
-- WHERE user_id = 2;

--BLACK DIAMOND-------
-- SELECT SUM(mo.quantity * mp.price)
-- FROM my_order mo
-- JOIN my_product mp ON mo.product_id = mp.product_id
-- JOIN my_user mu ON mo.user_id = mu.u_id
-- WHERE mu.u_id = 2;