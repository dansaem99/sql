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

--선생님 답
select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'monday'), 'YYYY.MM.DD') review_date
from employees;

select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',      --너비 스페이스바 여백을 삭제한다.
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')  -- 클라이언트가실행한 지역의 화폐 단위로 보여진다.
from dual;

-- 과제: <이름> earns <$,월급> monthly but wants <&,월급 x 3>. 로 조회하라. 
--       다이아몬드는 변수  monthly but wants는 상수이다.
select last_name || ' earns' || to_char(salary, '$99,999') || 
        ' monthly but wants ' || to_char(salary * 3, 'fm$99,999')
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy');
-- 파람2에 파람1에 쓴 데이터가 어떤 형식인지 알려준 것이다.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');
-- 패턴이 다르지만 찰떡같이 알아 듣는다.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy'); 
-- 거짓된 데이터가 들어갈 가능성이 있다. 이때 fx를 씀으로서 오류가 뜬다.

select to_number('1237')
from dual;

select to_number('1,237.12') --문자가 섞여있기에 오류가 발생한다.
from dual;

select to_number('1,237.12', '9,999.99')
from dual; 

select nvl(null, 0) --첫번째 값이 null이면 기본값 0을 리턴한다.
from dual;

select job_id, nvl(commission_pct, 0) --칼럼의 특징은 데이터 타입이 같다.
from employees;

-- 과제: 사원들의 이름, 직업, 연봉을 조회하라.
select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12 ann_sal
from employees
order by ann_sal desc;

-- 과제: 사원들의 이름, 커미션율을 조회하라.
--       커미션이 없으면, No Commission을 표시한다.
select last_name, replace(nvl(Commission_pct, 0), 0, 'No Commission')
from employees; --이샘이의 답

select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees; --선생님의 답

/*sysdate, nvl은 중요하니 꼭 기억해야 한다!*/
--sysdate은 오늘 날짜 구하는거
-- nvl은 NULL 인 경우 대체 값 (지정 값) 을 반환해주는 함수

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income 
-- nvl2는 입력 받은 값이 NULL 인 경우 지정 값 / NULL 이 아닌 경우 지정 값을 각각 반환해주는 함
--파람1의 값이 존재하면 파람2를 리턴하고 
--파람 1의 값이 null이면 파람 3를 리턴한다.
from employees;

select job_id, nvl2(commission_pct, 'SAL_COMM', 0) income
from employees;

select first_name, last_name,
        nullif(length(first_name), length(last_name)) -- 이름과 성의 인덱스가 같으면 값이 없다.
from employees;

select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None') 
-- 앞에서 부터 보고 처음으로 null이 아닌 값을 리턴한다.
-- 둘다 null이면 파람3을 리턴한다.
from employees;

select last_name, salary,
    decode(trunc(salary / 2000),  --incode decode a에서 b로 바꾸는것
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0.42,
    6, 0.44,
        0.45) tax_rate -- 맨 마지막엔 기본값 
from employees
where department_id = 80;

select decode(salary, 'a', 1) --num이 char과 맞을리가 없기때문에 전부 null이 리턴된다.
from employees;

select decode(salary, 'a', 1, 0) -- 기본값을 0으로 주었다. salary가 문자로 형변환 해서 문자끼리 비교한다.
from employees;

select decode(job_id, 1 , 1) -- char 타입을 숫자로 변환처리 불가능하다. 
from employees;

--과제: 사원들의 직업, 직업별 등급을 조회하라.
--      기본 등급은 null 이다.
--      IT_PROG   A
--      AD_PRES    B
--      ST_MAN     C
--      ST_CLERK   D

select job_id , decode(job_id,
       'IT_PROG', 'A',
       'AD_PRES' , 'B',
       'ST_MAN'  , 'C',
       'ST_CLERK', 'D') job_grade
from employees;

select last_name, job_id, salary,   -- case가 when 하면 then 한다.
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AD_PRES' then 1.05 * salary
    else salary end revised_salary
from employees;

select case job_id when '1' then 1
                   when '2' then 2
                   else 0
        end grade
from employees;

select case job_id when '1' then '1'
                   when '2' then '2'
                   else '0'
        end grade
from employees;

select case salary when 1 then '1'
                   when 2 then '2'
                   else '0'
        end grade
from employees;

select last_name, salary, 
    case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'high'
        else 'good'
    end grade
from employees;

-- 과제: 사원들의 이름, 입사일, 입사요일을 월요일부터 요일 순으로 조회하라.
select last_name, hire_date, to_char(hire_date, 'fmday') day
from employees
order by case day
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    when 'sunday' then 7
    end;
    
-- 과제: 2005년 이전에 입사한 사원들에게 100만원 상품권,
--       2005년 후에 입사한 사람들에게 10만원 상품권을 지급한다.
--       사원들의 이름, 입사일, 상품권 금액을 조회하라.
select last_name, hire_date,
    case when hire_date <= '2005/12/31' then '100만원'
        else '10만원' end gift
from employees
order by gift, hire_date;