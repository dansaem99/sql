--subquery
select last_name, salary 
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');
--mainquery     subquery

select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');
                
--과제: kochhar 에게 보고하는 사원들의 이름, 월급을 조회하라.
select last_name, salary
from employees
where manager_id = (select employee_id
                    from employees
                    where last_name = 'Kochhar');

-- 과제: IT 부서에서 일하는 사원들의 부서번호, 이름, 직업을 조회하라.
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                       from departments
                       where department_name = 'IT');
                       
-- 과제: Abel과 같은 부서에서 일하는 동료들의 이름, 입사일을 조회하라.
--       이름으로 오름차순 정렬한다.
select last_name, hire_date
from employees
where department_id = (select department_id
                       from employees
                       where last_name = 'Abel')
and  last_name <> 'Abel'
order by last_name;

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'King');--king은 10000,24000 2개가나옴
-- King이 2명이 있기때문에 연산자 성립이 안된다.

select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);

select department_id, MIN(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                      from employees
                      where department_id = 50);

-- 과제: 회사 평균 월급 이상 버는 사원들의 사번, 이름, 월급을 조회하라.
--      월급 내림차순 정렬한다.
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by salary desc;

select employee_id, last_name
from employees
where salary = (select min(salary)
                from employees
                group by department_id);
                
select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);

--과제: 이름에 u가 포함된 사원이 있는 부서에 일하는 사원들의 사번, 이름을 조회하라.
select employee_id, last_name
from employees
where department_id in (select department_id
                       from employees
                       where last_name like '%u%');

-- 과제: 1700번 지역에 위치한 부서에서 일하는 사원들의 이름, 직업, 부서번호를 조회하라.
select last_name, job_id, department_id
from employees
where department_id in (select department_id
                       from departments
                       where location_id = 1700);
                    
select employee_id, last_name
from employees
where salary =any (select min(salary)
                    from departments
                    where location_id = 1700);
-- =any은 in이랑 뜻이 같다.

select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <all (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';
-- all 모든걸 포함시켜준다. 4200미만인걸 찾는다.

--과제: 60번 부서의 일부 사원보다 월급이 많은 사원들의 이름을 조회하라.
select last_name
from employees
where salary >any (select salary
                    from employees
                    where department_id = 60);
                    
-- 과제: 회사 평균 월급보다, 그리고 모든 프로그래머보다 월급을 더 받는
--       사원들의 이름, 직업, 월급을 조회하라.
select last_name, job_id, salary
from employees
where salary > (select avg(salary)
                from employees)
and salary >all (select salary
                 from employees
                 where job_id = 'IT_PROG');
                 
select last_name
from employees
where salary = (select salary
                from employees
                where employee_id = 1);
                
select last_name
from employees
where salary in (select salary
                 from employees
                 where job_id = 'IT');

select last_name
from employees
where employee_id in (select manager_id
                        from employees);

select last_name
from employees
where employee_id not in (select manager_id
                        from employees);

-- 과제: 위 문장을 all연산자로 redactoring 하라                     
select last_name
from employees
where employee_id <>all (select manager_id
                        from employees);
                        
select count(*)
from departments;

select count(*)
from departments d
where exists (select *
                from employees e
                where e.department_id = d.department_id);
-- departments d 상품,employees e 주문 주문된 수만 나온다.

-- 과제: 직업을 바꾼 적이 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history j
                where e.employee_id = j.employee_id);