/*
   날짜 : 2025/07/14
   이름 : 손진일
   내용 : 2장 SQL 기본
*/

-- 실습 1-2. NUMBER 자료형 이해
CREATE TABLe TYPE_TEST_NUMBER (
    num1 number,
    num2 number(2),
    num3 number(3,1),
    num4 number(4,2),
    num5 number(5,6),
    num6 number(6,-1)
);

//num1 NUMBER
insert into TYPE_TEST_NUMBER (num1) values (1);
insert into TYPE_TEST_NUMBER (num1) values (123);
insert into TYPE_TEST_NUMBER (num1) values (123.74);
insert into TYPE_TEST_NUMBER (num1) values (123.12345);

//num2 NUMBER(2)
insert into TYPE_TEST_NUMBER (num2) values (12);
insert into TYPE_TEST_NUMBER (num2) values (123);
insert into TYPE_TEST_NUMBER (num2) values (1.2);
insert into TYPE_TEST_NUMBER (num2) values (1.23);
insert into TYPE_TEST_NUMBER (num2) values (12.34567);
insert into TYPE_TEST_NUMBER (num2) values (12.56789);
insert into TYPE_TEST_NUMBER (num2) values (123.56789);

//num3 NUMBER(3,1)
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (123);
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);
insert into TYPE_TEST_NUMBER (num3) values (123.56789);

// 실습하기 1-3. 문자형 자료형 이해

create table type_test_char (
    char1 char(1),
    char2 char(2),
    char3 char(3),
    vchar1 varchar2(1),
    vchar2 varchar2(2),
    vchar3 varchar2(3),
    nvchar1 nvarchar2(1),
    nvchar2 nvarchar2(1),
    nvchar3 nvarchar2(3)
);

//CHAR
insert into type_test_char (char1) values ('A');
insert into type_test_Char (char1) values ('가');

//VARCHAR2
insert into type_test_char (vchar1) values ('A');
insert into type_test_char (vchar2) values ('AB');
insert into type_test_char (vchar3) values ('가');

//NVARCHAR2
insert into type_test_char (nvchar1) values ('A');
insert into type_test_char (nvchar1) values ('AB');
insert into type_test_char (nvchar1) values ('가나다');

// 실습하기 1-4. 테이블 생성
create table USER1 (
    user_id varchar2(20),
    name varchar2(20),
    HP char(13),
    age NUMBER
);

DROP TABLE USER1;

// 실습하기 1-5

insert into user1 values ('A101', '김유신', '010-1234-1111', 25);
insert into user1 values ('A102', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);
insert into user1 (user_id, name, age) values ('A104', '강감찬', 45);
insert into user1 (user_id, name, hp) values ('A105', '이순신', '010-1234-5555');

// 실습하기 1-6
select * from user1;
select * from user1 where user_id = 'A101';
select * from user1 where name = '김춘추';
select * from user1 where age > 30;
select user_id, name, age from user1;

// 실습하기 1-7
update user1 set hp='010-1234-4444' where user_id = 'A104';
update user1 set age=51 where user_id = 'A105';
update user1 set hp = '010-1234-1001', age = 27 where user_id = 'A101';

// 실습하기 1-8
delete from user1 where user_id = 'A101';
delete from user1 where user_id = 'A102' and age = 25;
delete from user1 where age >= 30;

---------------------------
// 2. 제약 조건
---------------------------

-- 실습하기 2-1
create table user2 (
    user_id varchar2(20) primary key,
    name varchar2(20),
    hp char(13),
    age number(2)
);

-- primary key(기본키) 컬럼은 중복허용을 하지 않음
insert into user2 values ('A101', '김유신', '010-1234-1111', 23);
insert into user2 values ('A102', '김춘추', '010-1234-2222', 21);

// 실습하기 2-2
create table user3 (
    user_id     varchar2(20) primary key,
    name        varchar2(20),
    hp          char(13) unique,
    age         number(3)
);

insert into user3 values ('a101', '김유신', '010-1234-1001', 23);
insert into user3 values ('a102', '김유신', '010-1234-1002', 23);


// 실습하기 2-3
create table parent (
    pid varchar2(20) primary key,
    name varchar2(20),
    hp char(13) unique
);

create table child (
    cid varchar2(20) primary key,
    name varchar2(20),
    hp char(13) unique,
    parent varchar(20),
    foreign key (parent) references parent (pid)
);

insert into parent values ('P101', '김서현', '010-1234-1001');
insert into parent values ('P102', '이성계', '010-1234-1002');
insert into parent values ('P103', '신사임당', '010-1234-1003');

insert into child values ('C101', '김유신', '010-1234-2001', 'P101');
insert into child values ('C102', '이방우', '010-1234-2002', 'P102');
insert into child values ('C103', '이방원', '010-1234-2003', 'P102');
insert into child values ('C104', '이이', '010-1234-2004', 'P103');
-- 부모 테이블에 p105에 해당하는 값이 없기 때문에 참조 무결성 제약조건 위배
insert into child values ('C105', '김철수', '010-1234-2005', 'P105');

create table user4 (
    name       varchar2(20) not null,
    gender      char(1) not null,
    age         int default 1,
    addr varchar2(255)
);

insert into user4 values ('김유신', 'M', 23, '김해시');
insert into user4 values ('김춘추', 'M', 21, '경주시');
insert into user4 (name, gender, addr) values ('신사임당', 'F', '강릉시');
insert into user4 (name, gender) values ('이순신', 'M');
insert into user4 (name, age) values ('정약용', 33); -- 성별은 NOT NULL(반드시 입력)이기 때문에 해당 쿼리 에러