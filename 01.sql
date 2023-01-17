select *
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

desc departments

select last_name, salary, salary + 300
from employees;

-- 과제: 사원들의 월급, 연봉을 조회하라.
select salary, salary*12
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees; 
-- null값은 비어있다.
/*job_id는 jobs의 테이블들어가 
데이터에 들어가면 약자를 볼 수 있음*/

select last_name, job_id, 12 * selary + (12 * salary * commission_pct)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name "Name", salary * 12 " Annual Salary"
from employees;

-- 과자: 사원들의 사번, 이름, 직업, 입사일(STARTDATE)을 조회하라.
select employee_id, last_name, job_id, hire_date startdate
from employees;
-- 과제: 사원들의 사번(Emp #), 이름(Name), 작업(job), 입사일(Hire Date)을 조회하라.
select employee_id "Emp #", last_name "Name", job_id "Job", hire_date "Hire Date"
from employees;

-- 여기서 ||를 사용하면 하나의 칼럼select로 만들 수 있다.
select last_name || job_id
from employees;

-- last_name 변수명, '' 상수, job_id 변수이다.
select last_name || ' is ' || job_id
from employees;

-- 별명을 넣었다.
select last_name || ' is ' || job_id employee
from employees;

select last_name || null
from employees;

-- 서로 데이터타입이 다르다.
select last_name || commission_pct
from employees;

--데이터타입이 같아야한다. 여기서 salary가 캐릭터로 변화
select last_name || salary
from employees;

select last_name || hire_date
from employees;

select last_name || (salary * 12)
from employees;

-- 과제: 사원들의 '이름,직업'(Emp and Title)
select last_name|| ', ' || job_id "Emp and Title"
from employees;