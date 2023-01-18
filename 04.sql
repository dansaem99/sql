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