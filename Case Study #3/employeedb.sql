DROP DATABASE employee_db;
CREATE DATABASE employee_db;
USE employee_db;


create table emp_position 
(
	id int not null auto_increment,
    position varchar(100),
    PRIMARY KEY(id)
)Engine=InnoDB;

create table employee
(
	emp_num int not null auto_increment,
    emp_name varchar(100),
    position_id int,
    PRIMARY KEY(emp_num),
    FOREIGN KEY(position_id)
		REFERENCES emp_position(id)
)Engine=InnoDB;

create table skill
(
	id int not null auto_increment,
    skill varchar(100),
    emp_num int,
    PRIMARY KEY(id),
    FOREIGN KEY(emp_num)
		REFERENCES employee(emp_num)
        ON DELETE CASCADE
)Engine=InnoDB;

create table department
(
	dept_num int not null auto_increment,
    dept_name varchar(100),
    PRIMARY KEY(dept_num)
)Engine=InnoDB;

create table emp_dept
(
	assignment_id int not null auto_increment,
    emp_num int, 
    dept_num int,
    PRIMARY KEY(assignment_id),
    FOREIGN KEY(emp_num)
		REFERENCES employee(emp_num)
        ON DELETE CASCADE,
	FOREIGN KEY(dept_num)
		REFERENCES department(dept_num)
        ON DELETE CASCADE
)Engine=InnoDB;

create table project
(
	project_id int not null auto_increment,
    project_title varchar(100),
    PRIMARY KEY(project_id)
)Engine=InnoDB;

create table project_team
(
	id int not null auto_increment,
    project_id int,
    emp_num int,
    dept_num int,
    PRIMARY KEY(id),
    FOREIGN KEY(emp_num)
		REFERENCES employee(emp_num)
        ON DELETE CASCADE,
	FOREIGN KEY(dept_num)
		REFERENCES department(dept_num)
        ON DELETE CASCADE,
	FOREIGN KEY(project_id)
		REFERENCES project(project_id)
        ON DELETE CASCADE
)Engine=InnoDB;


-- create table department
-- (
-- 	id int not null auto_increment primary key,
--     dept_name varchar(200),
--     dept_num int
-- )Engine=InnoDB;

-- create table position
-- (
-- 	id int not null auto_increment primary key,
--     emp_num int,
-- 	position varchar(200),
-- 	FOREIGN KEY(emp_num)
-- 		REFERENCES employee(id)
--         ON DELETE CASCADE
-- )Engine=InnoDB;

-- create table emp_skill
-- (
-- 	id int not null auto_increment primary key,
--     emp_num int,
--     skill varchar(200),
--     FOREIGN KEY(emp_num)
-- 		REFERENCES employee(id)
--         ON DELETE CASCADE
-- );

-- create table project
-- (
-- 	id int not null auto_increment primary key,
--     project_title varchar(200)
-- )Engine=InnoDB;

-- create table project_assignment
-- (
-- 	id int not null auto_increment primary key,
--     project_id int,
-- 	emp_num int not null,
--     dept_num int not null,
--     FOREIGN KEY(project_id)
-- 		REFERENCES project(id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(emp_num)
-- 		REFERENCES employee(id)
--         ON DELETE CASCADE,
-- 	FOREIGN KEY(dept_num)
-- 		REFERENCES employee(id)
--         ON DELETE CASCADE
-- )Engine=InnoDB;
