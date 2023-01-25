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