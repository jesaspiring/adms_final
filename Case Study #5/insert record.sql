use hospital_management;

insert into doctor_category 
(category_name)
values
('regular'),
('oncall');

insert into department
(dept_name)
values
('ICU'), #1
('Gyne'), #2
('ER'), #3
('OR'), #4
('Neurology'), #5
('Cardiology'); #6
 
insert into doctor
(doctor_name, doctor_category)
values
('doctor1', 1), #1
('doctor2', 1), #2
('doctor3', 1), #3
('doctor4', 2), #4
('doctor5', 2); #5

insert into doctor_department
(doctor_id, dept_id)
values
(1,1),
(2,3),
(3,6);

insert into patient
(patient_name)
values
('Brian Mcknight'),
('Iris Goo');

insert into patient_history
(patient_id, doctor_id, date_visit)
values
(1, 3, curdate()),
(1, 3, '2024-06-03');

insert into patient_admission_history
(room_no, date_admitted, date_discharged, bill, patient_history_id)
values
(5, curdate(), '2024-05-31', 5500.00, 1);

insert into patient_diagnosis_history
(diagnosis, patient_history_id)
values
('acute gastronitis', 1),
('follow up checkup', 2);

insert into patient_bill
(patient_history_id, amount_payable)
values
(1, 0.00),
(2, 500);

insert into patient_bill_history
(patient_bill_id, amount_paid, date_paid)
values
(1, 5500.00, '2024-05-31');