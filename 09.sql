drop table dept;
-- drop table은 뒤에 테이블네임을 넣어주면 삭제된다.

create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4)
);
--data definition language

create table emp (
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8, 2),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4));

insert into dept(department_id, department_name, manager_id, location_id)
values (100, 'Public Relation', 100, 1700);

insert into dept(department_id, department_name)
values(310, 'Purchasing');

select *
from dept;

commit;

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis', 'Pop',
        'Pop@gmail.com', '010-378-1278', sysdate,
        'AC_ACCOUNT', 6900, null,
        205, 110);
    
insert into emp
values(320, 'Terry', 'Benard',
        'Benard@gmail.com', '010-637-0972', '2022/07/20',
        'AD_PRES', 5000, .2,
        100, 310);
-- 복습할때 300을 310으로 바꾸기
commit;

select * from emp;

create table sa_reps (
rep_id number(6),
rep_name varchar2(25),
salary number(8, 2),
commission_pct number(2, 2)
);

insert all
    into sa_reps values(1, '최한석', 20000, .1)
    into sa_reps values(2, '한아름', 30000, .12)
select * from dual;

commit;

select * from sa_reps;

declare
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(rep_id, rep_name, salary, commission_pct)
        values (base + i, 'n' || (base+ i), base * i, i * 0.01);
    end loop;
end;
/
--declare은 /이게 끝이고 코드는 ;로 끝을 낸다.
--procedure 이름이 없기 때문에 일회용 function은 이름이 있기 때문에 재사용가능
-- 차이점은 이름이 있다, 없다 이다. 창조를 하자!!

select *
from sa_reps
where rep_id > 400;

commit;

insert into sa_reps(rep_id, rep_name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

commit;

update emp
set job_id = 'IT_PROG',
    salary = 30000
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

update emp
set salary = null
where employee_id = 300;

rollback;

select job_id, salary
from emp
where employee_id = 300;

update emp
set job_id = (select job_id
                from employees
                where employee_id = 205),
    salary = (select salary
                from employees
                where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;

select job_id, salary
from emp
where employee_id = 300;

update emp
set (job_id, salary) = (
    select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

commit;

delete dept
where department_id = 310;

select * from dept;

rollback;

select * from dept;

delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Purchasing');
    
select * from emp;

commit;
