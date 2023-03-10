--set에는 순서도 없고, 중복값이 들어가지 않는다, 키값이 없다.
--list는 중복되는 것까지 허용, 키값이 있다.

--합집합
select employee_id, job_id
from employees
union -- 중복 제거
select employee_id, job_id
from job_history;
-- 테이블의 구조, 타입이 같아야한다.

select employee_id, job_id
from employees
union all -- 중복 제거하지 않는다.
select employee_id, job_id
from job_history
order by employee_id;

-- 과제: 과거 직업을 현재 갖고 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees e
where exists (select *
             from job_history j
            where e.employee_id = j.employee_id
            and e.job_id = j.job_id);
            
select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history j
                    where e.employee_id = j.employee_id);
                    
select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;

select location_id, department_name
from departments
union
select location_id, state_province
from locations;
--department_name이랑 state_province이 하나로 합쳤다.

--과제: 위 문장을 service 관점에서 고쳐라. union을 사용한다.
select location_id, department_name, null state
from departments
union
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id
from job_history;
-- select가 안맞아서 오류

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by salary;