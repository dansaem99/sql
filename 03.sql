-- single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;
-- 소문자로만 나온다. 문자열을 소문자로 반환

select upper('SQL Course')
from dual;
-- 대문자로만 나온다.문자열을 대문자로 반환

select initcap('SQL Course')
from dual;
--첫 글자만 대문자 나머지 소문자

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';
-- 문자열을 둘 다 소문자로 바꾸어 매칭해야한다.

select concat('Hello', 'World')
from dual;
--concat이 연결자 || 역할을 하므로 출력문에는 성+이름이 합쳐진 결과창이 로드된다.

select substr('HelloWorld', 2, 5)
from dual;
-- 2 ~ 5번째 있는 글자까지 인출한다.

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;
-- 다섯 글자임을 알려준다.

select instr('Hello', 'l')
from dual;
-- Hello 에 l이 몇개 있나 물어봐서 3을 인출했다.

select instr('Hello', 'w')
from dual;
-- w가 없어 0을 인출했다.

select lpad(salary, 5, '*')
from employees;
--왼쪽으로 월급을 다섯자리로 만들고 네자리는 별로 채운다.

select rpad(salary, 5, '*')
from employees;
--오른쪽으로 채운다

select replace('JACK and JUE', 'J', 'BL')
from dual;

select trim('H' from 'Hello')
from dual;
-- trim은 글자를 빼준다.

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;
-- space를 지워줬다.

--과제: 위 query에서 ' '가 trim 됐음을, 눈으로 확인할 수 있게 조회하라.
select '|' || trim('' , from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

-- 과제: 위 query에서, where 절을 like로 refactoring 하라.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

--과제: 이름이 J나 A나 M으로 시작하는 사원들의 이름, 이름의 글자수를 조회하라.
--      이름의 첫글자는 대문자, 나머지는 소문자로 출력한다.
select initcap(last_name), length(last_name)
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';

select round(45.926, 2)
from dual;
select trunc(45.926, 2)
from dual;

select round(45.923, 0), round(45.923)
from dual;
select trunc(45.926, 0), trunc(45.923)
from dual;

--과제: 사원들의 이름, 월급, 15.5% 인상된 월급(New Salary, 정수), 인상액(Increase)을 조회하라.
select last_name, salary,
     round(salary * 1.155) "New Salary",
     round(salary * 1.155) - salary "Increase"
from employees;

select sysdate
from dual;
-- 오늘 날짜가 나온다.

select sysdate + 1
from dual;
-- 날짜를 더할수도있다.

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;
--90번 사원들을 뽑아 오늘 날짜 - 입사일 = 근속일 구했다.

select months_between('2023/12/31', '2022/12/31')
from dual;

select add_months('2023/01/18', 3)
from dual;
-- 3개월 뒤

select next_day('2023/01/18', 4)
from dual;
-- 4는 수요일을 뜻하고 그 다음주 수요일을 말한다.

select next_day('2023/01/18', 'thursday')
from dual;

select next_day('2023/01/18', 'thu')
from dual;

select last_day('2023/01/18')
from dual;

-- 과제: 20년 이상 재직한 사원들의 이름, 첫월급일을 조회하라.
--      월급은 매월 말일에 지급합니다.
select  last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

--과제: 사원들의 이름, 월급 그래프를 조회하라.
--      그래프는 1000당 *하나를 표시한다.
select last_name, salary, rpad('*' , salary / 1000, '*')
from employees;
-- 선생님 답
select last_name, salary, rpad(' ' , salary / 1000 + 1, '*')
from employees;