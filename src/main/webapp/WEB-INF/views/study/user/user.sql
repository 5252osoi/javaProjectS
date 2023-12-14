show tables;

create table user(
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(10)
);

desc user;

insert into user values (default, 'abc', '이이름',20,'서울');
insert into user values (default, 'zxc', '그이름',20,'서울');
insert into user values (default, 'ord', '저이름',20,'서울');
insert into user values (default, 'qwe', '에휴스',20,'서울');
insert into user values (default, 'njlol', '김남제',28,'서울');

select * from user;

delete from user where idx=8;

SELECT * FROM user WHERE name LIKE concat('%','에','%') ORDER BY idx DESC;