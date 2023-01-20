--과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한 지 3개월 후 첫번째 월요일이다.
--      날짜는 YYYY.MM.DD로 표시한다.
select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'monday'),'YYYY.MM.DD') review_date
from employees; 

select to_char(salary)
from employees;
-- to_char 문자열로 변화시켜준다.

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';
-- 99는 6,000.00으로 나오고 00은 06,000.00로 맞춰서 나왔다.

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual; 
-- fm은 너비 스페이스바 여백을 삭제해준다.

select to_char(1237, 'L9999')
from dual;
-- L은 설정으로 정해 놓은 미국 화폐 단위로 변한다.

--과제: <이름> earns <$,월급> monthly but wants<&,월급 x 3>. 로 조회하라.
--      다이아몬드는 변수 monthly but wants는 상수이다.
select last_name || 'earns' || to_char(salary, '$99,999') || ' monthly but wants' 
        || to_char(salary * 3, 'fm$99,999') || '.'
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');
--거짓된 데이터이다. fx를 써서 오류가 뜬거다.

select to_number('1237')
from dual;

select yo_number('1,237.12')
from dual;
-- 문자가 섞여있으면 오류가 뜬다. 숫자만 가능

select to_number('1,237.12', '9,999.99')
from dual;
-- 99형식으로 쓴다는 얘기이다.

select nvl(null,0)
from dual;
-- 첫번째 값이 null이면 기본값인 0을 리턴한다.

select job_id, nvl(commission_pct, 0)
from employees;
-- 칼럼의 특징은 데이터 타입이 같다.

-- 과제: 사원들의 이름, 직업, 연봉을 조회하라
select last_name, job_id, salary * 12
from employees;

-- 선생님 답
select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) *12 ann_sal
from employees
order by ann_sal desc;

-- 과제: 사원들의 이름, 커미션율을 조회하라.
--       커미션이 없으면, No Commission을 표시한다.
select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees;

--sysdate, nvl은 중요하니 꼭 기억해야 한다.

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;
-- 파라1의 값이 존재하면 파람 2를 리턴하고
-- 파람1의 값이 null이면 파람 3를 리턴한다.

select job_id, nvl2(commission_pct, 'SALCOMM', 0) income
from employees;

select first_name, last_name,
        nullif(length(first_name), length(last_name))
from employees;
--이름과 성의 인덱스가 같으면 값이 없다.

select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees;
--앞에서부터 보고 처음부터 null이 아닌 값을 리턴한다.
-- 둘다 null이면 파라미터3을 리턴한다.

select last_name, salary,
    decode(trunc(salary / 2000),-- incode decode a에서 b로 바꿈
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0.42,
    6, 0.44,
        0.45) tax_rade --맨 마지막엔 기본값
from employees
where department_id = 80;

select decode(salary, 'a', 1)
from employees;
--num이 char과 맞을리가 없기 때문에 전부 null이 리턴된다.

select decode(salary, 'a', 1, 0)
from employees;
--기본값을 0으로 주었다. salart가 문자로 형변환 해서 문자끼리 비교한다.

select decode(job_id, 1, 1)
from employees;
--char타입을 숫자로 변환처리는 불가능하다.

--과제: 사원들의 직업, 직업별 등급을 조회하라.
--      기본 등급은 null 이다.
--      IT_PROG   A
--      AD_PRES    B
--      ST_MAN     C
--      ST_CLERK   D
select job_id, decode(job_id,
        'IT_PROG', 'A',
       'AD_PRES' , 'B',
       'ST_MAN'  , 'C',
       'ST_CLERK', 'D') job_grade
from employees;

select last_name, job_id, salary,
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
select last_name, hire_date, to_char(hire_date, 'fmday')day
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