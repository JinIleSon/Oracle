/*
    날짜 : 2025/08/12
    이름 : 손진일
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1. 트랜잭션 커밋
select * from account;

update account set 
                  acc_balance = acc_balance - 10000 
                  where acc_no = '101-11-1001';

update account set 
                  acc_balance = acc_balance + 10000 
                  where acc_no = '101-11-1003';

commit;
select * from account;

-- 실습 8-2. 트랜잭션 롤백
select * from account;

update account set 
                  acc_balance = acc_balance - 10000 
                  where acc_no = '101-11-1001';

update account set 
                  acc_balance = acc_balance + 10000 
                  where acc_no = '101-11-1003';

select * from account;

rollback;
select * from account;

-- 실습 8-3
show autocommit;

set autocommit on;

update account set 
                  acc_balance = acc_balance - 10000 
                  where acc_no = '101-11-1001';

update account set 
                  acc_balance = acc_balance + 10000 
                  where acc_no = '101-11-1003';

select * from account;