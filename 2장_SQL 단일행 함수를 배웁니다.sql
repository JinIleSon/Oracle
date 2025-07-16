select ename, initcap(ename) "INITCAP"
from emp
where deptno = 10;

select name, initcap(name) "INITCAP"
from professor
where deptno = 101;

select ename, lower(ename) "LOWER", upper(ename) "UPPER"
from emp
where deptno = 10;

select ename, length(ename) "LENGTH", lengthb(ename) "LENGTH"
from emp
where deptno = 20;

select '서진수' "NAME", length('서진수') "LENGTH", -- length는 아시아 글자도 한 글자로 침
                       lengthb('서진수') "LENGTHB" from dual; -- lengthb는 멀티바이트 문자 시 글자 전부 셈
                       
set verify off -- 불필요한 변수 대입을 없앰
select ename, length(ename)
from emp
where length(ename) > length('&name');

select concat(ename, job)
from emp
where deptno=10;

-- 3,2라고 적힌 열을 A(문자형) 6자리 너비로
col "3,2" for a6    
col "-3,2" for a6
col "-3,4" for a6

select substr('abcde',3,2) "3,2",
       substr('abcde',-3,2) "-3,2",
       substr('abcde',-3,4) "-3,4"
from dual;

select name, substr(jumin,3,4) "Birthday",
             substr(jumin,3,4) -1 "Birthday - 1"
from student
where deptno1 = 101;

select '서진수' "NAME", substr('서진수', 1,2) "SUBSTR",
       substrb('서진수',1,3) "SUBSTRB"
       from dual;
       
select 'A-B-C-D', instr('A-B-C-D', '-', 1, 3) "INSTR" from dual;
select 'A-B-C-D', instr('A-B-C-D', '-', 3, 1) "INSTR" from dual;
select 'A-B-C-D', instr('A-B-C-D', '-', -1, 3) "INSTR" from dual;

select 'A-B-C-D', instr('A-B-C-D', '-', -1, 3) "INSTR" from dual;
select 'A-B-C-D', instr('A-B-C-D', '-', -6, 2) "INSTR" from dual;
select name, tel, instr(tel, ')')
from student
where deptno1 = 201;

select name, tel, instr(tel, '3')
from student
where deptno1 = 101;

col name for a20;
col id for a10;
col lpad(id,10,'*') for a20;
select name, id, lpad(id,10,'*')
from student
where deptno1 = 201;

select rpad(ename,10,'-') "RPAD"
from emp
where deptno = 10;

select ename from emp where deptno = 10;
select ltrim(ename, 'C')
from emp
where deptno = 10;

select ename, rtrim(ename, 'R') "RTRIM"
from emp
where deptno = 10;

select ename, replace(ename, substr(ename, 1,2), '**') "REPLACE"
from emp
where deptno = 10;

select round(987.654,2) "ROUND1",
round(987.654,0) "ROUND2",
round(987.654,-1) "ROUND3"
from dual;

-- TRUNC()는 소수점을 버리는 용도
select trunc(987.654,2) "TRUNC1",
       trunc(987.654,0) "TRUNC2",
       trunc(987.654,-1) "TRUNC3"
from dual;

-- MOD는 나머지 나눗셈
select MOD(121,10) "MOD",
       CEIL(123.45) "CEIL",
       FLOOR(123.45) "FLOOR"
from dual;