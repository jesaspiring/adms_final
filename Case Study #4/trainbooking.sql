DROP DATABASE train_reservation;
CREATE DATABASE train_reservation;
USE train_reservation;

create table train
(
	train_number int not null auto_increment,
    train_name varchar(200),
    origin varchar(100),
    destination varchar(100),
    PRIMARY KEY(train_number)
)Engine=InnoDB;

create table train_detail
(
	train_detail_id int not null auto_increment,
    train_number int,
    date_for_booking date,
    available_seats int, 
    seats_taken int,
    ac_ticket int, 
    gen_ticket int, 
    waiting_ticket int,
    PRIMARY KEY(train_detail_id),
    FOREIGN KEY(train_number)
		REFERENCES train(train_number)
        ON DELETE CASCADE
)Engine=InnoDB;

-- create table passenger
-- (
-- 	id int not null auto_increment,
--     passenger_name varchar(100),
--     PRIMARY KEY(id)
-- )Engine=InnoDB;

create table ticket_category
(
	category_id int not null auto_increment, 
    category varchar(50),
    PRIMARY KEY(category_id)
)Engine=InnoDB;

create table train_booking
(
	booking_id int not null auto_increment,
    train_number int, 
    booking_date date,
    ticket_category int, 
    seat_number varchar(50),
    booking_status tinyint,
    PRIMARY KEY(booking_id),
    FOREIGN KEY(train_number) 
		REFERENCES train(train_number)
        ON DELETE CASCADE, 
	FOREIGN KEY(ticket_category)
		REFERENCES ticket_category(category_id)
        ON DELETE CASCADE
)Engine=InnoDB;

create table ticket
(
	ticket_id int not null auto_increment,
    booking_id int,
    passenger_name varchar(100), 
    PRIMARY KEY(ticket_id),
	FOREIGN KEY(booking_id)
		REFERENCES train_booking(booking_id)
)Engine=InnoDB;

-- create table train_availability
-- (
-- 	id int not null auto_increment primary key,
--     train_number int,
--     date_available date,
--     FOREIGN KEY(train_number)
-- 		REFERENCES train_details(train_number)
--         ON DELETE CASCADE
-- )Engine=InnoDB;

-- create table train_status
-- (
-- 	id int not null auto_increment primary key,
--     train_number int,
--     seat_available int,
--     seat_taken int,
--     FOREIGN KEY(train_number)
-- 		REFERENCES train_details(train_number)
--         ON DELETE CASCADE
-- )Engine=InnoDB;

-- create table train_seats
-- (
-- 	id int not null auto_increment primary key,
-- 	train_number int,
--     seat_number varchar(50),
--     is_booked tinyint,
--     FOREIGN KEY(train_number)
-- 		REFERENCES train_details(train_number)
--         ON DELETE CASCADE
-- )Engine=InnoDB;

-- create table ticket
-- (
-- 	id int not null auto_increment primary key,
--     ticket_id int,
--     train_number int,
--     booking_date date,
--     passenger_name varchar(200),
--     ticket_category int,
-- 	ticket_status tinyint,
-- 	FOREIGN KEY(train_number)
-- 		REFERENCES train_details(train_number)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(ticket_category)
-- 		REFERENCES ticket_category(id)
--         ON DELETE CASCADE
-- )Engine=InnoDB;

-- create table ticket_category
-- (
-- 	id int not null auto_increment primary key,
--     category_name varchar(50)
-- )Engine=InnoDB;

