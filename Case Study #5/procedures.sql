#Get list of doctor and category
select doctor_name, category_name from doctor
join doctor_category on doctor_category = category_id;

#Get patient history and date visits
select patient_name, doctor_name, date_visit from patient_history
join patient on patient_history.patient_id = patient.patient_id
join doctor on patient_history.doctor_id = doctor.doctor_id;

#Get patient admission history and diagnosis
select patient_history.patient_history_id, patient_name, doctor_name, room_no, date_admitted, date_discharged, bill, diagnosis
from patient_history
join patient_admission_history on patient_history.patient_history_id = patient_admission_history.patient_history_id
join patient_diagnosis_history on patient_history.patient_history_id = patient_diagnosis_history.patient_history_id
join patient on patient_history.patient_id = patient.patient_id
join doctor on patient_history.doctor_id = doctor.doctor_id;

#Get patient bill history
select patient_name, patient_bill.patient_history_id, amount_payable, amount_paid, date_paid from patient_bill 
join patient_bill_history on bill_id = patient_bill_id
join patient_history on patient_bill.patient_history_id = patient_history.patient_history_id
join patient on patient_history.patient_id = patient.patient_id
where patient_bill.patient_history_id = 1;