INSERT INTO artist
(first_name, last_name)
VALUES
('Juan', 'Dela Cruz'),
('Tom', 'Cruise'),
('Tony', 'Stark'),
('Leo', 'Da Vinci'),
('Mikel', 'Angelo');

INSERT INTO painting_category
(category_name)
VALUES
('animal'),
('landscape'),
('seascape'),
('naval'),
('still‐life');

INSERT INTO painting
(painting_name, painting_category_id, artist_id, price, date_submitted)
VALUES
('Cats and Dogs', 1, 1, 500, '2024-05-09'),
('Fruits', 5, 2, 500, '2024-05-09'),
('Corals and Beach', 3, 3, 500, '2024-05-09'),
('The Ship', 4, 4, 500, '2024-05-09'),
('The flat land',2, 5, 500, '2024-05-09'),
('Cheeta Racing', 1, 1, 500, '2023-07-09'),
('Veggi Wrap', 5, 1, 500, '2023-08-09'),
('Sea Sells', 3, 1, 500, '2023-12-09');


INSERT INTO customer_category
(category_name, discount)
VALUES
('B', 0),
('S', 0.05),
('G', 0.1),
('P', 0.15);

INSERT INTO customer
(first_name, last_name, category_id)
VALUES
('Megan','Younger', 1),
('Dwayne', 'Jonson', 2),
('Ant', 'Edwards', 3),
('James','Yap', 4),
('Leonel', 'Mesy', 3);


INSERT INTO painting_transaction 
(customer_id, painting_id, date_hired)
VALUES
(6,4, '2024-05-10'),
(6,5, '2024-05-10');


-- ALTER TABLE painting
-- DROP COLUMN last_hired_date;

-- DELETE FROM painting WHERE painting_id <> 0;
-- SET FOREIGN_KEY_CHECKS = 0; 
-- DROP TABLE painting;
-- truncate table painting;
-- SET FOREIGN_KEY_CHECKS = 1;
