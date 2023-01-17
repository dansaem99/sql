-- where
select employee_id, last_name, department_id
from employees
where department_id = 50;
--50번 부서에서 일하는 사원을 출력
--department_id 부서번호.

-- 과제: 176번 사원의 사번, 이름, 부서 번호를 조회하라.
select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';
--whale 데이터다. 이름의 데이터를 출력

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';
-- 저 날짜에 입사한 사원 데이터 출력

select last_name, salary
from employees
where salary <= 3000;
-- 월급이 3000이하의 사원들

-- 과제: 월 12,000이상 버는 사원들의 이름, 월급을 조회하라.
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';
-- !=는 다르다라는 뜻이다.

select last_name, salary
from employees
where salary between 2500 and 3500;
-- 2500 <= salary <= 3500 값
-- between은 선이다.
-- 범위 조건이로 A~C까지의 방법으로 많이 사용됩니다.

select last_name
from employees
where last_name between 'King' and 'Smith';
-- K~S까지

-- 과제: 'King' 사원의 first_name, last_name, 직업, 월급을 조회하라.
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';
-- 입사일에 들어온 사원들 조회

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);
--100, 101, 201번의 상사를 둔 사원을 조회
-- in은 접선이다.

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or
    manager_id = 101 or
    manager_id = 201;
    --100, 101, 201번의 상사를 둔 사원을 조회
    -- in은 or문의 반복이다.
    
select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargars');
-- 이름으로 조회

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');
-- 입사일로 조회

--양자역학
select last_name
from employees
where last_name like 'S%';
-- 이름이 대문자 S를 들어간 사람을 찾아라.
-- %는 와일드 카드 검색기능을 쓸때 와일드카드를 사용하라.

select last_name
from employees
where last_name like '%r';

--과제: 이름에 s가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%s%';

--과제: 2005년에 입사한 사원들의 이름, 입사일을 조회하라.
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like 'K___'; -- 임의의 한글자 K로 시작하는 4글자를 찾는다.

-- 과제: 이름의 두번째 글자가 o인 사원의 이름을 조회하라.
select last_name
from employees
where last_name like '_o%';

select job_id
from employees;

select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\';

select last_name, job_id
from employees
where job_id like 'I_[_%' escape '[';

-- 과제: 직업에 _R이 포함된 사원들의 이름, 직업을 조회하라.
select last_name, job_id
from employees
where job_id like '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

select last_name, manager_id
from employees
where manager_id = null;
-- true의 값이 없기 때문에 인출을 못하는것이다.

select last_name, manager_id
from employees
where manager_id is null;
-- is null이 연산자이다.

select last_name, job_id, salary
from employees
where salary >= 5000 and job_id like '%IT%';

select last_name, job_id, salary
from employees
where salary >= 5000 or job_id like '%IT%';

-- 과제: 월급이 5000이상 12000이하이다. 그리고,
--       20번이나 50 부서에서 일하는 
--       사원들의 이름, 월급, 부서번호를 조회하라.
select last_name, salary, department_id
from employees
where (salary between 5000 and 12000) and
    department_id in (20 , 50);
    
-- 과제: 이름에 a와 e가 포함된 사원들의 이름을 조회하라.
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'SA_REP');
-- 여집합은 not으로 표현했다.

select last_name, salary
from employees
where salary not between 10000 and 15000;
-- 지정한 값의 다른 범위가 나타난다.

select last_name, job_id
from employees
where job_id not like '%IT%';

select last_name, job_id
from employees
where commission_pct is not null;

select last_name, salary
from employees
where not (manager_id is null and salary >= 20000);

-- 과제: 직업이 영업입니다. 그리고, 월급이 2500, 3500가 아니다.
--       위 사원들의 이름, 직업, 웝급을 조회하라.
select last_name, job_id, salary
from employees
where job_id like 'SA%' and
    salary not in (2500 , 3500);
    
select last_name, department_id
from employees
order by department_id;
-- 올림차순으로로 정렬

select last_name, department_id
from employees
order by department_id desc;
-- 내림차순으로 정렬

select last_name, department_id
from employees
order by 2;

select last_name, department_id dept_id
from employees
order by dept_id;
-- 별명을 만들어 별명을 써서 사용할 수 있다.

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;
-- id 올림차순 안에 월급도 내림차순으로 정리했다.