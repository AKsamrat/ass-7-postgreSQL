-- SQLBook: Code
-- Active: 1742304132662@@127.0.0.1@5432@bookstore_db

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(50) NOT NULL,
  price NUMERIC(6,2) NOT NULL CHECK (price >= 0),
  stock INTEGER NOT NULL,
  published_year INTEGER NOT NULL
);
INSERT INTO books(title, author, price, stock, published_year) VALUES(

  'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10 , 1999
),
(
  'Clean Code', 'Robert C. Martin', 35.00, 15 , 2008
),
(
  'You Dont Know JS', 'Kyle Simpson ', 30.00, 8 , 2014
),
(
  ' Refactoring ', 'Martin Fowler ', 50.00, 3 , 1999
),(
  'Database Design Principles', 'Jane Smith ', 20.00, 0 , 20018
)

SELECT * from books;
 

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  joined_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers(name,email,joined_date)
 VALUES(
  'Alice', 'alice@email.com','2023-01-10' 
),
 (
  'Bob', 'bob@email.com','2022-05-15'
),
 (
  'Charlie', 'charlie@email.com','2023-06-20' 
)

SELECT * from customers;

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  book_id INTEGER NOT NULL REFERENCES books(id) ON DELETE CASCADE,
  quantity INTEGER NOT NULL CHECK (quantity > 0),  
  order_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO orders(customer_id,book_id,quantity,order_date)
 VALUES(
  1, 2, 1, '2024-03-10'
),
(
  2, 1, 1, '2024-02-20'
),
(
  1, 3, 2, '2024-03-05'
);

SELECT * FROM orders;


--problem 1 :  Find books that are out of stock
SELECT title from books
WHERE "stock"='0';

--problem 2 : Retrieve the most expensive book in the store.
SELECT * FROM books
 ORDER BY price DESC
LIMIT 1;

--probelem 3 : Find the total number of orders placed by each customer.
SELECT customers.name as name, COUNT(orders.id) AS total_orders  from orders
JOIN books ON orders.book_id = books.id
JOIN customers ON customers.id = orders.customer_id
GROUP BY customers.name



--problem 4 :Calculate the total revenue generated from book sales.

SELECT  sum(orders.quantity * books.price) AS total_revenue  from orders
JOIN books ON orders.book_id = books.id
JOIN customers ON customers.id = orders.customer_id

--pronlem 5 :List all customers who have placed more than one order.

SELECT customers.name AS name, 
       SUM(orders.quantity) AS orders_count
FROM orders
JOIN books ON orders.book_id = books.id
JOIN customers ON customers.id = orders.customer_id
WHERE orders.quantity > 1
GROUP BY customers.name;

--problem 6 :Find the average price of books in the store.

SELECT AVG(books.price) AS avg_book_price
FROM books;

--problem 7 : Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year<2000


--problem 8 : Delete customers who haven't placed any orders.

DELETE from customers WHERE customers.name=(SELECT customers.name
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.customer_id IS NULL)



