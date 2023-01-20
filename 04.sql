select hire_date
from employees
where hire_date = '2003/06/17';
-- char�� date�� �ٲ�

select salary
from employees
where salary = '7000';
-- char�� num�� �ٲ�

select hire_date || ''
from employees;
-- date�� char�� �ٲ�

select salary || ''
from employees;
--num�� char�� �ٲ�

select to_char(hire_date)
from employees;
-- date�� char�� �ٲ� Function

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(dy)')
from dual;

select to_char(sysdate, 'd')
from dual;
-- ������ ���ڸ� ���´�

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

--����: �� ���̺��� �����Ϻ��� �Ի��ϼ� �������� �����϶�
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
from employees;-- fm�� ������ �������ش�

--����: ������� �̸�, �Ի���, �λ������� ��ȸ�϶�.
--      �λ������� �Ի��� �� 3���� �� ù��° �������̴�.
--      ��¥�� YYYY.MM.DD�� ǥ���Ѵ�.
select last_name, hire_date,
    add_months(hire_date, 3),
    to_char(hire_date, 'day')
from employees
where to_char(hire_date, 'day') like 'm%';

--������ ��
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

select '|' || to_char(12.12, 'fm9999.99') || '|',      --�ʺ� �����̽��� ������ �����Ѵ�.
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')  -- Ŭ���̾�Ʈ�������� ������ ȭ�� ������ ��������.
from dual;

-- ����: <�̸�> earns <$,����> monthly but wants <&,���� x 3>. �� ��ȸ�϶�. 
--       ���̾Ƹ��� ����  monthly but wants�� ����̴�.
select last_name || ' earns' || to_char(salary, '$99,999') || 
        ' monthly but wants ' || to_char(salary * 3, 'fm$99,999')
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy');
-- �Ķ�2�� �Ķ�1�� �� �����Ͱ� � �������� �˷��� ���̴�.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');
-- ������ �ٸ����� �������� �˾� ��´�.

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy'); 
-- ������ �����Ͱ� �� ���ɼ��� �ִ�. �̶� fx�� �����μ� ������ ���.

select to_number('1237')
from dual;

select to_number('1,237.12') --���ڰ� �����ֱ⿡ ������ �߻��Ѵ�.
from dual;

select to_number('1,237.12', '9,999.99')
from dual; 

select nvl(null, 0) --ù��° ���� null�̸� �⺻�� 0�� �����Ѵ�.
from dual;

select job_id, nvl(commission_pct, 0) --Į���� Ư¡�� ������ Ÿ���� ����.
from employees;

-- ����: ������� �̸�, ����, ������ ��ȸ�϶�.
select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12 ann_sal
from employees
order by ann_sal desc;

-- ����: ������� �̸�, Ŀ�̼����� ��ȸ�϶�.
--       Ŀ�̼��� ������, No Commission�� ǥ���Ѵ�.
select last_name, replace(nvl(Commission_pct, 0), 0, 'No Commission')
from employees; --�̻����� ��

select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees; --�������� ��

/*sysdate, nvl�� �߿��ϴ� �� ����ؾ� �Ѵ�!*/
--sysdate�� ���� ��¥ ���ϴ°�
-- nvl�� NULL �� ��� ��ü �� (���� ��) �� ��ȯ���ִ� �Լ�

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income 
-- nvl2�� �Է� ���� ���� NULL �� ��� ���� �� / NULL �� �ƴ� ��� ���� ���� ���� ��ȯ���ִ� ��
--�Ķ�1�� ���� �����ϸ� �Ķ�2�� �����ϰ� 
--�Ķ� 1�� ���� null�̸� �Ķ� 3�� �����Ѵ�.
from employees;

select job_id, nvl2(commission_pct, 'SAL_COMM', 0) income
from employees;

select first_name, last_name,
        nullif(length(first_name), length(last_name)) -- �̸��� ���� �ε����� ������ ���� ����.
from employees;

select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None') 
-- �տ��� ���� ���� ó������ null�� �ƴ� ���� �����Ѵ�.
-- �Ѵ� null�̸� �Ķ�3�� �����Ѵ�.
from employees;

select last_name, salary,
    decode(trunc(salary / 2000),  --incode decode a���� b�� �ٲٴ°�
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0.42,
    6, 0.44,
        0.45) tax_rate -- �� �������� �⺻�� 
from employees
where department_id = 80;

select decode(salary, 'a', 1) --num�� char�� �������� ���⶧���� ���� null�� ���ϵȴ�.
from employees;

select decode(salary, 'a', 1, 0) -- �⺻���� 0���� �־���. salary�� ���ڷ� ����ȯ �ؼ� ���ڳ��� ���Ѵ�.
from employees;

select decode(job_id, 1 , 1) -- char Ÿ���� ���ڷ� ��ȯó�� �Ұ����ϴ�. 
from employees;

--����: ������� ����, ������ ����� ��ȸ�϶�.
--      �⺻ ����� null �̴�.
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

select last_name, job_id, salary,   -- case�� when �ϸ� then �Ѵ�.
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

-- ����: ������� �̸�, �Ի���, �Ի������ �����Ϻ��� ���� ������ ��ȸ�϶�.
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
    
-- ����: 2005�� ������ �Ի��� ����鿡�� 100���� ��ǰ��,
--       2005�� �Ŀ� �Ի��� ����鿡�� 10���� ��ǰ���� �����Ѵ�.
--       ������� �̸�, �Ի���, ��ǰ�� �ݾ��� ��ȸ�϶�.
select last_name, hire_date,
    case when hire_date <= '2005/12/31' then '100����'
        else '10����' end gift
from employees
order by gift, hire_date;