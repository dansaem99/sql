select avg(salary), max(salary), min(salary), sum(salary)
--avg �����ϴ°� 1����.
from employees;
--avg �ش� �÷� ���鿡 ���� ����� ���ϴ� �Լ�

select min(hire_date), max(hire_date)
from employees;

-- ����: �ִ���ް� �ּҿ����� ������ ��ȸ�϶�.
select max(salary) - min(salary)
from employees;

select count(*)
from employees;
--row ������ ����

-- ���� : 70�� �μ����� ����� �� ��ȸ�϶�.
select count(department_id) --select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;

select avg(commission_pct)
from employees;
--��������� commission ���

--����: ������ ��� Ŀ�̼����� ��ȸ�϶�.
select avg(nvl(commission_pct,0))
from employees;

select avg(all salary)
from employees;

select avg(distinct salary)
from employees;

--���� : ������ ��ġ�� �μ� ������ ��ȸ�϶�.
select count(distinct department_id)
from employees;

--����: �ų��� ���� ��ȸ�϶�.
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

--����:������ ������� ��ȸ�϶�.
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
--������ ���� �Ӵ뿵

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

--����: �Ŵ���ID, �Ŵ����� ���� ������ �� �ּ� ������ ��ȸ�϶�.
--      �ּ� ������ $6,000 �ʰ������Ѵ�.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

select max(avg(salary))
from employees
group by department_id;
--avg(salary) �̰� group by�� ������ �������.

select sum(max(avg(salary)))
from employees
group by department_id;
--group�� 2�ܰ������ �� �� �ִ�. ()1(())2

select department_id, round(avg(salary))
from employees
group by department_id;
--round�� ������ ��������. 12�� ����

select department_id, round(avg(salary))
from employees;
--group by department_id; �̰� ������ �������.

-- 2�������� �����ؼ� Ǯ���
--����: 2001��, 2002��, 2003�⵵�� �Ի��� ���� ��ȸ�϶�.
select to_char(hire_date,'YYYY'), count(*)
from employees
where to_char(hire_date, 'YYYY') = '2001' or
      to_char(hire_date, 'YYYY') = '2002' or
      to_char(hire_date, 'YYYY') = '2003'
group by to_char(hire_date, 'YYYY')
order by to_char(hire_date, 'YYYY');

-- ������ �� 1��
select to_char(hire_date,'YYYY') hire_year, count(*) emp_cnt
from employees
where to_char(hire_date, 'YYYY') in (2001, 2002, 2003)
group by to_char(hire_date, 'YYYY')
order by hire_year;

-- ������ �� 2��
select sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

-- ������ �� 3��
select count(case when hire_date like '2001%' then 1 else null end) "2001",
    count(case when hire_date like '2002%' then 1 else null end) "2002",
    count(case when hire_date like '2003%' then 1 else null end) "2003"
from employees;

-- ����: ������, �μ��� �������� ��ȸ�϶�.
--       �μ��� 20, 50, 80�̴�.
select job_id, sum(case when department_id = 20 then salary end) "20",
                sum(case when department_id = 50 then salary end) "50",
                sum(case when department_id = 80 then salary end) "80"
from employees
where department_id in(20, 50, 80)
group by department_id, job_id
order by department_id;
-- �����Դ�
select job_id, sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80"
from employees
group by job_id;