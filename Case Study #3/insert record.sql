USE employee_db;

insert into department
(dept_name)
values
('engineering'),
('planning'),
('marketing'),
('tech');

insert into employee
(emp_name, position_id)
values
('Arnold', 1),
('Jason', 2),
('Bill', 2),
('Obama', 3),
('Musk', 4);

insert into emp_dept
(emp_num, dept_num)
values
(1,4),
(2,1),
(3,1),
(4,3),
(5,2);

insert into emp_position
(position)
values
('manager'),
('specialist'),
('support'),
('engineer 1');

insert into project
(project_title)
values
('Project 1'),
('Project 2'),
('Project 3');

insert into skill
(skill, emp_num)
values
('drafting', 1),
('marketing', 1), 
('management', 2),
('finance', 3), 
('support', 4),
('writing', 5);

insert into project_team
(project_id, emp_num, dept_num)
values
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 1),
(2, 2, 2);