/*
    날짜 : 2025/07/17
    이름 : 손진일
    내용 : 5장 데이터베이스 객체
*/

-- 워크북 p13
-- 실습하기 3-1
select * from dictionary;

select table_name from user_tables;
select owner, table_name from all_tables;
select * from dba_tables;
select * from dba_users;

select instance_name, status, database_status, host_name from V$INSTANCE;

-- 실습하기 3-2
select * from user_indexes;
select * from user_ind_columns;

-- 실습하기 3-3
create index idx_user1_id on USER1(USER_ID);
select * from user_ind_columns;

drop index idx_user1_id;
select * from user_ind_columns;

-- 실습하기 3-6
create view VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
create view VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE < 30);
select * from user_views;

-- 실습하기 3-7. 뷰 조회
select * from VW_USER1;
select * from VW_USER2_AGE_UNDER30;

-- 실습하기 3-8. 뷰 삭제
drop view VW_USER1;
drop view VW_USER2_AGE_UNDER30;

-- 실습하기 3-9. 시퀀스 적용 테이블 생성
create table USER6 (
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    GENDER CHAR(1),
    AGE NUMBER,
    ADDR VARCHAR2(255)
);

-- 실습하기 3-10. 시퀀스 생성
create SEQUENCE SEQ_USER6 increment by 1 start with 1;

-- 실습하기 3-11. 시퀀스값 입력
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김유신', 'M', 25, '김해시');
insert into USER6 values (SEQ_USER6.NEXTVAL, '김춘추', 'M', 23, '경주시');
insert into USER6 values (SEQ_USER6.NEXTVAL, '신사임당', 'F', 27, '강릉시');

select * from user6;
drop SEQUENCE SEQ_USER6;
drop table user6;

-- 실습하기 4-1
// Oracle에서 내부 스크립트 실행이나 일반 사용자 생성을 가능하게 하기 위한 세션 설정
alter session set "_ORACLE_SCRIPT"=true; 
// 1234 비밀번호로 test1 유저 생성
create user test1 identified by 1234; 

-- 실습하기 4-2
// 전체 사용자 조회
select * from all_users;

// 특정 사용자 조회
select * from all_users where username='test1';

-- 실습하기 4-3. 사용자 변경(SYSTEM 접속)
// 사용자 비밀번호 변경
ALTER USER test1 identified by 1111;

// 사용자 삭제
drop user test1;

-- 실습하기 4-4. Role 부여
// 접속 및 생성 권한 부여
grant connect, resource to test1;

// 테이블 스페이스(테이블 파일 생성 공간) 할당량 권한 부여
grant unlimited tablespace to test1;
