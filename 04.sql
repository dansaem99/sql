select hire_date
from employees
where hire_date = '2003/06/17';
-- char이 date로 바꿈

select salary
from employees
where salary = '7000';
-- char이 num로 바꿈

select hire_date || ''
from employees;
-- date이 char로 바꿈

select salary || ''
from employees;
--num이 char로 바꿈

select to_char(hire_date)
from employees;
-- date이 char로 바꿈 Function

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(dy)')
from dual;

select to_char(sysdate, 'd')
from dual;
-- 요일의 숫자를 나온다

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

--과제: 위 테이블을 월요일부터 입사일수 오름차순 정렬하라
select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd') , hire_date;

select to_char(sysdate, 'hh24:mi:ss:am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'DD Month YY')
from employees;
select to_char(hire_date, 'fmDD Month YY')-- fill mode
from employees;-- fm이 공간을 압축해준다

--과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한 지 3개월 후 첫번째 월요일이다.
--      날짜는 YYYY.MM.DD로 표시한다.
select last_name, hire_date,
    add_months(hire_date, 3),
    to_char(hire_date, 'day')
from employees
where to_char(hire_date, 'day') like 'm%';