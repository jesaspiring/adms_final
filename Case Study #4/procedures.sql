#list all available train details
select train.*, train_detail.* from train
left join train_detail on train.train_number = train_detail.train_number;

#------------------------------------------------------------------------------------------------------------#

#list train open for booking (7 days from start of booking from the current date)
select train.*, train_detail.* from train
left join train_detail on train.train_number = train_detail.train_number
WHERE DATEDIFF(curdate(),date_for_booking) <= 7;

#------------------------------------------------------------------------------------------------------------#

#insert detail of passenger for booking and book ticket

insert into train_booking (train_number, booking_date, ticket_category, seat_number, booking_status)
select train.train_number, curdate(), (select category_id from ticket_category order by rand() limit 1), 
'5a', 1  from train 
join train_detail on train.train_number = train_detail.train_number 
where DATEDIFF(curdate(),date_for_booking) <= 7 order by rand() limit 1;

SET @ticket_category = (SELECT ticket_category FROM train_booking WHERE booking_id = last_insert_id());

update train_detail 
join train_booking on train_booking.train_number = train_detail.train_number
set ac_ticket = if(@ticket_category = 1, ac_ticket-1, ac_ticket),
    gen_ticket = if(@ticket_category = 2, gen_ticket-1, gen_ticket),
    seats_taken = seats_taken + 1,
    available_seats = available_seats - 1
where booking_id = last_insert_id();

insert into ticket 
(booking_id, passenger_name)
values
(last_insert_id(), 'Nikola');

#------------------------------------------------------------------------------------------------------------#

#Delete/Cancel ticket and all booking, return all seats and ticket to previous values
SET @user_ticket = 2;
SET @user_booking_no = (SELECT booking_id FROM ticket WHERE ticket_id = @user_ticket);


DELETE FROM ticket
WHERE ticket_id = @user_ticket;

update train_detail 
join train_booking on train_booking.train_number = train_detail.train_number
set ac_ticket = if(@ticket_category = 1, ac_ticket+1, ac_ticket),
    gen_ticket = if(@ticket_category = 2, gen_ticket+1, gen_ticket),
    seats_taken = seats_taken - 1,
    available_seats = available_seats + 1
where booking_id = @user_booking_no;

DELETE FROM train_booking 
WHERE booking_id = @user_booking_no;


