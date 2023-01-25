-- join
select department_id, department_name, location_id
from departments;

select location_id, city
from locations;

--equi join
select department_id, department_name, location_id, city
from departments NATURAL JOIN locations;
-- NATURAL JOIN 양옆 공통점을 찾는다.
-- 테이블을 조인했다.

select department_id, department_name, location_id, city
from departments NATURAL JOIN locations
where department_id in (20,50);

select employee_id, last_name, department_id, location_id
from employees join departments
using (department_id);

-- 과제: 위에서 누락된 1인의 이름, 부서번호를 조회하라.
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from employees natural join departments;

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;
-- 약자를 사용할 수 있다.

select l.city, d.department_name
from locations l join departments d
using (location_id)
where d.location_id = 1400; -- 접두사X

select l.city, d.department_name, d.location_id -- 접두사X
from locations l join departments d
using (location_id)
where location_id = 1400;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where department_id = 100;

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d. location_id
from employees e join departments d
on (e.department_id = d.department_id);

select employee_id, city, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--과제: 위 query를 using으로 refactoring 하라
select employee_id, city, department_name
from employees e join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

--과제: toronto 에 위치한 부서에서 일하는 사원들의
--      이름, 직업, 부서번호, 부서명, 도시를 조회하라.
select e.last_name, e.job_id, e.department_id,
        d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city = 'Toronto';

-- non-equi join
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';
-- 프로그래머만큼 돈받는 사람을 찾는다.

-- self join
select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id; 
--접두사를 빼면 오류난다.

select last_name emp, last_name mgr --접두사를 빼면 오류난다.
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

--과제: 같은 부서에서 일하는 사원들의 부서 번호, 이름, 동료명을 조회하라.
select e.department_id, e.last_name employee, c.last_name colleague
from employees e join employees c
on e.department_id = c.department_id
and e.employee_id <> c.employee_id
order by 1,2,3;

--과제: Davies 보다 후에 입사한 사원들의 이름, 입사일을 조회하라.
select e.last_name , e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date;

-- 과제: 매니저보다 먼저 입사한 사원들의 이름, 입사일, 매니저명, 매니저 입사일을 조회하라.
select worker.last_name emp , worker.hire_date emp_date, 
    manager.last_name mgr, manager.hire_date mgr_date
from employees worker join employees manager
on worker.hire_date < manager.hire_date
and worker.manager_id = manager.employee_id;

-- inner join
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

--outer join
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
-- 보고서 쓸때 쓴다.

select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;

-- 과제: 사원들의 이름, 사번, 매니저 명, 매니저의 사번을 조회하라.
--       king 회장도 테이블에 포함하라.
select w.last_name , w.employee_id, m.last_name, m.employee_id
from employees w left outer join employees m
on w.manager_id = m.employee_id
order by 2;

select d. department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d. department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
    and d.department_id in (20, 50);

select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e. department_id = d.department_id
and d.location_id = l.location_id;

select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id(+);
--오류난다

select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;