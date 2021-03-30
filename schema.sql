delimiter //
create procedure CountEmployeesNameStartsWithALetter(
in name_character char(50)
)
begin
select distinct first_name
from employees
where first_name like name_character;
end//
delimiter ;

delimiter //
Create PROCEDURE GetEmployeeCountByTitle(
IN job_title char(50)
)
BEGIN
	SELECT title, count(title) as number_of_employees_with_title
    FROM titles
    WHERE title = job_title;
END//
delimiter ;

delimiter //
Create PROCEDURE GetEmployeeCountByTitle2(
IN job_title char(50),
out total int
)
BEGIN
	SELECT count(title) as number_of_employees_with_title
    into total
    FROM titles
    WHERE title = job_title;
END//
delimiter ;

delimiter //
Create PROCEDURE GetEmployeeCountByTitle3(
IN job_title char(50),
out total int,
inout emp_count char(255)
)
BEGIN
	SELECT title, count(title) as number_of_employees_with_title
    into total
    FROM titles
    WHERE title = job_title;

    if total <= 75000 then
    set emp_count = 'Under 75K. Not too many employees with that title';
    elseif total > 75000 and total < 100000 then
    set emp_count = 'Over 75K but under 100K employees with that title.';
    else
    set emp_count = 'Over 100K employees with that title. That is a lot of employees!';
    end if;

END//
delimiter ;

DELIMITER $$
CREATE PROCEDURE GetAvgSalary()
BEGIN
	SELECT avg(salary) AS "Avg. Salary"
    FROM salaries;
END$$
DELIMITER ;