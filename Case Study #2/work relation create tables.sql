DROP DATABASE work_relation;
CREATE DATABASE work_relation;
USE work_relation;

create table employee
(
	id int not null auto_increment,
	emp_num int not null,
    emp_name varchar(100),
    emp_addr varchar(100),
    PRIMARY KEY(id)
)Engine=InnoDB;

create table title
(
	title_id int not null auto_increment,
    title_name varchar(100),
    PRIMARY KEY(title_id)
)Engine=InnoDB;

create table emp_title
(
	emp_title_id int not null auto_increment,
    emp_num int,
    title_id int, 
    PRIMARY KEY(emp_title_id),
    FOREIGN KEY(emp_num)
		REFERENCES employee(id)
        ON DELETE CASCADE,
	FOREIGN KEY(title_id)
		REFERENCES title(title_id)
        ON DELETE CASCADE
);


create table department
(
	dept_num int not null,
    dept_name varchar(100),
    PRIMARY KEY(dept_num)
)Engine=InnoDB;

create table location 
(
	location_id int not null auto_increment,
    location varchar(100),
    PRIMARY KEY(location_id)
)Engine=InnoDB;

create table dept_location
(
	dept_loc_id int not null auto_increment,
    dept_num int,
    location_id int,
    PRIMARY KEY(dept_loc_id),
	FOREIGN KEY(dept_num)
		REFERENCES department(dept_num)
        ON DELETE CASCADE,
	FOREIGN KEY(location_id)
		REFERENCES location(location_id)
)Engine=InnoDB;

create table emp_dept
(
	assignment_id int not null auto_increment,
    emp_num int,
    dept_loc_id int,
    PRIMARY KEY(assignment_id),
    FOREIGN KEY(emp_num)
		REFERENCES employee(id)
        ON DELETE CASCADE,
	FOREIGN KEY(dept_loc_id)
		REFERENCES dept_location(dept_loc_id)
)Engine=InnoDB;



-- create table employee_assignment
-- (
-- 	id int not null auto_increment primary key,
--     emp_num int,
--     job_title_id int,
--     dept_num int,
--     location_id int,
--     FOREIGN KEY(emp_num)
-- 		REFERENCES employee_details(id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(job_title_id)
-- 		REFERENCES work_job(id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(dept_num)
-- 		REFERENCES department(id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(location_id)
-- 		REFERENCES dept_location(id)
--         ON DELETE CASCADE
-- )Engine=InnoDB;