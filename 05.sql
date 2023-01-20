select avg(salary), max(salary), min(salary), sum(salary)
--avg 리터하는건 1개다.
from employees;
--avg 해당 컬럼 값들에 대해 평균을 구하는 함수

select min(hire_date), max(hire_date)
from employees;

-- 과제: 최대월급과 최소월급의 차액을 조회하라.
select max(salary) - min(salary)
from employees;

select count(*)
from employees;
--row 갯수를 세다

-- 과제 : 70번 부서원이 몇명인 지 조회하라.
select count(department_id) --select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;

select avg(commission_pct)
from employees;
--영업사원의 commission 평균

--과제: 조직의 평균 커미션율을 조회하라.
select avg(nvl(commission_pct,0))
from employees;

select avg(all salary)
from employees;

select avg(distinct salary)
from employees;

--과제 : 직원이 배치된 부서 개수를 조회하라.
select count(distinct department_id)
from employees;

--과제: 매너저 수를 조회하라.
select count(distinct manager_id)
from employees;

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id, job_id
order by department_id;

--과제:직업별 사원수를 조회하라.
select job_id , count(employee_id)
from employees
group by job_id;

select department_id, max(salary)
from employees
group by department_id
having department_id > 50;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal > 10000;
--별명을 쓰면 앙대영

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

select department_id, max(salary)
from employees
where max(salay) > 10000
group by department_id;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;

--과제: 매니저ID, 매니저별 관리 직원들 중 최소 월급을 조회하라.
--      최소 월급이 $6,000 초과여야한다.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

select max(avg(salary))
from employees
group by department_id;
--avg(salary) 이건 group by가 없으면 오류뜬다.

select sum(max(avg(salary)))
from employees
group by department_id;
--group은 2단계까지만 쓸 수 있다. ()1(())2

select department_id, round(avg(salary))
from employees
group by department_id;
--round가 정수로 만들어줬다. 12번 실행

select department_id, round(avg(salary))
from employees;
--group by department_id; 이게 없으면 오류뜬다.

-- 2차원으로 생각해서 풀어보자
--과제: 2001년, 2002년, 2003년도별 입사자 수를 조회하라.
select to_char(hire_date,'YYYY'), count(*)
from employees
where to_char(hire_date, 'YYYY') = '2001' or
      to_char(hire_date, 'YYYY') = '2002' or
      to_char(hire_date, 'YYYY') = '2003'
group by to_char(hire_date, 'YYYY')
order by to_char(hire_date, 'YYYY');

-- 선생님 답 1번
select to_char(hire_date,'YYYY') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'YYYY') in (2001, 2002, 2003)
group by to_char(hire_date, 'YYYY')
order by hire_year;

-- 선생님 답 2번
select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

-- 선생님 답 3번
select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- 과제: 직업별, 부서별 월급합을 조회하라.
--       부서는 20, 50, 80이다.
select job_id, sum(case when department_id = 20 then salary end) "20",
                sum(case when department_id = 50 then salary end) "50",
                sum(case when department_id = 80 then salary end) "80"
from employees
where department_id in(20, 50, 80)
group by department_id, job_id
order by department_id;
-- 선생님답
select job_id, sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;