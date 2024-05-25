DROP DATABASE painting_hire;
CREATE DATABASE painting_hire;
USE painting_hire;

CREATE TABLE customer_category
(
	category_id int not null auto_increment,
    category_name varchar(100),
    discount float,
    PRIMARY KEY(category_id)
);

CREATE TABLE customer
(
	customer_id int not null auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    category_id int,
    PRIMARY KEY(customer_id),
    FOREIGN KEY(category_id)
		REFERENCES customer_category(category_id)
        ON DELETE CASCADE
);

CREATE TABLE artist 
(
	artist_id int not null auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    PRIMARY KEY(artist_id)
);

CREATE TABLE painting_category
(
	category_id int not null auto_increment,
    category_name varchar(100),
    PRIMARY KEY(category_id)
);

CREATE TABLE painting
(
	painting_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    painting_name varchar(100),
    painting_category_id INT,
    artist_id INT,
    price float,
    date_submitted DATE,
    date_returned DATE,
    -- last_hired_date DATE,
    for_hire TINYINT DEFAULT 0,
    is_hired TINYINT DEFAULT 0,
    FOREIGN KEY(painting_category_id)
		REFERENCES painting_category(category_id)
        ON DELETE CASCADE,
	FOREIGN KEY(artist_id)
		REFERENCES artist(artist_id)
        ON DELETE CASCADE
);

-- CREATE TABLE painting_record 
-- (
-- 	painting_record_id INT NOT NULL AUTO_INCREMENT,
--     painting_id INT,
--     artist_id INT,
--     date_submitted DATE,
--     date_returned DATE,
--     last_hired_date DATE,
--     is_hired TINYINT,
--     PRIMARY KEY(painting_record_id),
--     FOREIGN KEY(painting_id)
-- 		REFERENCES painting(painting_id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(artist_id)
-- 		REFERENCES artist(artist_id)
--         ON DELETE CASCADE
-- );

CREATE TABLE painting_transaction
(
	transaction_id int not null auto_increment,
    customer_id int,
    painting_id int,
    date_hired date,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY(painting_id)
		REFERENCES painting(painting_id)
        ON DELETE CASCADE,
	FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id)
        ON DELETE CASCADE
);