use train_reservation;

insert into train
(train_name, origin, destination)
values
('train1','01','D1'),
('train2','02','D2'),
('train3','03','D3'),
('train4','04','D4'),
('train5','05','D5');

insert into train_detail
(train_number, date_for_booking, available_seats, seats_taken, ac_ticket,gen_ticket, waiting_ticket)
values
(1,'2024-05-1',10,10,0,10,2),
(2,'2024-05-15',5,15,5,10,2),
(3,'2024-05-15',20,0,10,10,2),
(4,'2024-05-20',10,10,5,5,2),
(5,'2024-05-20',10,10,10,0,2);

insert into ticket_category
(category)
values
('AC'),
('General');