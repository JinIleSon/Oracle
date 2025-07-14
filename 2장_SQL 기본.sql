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
    HP char(13), // ex)010-0000-0000
    age NUMBER
);

DROP TABLE USER1;

// 실습하기 1-5

insert into user1 values ('A101', '김유신', '010-1234-1111', 25);
insert into user1 values ('A102', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);