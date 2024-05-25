#Get list employee, their title and assignment
select employee.*, title_name, dept_name, location from employee
join emp_title on employee.id = emp_title.emp_num
join title on emp_title.title_id = title.title_id
join emp_dept on employee.id = emp_dept.emp_num
join dept_location on emp_dept.dept_loc_id = dept_location.dept_loc_id
join department on dept_location.dept_num = department.dept_num
join location on dept_location.location_id = location.location_id;

#Get titles of specific employee
select employee.*, title_name from employee
join emp_title on employee.id = emp_title.emp_num
join title on emp_title.title_id = title.title_id
WHERE employee.id = 2;

#Get department assignments of specific employee
select employee.*, dept_name, location from employee
join emp_dept on employee.id = emp_dept.emp_num
join dept_location on emp_dept.dept_loc_id = dept_location.dept_loc_id
join department on dept_location.dept_num = department.dept_num
join location on dept_location.location_id = location.location_id
WHERE employee.id = 3;

#Get list of departments on a specific location
select dept_name, location from dept_location
join department on dept_location.dept_num = department.dept_num
join location on dept_location.location_id = location.location_id
where location = 'roxas';