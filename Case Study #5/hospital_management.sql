DROP DATABASE hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

create table patient
(
	patient_id int not null auto_increment,
    patient_name varchar(100),
    PRIMARY KEY(patient_id)
)Engine=InnoDB;

create table doctor_category
(
	category_id int not null auto_increment,
    category_name varchar(100),
    PRIMARY KEY(category_id)
)Engine=InnoDB;

create table department
(
	dept_id int not null auto_increment,
    dept_name varchar(100),
    PRIMARY KEY(dept_id)
)Engine=InnoDB;

create table doctor
(
	doctor_id int not null auto_increment, 
    doctor_name varchar(100),
    doctor_category int,
    PRIMARY KEY(doctor_id),
    FOREIGN KEY(doctor_category)
		REFERENCES doctor_category(category_id)
);

create table doctor_department
(
	assignment_id int not null auto_increment,
    doctor_id int,
    dept_id int,
    PRIMARY KEY(assignment_id),
    FOREIGN KEY(doctor_id)
		REFERENCES doctor(doctor_id)
		ON DELETE CASCADE,
	FOREIGN KEY(dept_id)
		REFERENCES department(dept_id)
)Engine=InnoDB;

create table patient_history
(
	patient_history_id int not null auto_increment,
    patient_id int, 
    doctor_id int, 
    date_visit date,
    PRIMARY KEY(patient_history_id)
--     FOREIGN KEY(doctor_id)
-- 		REFERENCES doctor(doctor_id)
-- 		ON DELETE CASCADE,
-- 	FOREIGN KEY(patient_id)
-- 		REFERENCES patient(patient_id)
)Engine=InnoDB;

create table patient_admission_history
(
	admission_id int not null auto_increment,
	-- patient_id int,
    room_no varchar(10),
    date_admitted date,
    date_discharged date,
    bill float,
    patient_history_id int,
    PRIMARY KEY(admission_id)
	-- FOREIGN KEY(patient_history_id)
-- 		REFERENCES patient_history(patient_history_id)
)Engine=InnoDB;

create table patient_diagnosis_history
(
	diagnosis_id int not null auto_increment,
    patient_id int, 
    doctor_id int, 
    diagnosis varchar(200),
    patient_history_id int,
    PRIMARY KEY(diagnosis_id),
	FOREIGN KEY(patient_history_id)
		REFERENCES patient_history(patient_history_id)
)Engine=InnoDB;

create table patient_bill 
(
	bill_id int not null auto_increment, 
   --  patient_id int, 
    patient_history_id int,
    amount_payable float, 
    PRIMARY KEY(bill_id),
    FOREIGN KEY(patient_history_id)
		REFERENCES patient_history(patient_history_id)
)Engine=InnoDB;

create table patient_bill_history 
(
	bill_history_id int not null auto_increment, 
    patient_bill_id int,
    amount_paid float,
    date_paid date,
    PRIMARY KEY(bill_history_id),
    FOREIGN KEY(patient_bill_id)
		REFERENCES patient_bill(bill_id)
)Engine=InnoDB;