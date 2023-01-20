--����: ������� �̸�, �Ի���, �λ������� ��ȸ�϶�.
--      �λ������� �Ի��� �� 3���� �� ù��° �������̴�.
--      ��¥�� YYYY.MM.DD�� ǥ���Ѵ�.
select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
    to_char(next_day(add_months(hire_date, 3), 'monday'),'YYYY.MM.DD') review_date
from employees; 

select to_char(salary)
from employees;
-- to_char ���ڿ��� ��ȭ�����ش�.

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';
-- 99�� 6,000.00���� ������ 00�� 06,000.00�� ���缭 ���Դ�.

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual; 
-- fm�� �ʺ� �����̽��� ������ �������ش�.

select to_char(1237, 'L9999')
from dual;
-- L�� �������� ���� ���� �̱� ȭ�� ������ ���Ѵ�.

--����: <�̸�> earns <$,����> monthly but wants<&,���� x 3>. �� ��ȸ�϶�.
--      ���̾Ƹ��� ���� monthly but wants�� ����̴�.
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
--������ �������̴�. fx�� �Ἥ ������ ��Ŵ�.

select to_number('1237')
from dual;

select yo_number('1,237.12')
from dual;
-- ���ڰ� ���������� ������ ���. ���ڸ� ����

select to_number('1,237.12', '9,999.99')
from dual;
-- 99�������� ���ٴ� ����̴�.

select nvl(null,0)
from dual;
-- ù��° ���� null�̸� �⺻���� 0�� �����Ѵ�.

select job_id, nvl(commission_pct, 0)
from employees;
-- Į���� Ư¡�� ������ Ÿ���� ����.

-- ����: ������� �̸�, ����, ������ ��ȸ�϶�
select last_name, job_id, salary * 12
from employees;

-- ������ ��
select last_name, job_id, salary * (1 + nvl(commission_pct, 0)) *12 ann_sal
from employees
order by ann_sal desc;

-- ����: ������� �̸�, Ŀ�̼����� ��ȸ�϶�.
--       Ŀ�̼��� ������, No Commission�� ǥ���Ѵ�.
select last_name, nvl(to_char(commission_pct), 'No Commission')
from employees;

--sysdate, nvl�� �߿��ϴ� �� ����ؾ� �Ѵ�.

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;
-- �Ķ�1�� ���� �����ϸ� �Ķ� 2�� �����ϰ�
-- �Ķ�1�� ���� null�̸� �Ķ� 3�� �����Ѵ�.

select job_id, nvl2(commission_pct, 'SALCOMM', 0) income
from employees;

select first_name, last_name,
        nullif(length(first_name), length(last_name))
from employees;
--�̸��� ���� �ε����� ������ ���� ����.

select to_char(null), to_number(null), to_date(null)
from dual;

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees;
--�տ������� ���� ó������ null�� �ƴ� ���� �����Ѵ�.
-- �Ѵ� null�̸� �Ķ����3�� �����Ѵ�.

select last_name, salary,
    decode(trunc(salary / 2000),-- incode decode a���� b�� �ٲ�
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0.42,
    6, 0.44,
        0.45) tax_rade --�� �������� �⺻��
from employees
where department_id = 80;

select decode(salary, 'a', 1)
from employees;
--num�� char�� �������� ���� ������ ���� null�� ���ϵȴ�.

select decode(salary, 'a', 1, 0)
from employees;
--�⺻���� 0���� �־���. salart�� ���ڷ� ����ȯ �ؼ� ���ڳ��� ���Ѵ�.

select decode(job_id, 1, 1)
from employees;
--charŸ���� ���ڷ� ��ȯó���� �Ұ����ϴ�.

--����: ������� ����, ������ ����� ��ȸ�϶�.
--      �⺻ ����� null �̴�.
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

-- ����: ������� �̸�, �Ի���, �Ի������ �����Ϻ��� ���� ������ ��ȸ�϶�.
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