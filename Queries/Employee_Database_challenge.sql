select employees.emp_no, first_name, last_name,
title, from_date, to_date
into retirement_titles
from employees
inner join titles 
on employees.emp_no = titles.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no 




select distinct on(emp_no) emp_no, first_name, last_name,
title, from_date, to_date
from retirement_titles 
order by emp_no, from_date desc  
select employees.emp_no, first_name, last_name,
title, from_date, to_date
into retirement_titles
from employees
inner join titles 
on employees.emp_no = titles.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no 


select distinct on(emp_no) emp_no, first_name, last_name,
title, from_date, to_date
into unique_titles
from retirement_titles 
order by emp_no, from_date desc 

select count(*) as count, title
from unique_titles
group by title
order by count desc

select count(*) as count, title
into retiring_titles
from unique_titles
group by title
order by count desc

select distinct on(emp_no) employees.emp_no, first_name, last_name, birth_date, 
dept_emp.from_date, dept_emp.to_date, title
into mentorship_eligibilty
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join titles
on employees.emp_no = titles.emp_no
where dept_emp.to_date >= current_date
and birth_date between '1965-01-01' and '1965-12-31'
order by emp_no, titles.from_date desc
