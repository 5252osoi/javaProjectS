show tables;

create table user(
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(10)
);

desc user;

insert into user values (default, 'abc', '���̸�',20,'����');
insert into user values (default, 'zxc', '���̸�',20,'����');
insert into user values (default, 'ord', '���̸�',20,'����');
insert into user values (default, 'qwe', '���޽�',20,'����');
insert into user values (default, 'njlol', '�賲��',28,'����');

select * from user;

delete from user where idx=8;

SELECT * FROM user WHERE name LIKE concat('%','��','%') ORDER BY idx DESC;