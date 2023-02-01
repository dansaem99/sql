drop user hr2 cascade;

create user hr2 identified by hr2 default tablespace users;
grant connect, resource to hr2;

create table hr2.users(
    user_id number(2),
    user_name varchar2(12),
    reg_date date);
    
create table hr2.addresses (
    user_id number(2),
    address varchar2(30));
    
create table hr2.posts (
    post_id number(3),
    post_title varchar2(60),
    post_content varchar2(120),
    user_id number(2));
    
alter table hr2.users
    add constraint user_userid_pk primary key(user_id);
alter table hr2.addresses
    add constraint addr_userid_pk primary key(user_id);
alter table hr2.posts
    add constraint post_postid_pk primary key(post_id);
    
alter table hr2.addresses
    add constraint addr_userid_fk foreign key(user_id)
    references hr2.users(user_id);
alter table hr2.posts
    add constraint post_userid_fk foreign key(user_id)
    references hr2.users(user_id);
    
insert into hr2.users
    values(1, 'john', to_date('2023-01-26', 'yyyy-mm-dd'));
insert into hr2.users
    values(2, 'terry', to_date('2023-01-27', 'yyyy-mm-dd'));
    
insert into hr2.addresses
    values(1, '서울시 마포구');
insert into hr2.addresses
    values(2, '성남시 분당구');
    
insert into hr2.posts
    values(101, '사랑', '너와 나의 연결고리', 1);
insert into hr2.posts
    values(102, '정의', '너와 나의 연대고리', 1);
insert into hr2.posts
    values(201, '김치', '네가 있어야 밥을 먹지.', 2);
insert into hr2.posts
    values(202, '비빔밥', '동학농민항쟁이 만든 음식이다.', 2);
insert into hr2.posts
    values(203, '찹쌀떡', '네가 그리워.', 2);
    
commit;