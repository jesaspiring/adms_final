USE work_relation;

insert into department
(dept_num, dept_name)
values
(1,'pressing'),
(2,'welding'),
(9,'packing'),
(7,'payroll'),
(5,'mailroom');

insert into location
(location)
values
('iloilo'),
('roxas'),
('capiz'),
('estancia'),
('batad');

insert into employee
(emp_num, emp_name, emp_addr)
values
(12, 'ting', '111 FIRST ST'),
(78, 'rea', '222 SECOND ST'),
(66, 'simon', '100 MAIN ST'),
(77, 'toto', '300 BROAD ST'),
(99, 'taguy', '111 FIRST ST'),
(12, 'rose', '111 FIRST ST'),
(76, 'spence', '222 SECOND ST'),
(12, 'davis', '111 FIRST ST');

insert into title
(title_name)
values
('clerk'),
('helper'),
('electrician'),
('foreman');

insert into emp_title
(emp_num, title_id)
values
(1,2),
(2,2),
(3,3),
(4,4),
(5,1),
(6,1),
(7,1),
(8,1),
(2,3),
(2,4),
(1,3);

insert into dept_location
(dept_num, location_id)
values
(1,1),
(2, 2),
(9, 2),
(1, 4),
(1, 5),
(5, 5);

insert into emp_dept
(emp_num, dept_loc_id)
values
(1,1),
(2,1),
(3,2),
(4,3),
(5,7),
(6,4),
(7,5),
(8,6),
(3,1),
(3,4);