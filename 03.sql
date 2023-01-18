-- single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;
-- �ҹ��ڷθ� ���´�. ���ڿ��� �ҹ��ڷ� ��ȯ

select upper('SQL Course')
from dual;
-- �빮�ڷθ� ���´�.���ڿ��� �빮�ڷ� ��ȯ

select initcap('SQL Course')
from dual;
--ù ���ڸ� �빮�� ������ �ҹ���

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';
-- ���ڿ��� �� �� �ҹ��ڷ� �ٲپ� ��Ī�ؾ��Ѵ�.

select concat('Hello', 'World')
from dual;
--concat�� ������ || ������ �ϹǷ� ��¹����� ��+�̸��� ������ ���â�� �ε�ȴ�.

select substr('HelloWorld', 2, 5)
from dual;
-- 2 ~ 5��° �ִ� ���ڱ��� �����Ѵ�.

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;
-- �ټ� �������� �˷��ش�.

select instr('Hello', 'l')
from dual;
-- Hello �� l�� � �ֳ� ������� 3�� �����ߴ�.

select instr('Hello', 'w')
from dual;
-- w�� ���� 0�� �����ߴ�.

select lpad(salary, 5, '*')
from employees;
--�������� ������ �ټ��ڸ��� ����� ���ڸ��� ���� ä���.

select rpad(salary, 5, '*')
from employees;
--���������� ä���

select replace('JACK and JUE', 'J', 'BL')
from dual;

select trim('H' from 'Hello')
from dual;
-- trim�� ���ڸ� ���ش�.

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;
-- space�� �������.

--����: �� query���� ' '�� trim ������, ������ Ȯ���� �� �ְ� ��ȸ�϶�.
select '|' || trim('' , from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

-- ����: �� query����, where ���� like�� refactoring �϶�.

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

--����: �̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�.
--      �̸��� ù���ڴ� �빮��, �������� �ҹ��ڷ� ����Ѵ�.
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

--����: ������� �̸�, ����, 15.5% �λ�� ����(New Salary, ����), �λ��(Increase)�� ��ȸ�϶�.
select last_name, salary,
     round(salary * 1.155) "New Salary",
     round(salary * 1.155) - salary "Increase"
from employees;

select sysdate
from dual;
-- ���� ��¥�� ���´�.

select sysdate + 1
from dual;
-- ��¥�� ���Ҽ����ִ�.

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;
--90�� ������� �̾� ���� ��¥ - �Ի��� = �ټ��� ���ߴ�.

select months_between('2023/12/31', '2022/12/31')
from dual;

select add_months('2023/01/18', 3)
from dual;
-- 3���� ��

select next_day('2023/01/18', 4)
from dual;
-- 4�� �������� ���ϰ� �� ������ �������� ���Ѵ�.

select next_day('2023/01/18', 'thursday')
from dual;

select next_day('2023/01/18', 'thu')
from dual;

select last_day('2023/01/18')
from dual;

-- ����: 20�� �̻� ������ ������� �̸�, ù�������� ��ȸ�϶�.
--      ������ �ſ� ���Ͽ� �����մϴ�.
select  last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

--����: ������� �̸�, ���� �׷����� ��ȸ�϶�.
--      �׷����� 1000�� *�ϳ��� ǥ���Ѵ�.
select last_name, salary, rpad('*' , salary / 1000, '*')
from employees;
-- ������ ��
select last_name, salary, rpad(' ' , salary / 1000 + 1, '*')
from employees
order by sal desc;