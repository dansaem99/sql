select tname
from tab;



create table depts(
department_id number(3) constraint depts_deptid_pk primary key,
department_name varchar2(20));

desc user_constraints

select constraint_name, constraint_type, table_name
from user_constraints;

create table emps(
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empname_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3),
constraint emps_email_uk unique(email),
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));
/* foreign key = 어떤 릴레이션에 소속된 속성 또는 속성 집합이
                 다른 릴레이션의 기본키가 되는 키다
   primary key = 레코드 또는 투플(tuple)을 확인하기 위해 이용되는 
                 속성값으로 하나의 레코드 또는 투플을 하나의 
                 뜻으로 확인하기 위해 이용되는 키를 기본 키라고 한다
    pk = not null + unique
*/
select constraint_name, constraint_type, table_name
from user_constraints;

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000,100);
--insert into emps values(501, 'a', 'musk@gmail.net', 2000, 100);

drop table emps cascade constraints;

select constraint_name, constraint_type, table_name
from user_constraints;

select * from depts;

grant all on hr.departments to you;

drop table employees cascade constraints;
create table employees(
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                    constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6)constraint emp_managerid_fk references employees(employee_id),
deparmtent_id number(4) constraint emp_dept_fk references hr.departments(department_id));

drop table gu;
drop table dong;
drop table dong2;

create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);

create table dong(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade);

create table dong2(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼상동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

insert into dong2
select * from dong;

delete gu
where gu_id = 100;

select * from dong;
select * from dong2;

commit;

create table a(
aid number(1) constraint a_aid_pk primary key);

create table b (
bid number(2),
aid number(1),
constraint b_aid_fik foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(32, 9);

alter table b disable constraint b_aid_fik;

alter table b enable constraint b_aid_fik;
alter table b enable novalidate constraint b_aid_fik;

insert into b values(33, 8);

create table sub_departments as
    select department_id dept_id, department_name dept_name
    from hr.departments;

select * from sub_departments;

create table users(
user_id number(3));
desc users

alter table users add(user_name varchar2(10));
desc users

alter table users modify(user_name number(7));
desc users

alter table users drop column user_name;
desc users

insert into users values(1);

alter table users read only;
insert into users values(2);

alter table users read write;
insert into users values(2);

commit;