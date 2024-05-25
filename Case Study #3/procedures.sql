#list of employees and position
select emp_name, position from employee
join emp_position on employee.position_id = emp_position.id;

#list skill by specific employee
select emp_name, skill from employee
join skill on skill.emp_num = employee.emp_num 
where employee.emp_num = 1;

#list project team of specific project
select project_title, emp_name, dept_name from project
join project_team on project.project_id = project_team.project_id
join employee on project_team.emp_num = employee.emp_num
join department on project_team.dept_num = department.dept_num
where project.project_id = 1;

#list of project by specific employee
select project_title, emp_name from project
join project_team on project.project_id = project_team.project_id
join employee on project_team.emp_num = employee.emp_num
join department on project_team.dept_num = department.dept_num
where employee.emp_num = 1;

#list of project by specific department
select project_title, dept_name from project
join project_team on project.project_id = project_team.project_id
join employee on project_team.emp_num = employee.emp_num
join department on project_team.dept_num = department.dept_num
where department.dept_num = 1;