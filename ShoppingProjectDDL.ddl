-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 15:44:53 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cart (
    cartno        INTEGER NOT NULL,
    userid        VARCHAR2(20) NOT NULL,
    prodno        NUMBER(6) NOT NULL,
    cartprodcount INTEGER DEFAULT 1,
    cartproddate  DATE NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartno );

CREATE TABLE category (
    cateno   NUMBER(2) NOT NULL,
    catename VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( cateno );

CREATE TABLE orders (
    orderno         CHAR(11 BYTE) NOT NULL,
    userid          VARCHAR2(20) NOT NULL,
    ordertotalprice INTEGER NOT NULL,
    orderaddress    VARCHAR2(200 BYTE) NOT NULL,
    orderstatus     INTEGER DEFAULT 0,
    orderdate       DATE NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE ordersitem (
    itemno       INTEGER,
    orderno      CHAR(11 BYTE) NOT NULL,
    prodno       NUMBER(6) NOT NULL,
    itemprice    INTEGER NOT NULL,
    itemdiscount INTEGER NOT NULL,
    itemcount    INTEGER DEFAULT 1
);
ALTER TABLE PRODUCT MODIFY (PRODNAME VARCHAR2(50 BYTE));
CREATE TABLE point (
    pointno   INTEGER NOT NULL,
    userid    VARCHAR2(20) NOT NULL,
    point     INTEGER NOT NULL,
    "desc"    VARCHAR2(100 BYTE) NOT NULL,
    pointdate DATE NOT NULL
);

ALTER TABLE point ADD CONSTRAINT point_pk PRIMARY KEY ( pointno );

CREATE TABLE product (
    prodno       NUMBER(6) NOT NULL,
    cateno       NUMBER(2) NOT NULL,
    sellerno     NUMBER(5),
    prodname     NVARCHAR2(20) NOT NULL,
    prodprice    INTEGER NOT NULL,
    prodstock    INTEGER DEFAULT 0,
    prodsold     INTEGER DEFAULT 0,
    proddiscount INTEGER DEFAULT 0
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

CREATE TABLE seller (
    sellerno NUMBER(5) NOT NULL,
    company  VARCHAR2(100 BYTE) NOT NULL,
    tel      VARCHAR2(20 CHAR) NOT NULL,
    manager  VARCHAR2(20 BYTE) NOT NULL,
    address  VARCHAR2(100) NOT NULL
);

ALTER TABLE seller ADD CONSTRAINT seller_pk PRIMARY KEY ( sellerno );

CREATE TABLE "User" (
    userid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    birth   CHAR(10 BYTE) NOT NULL,
    gender  CHAR(1 BYTE) NOT NULL,
    hp      CHAR(13 BYTE) NOT NULL,
    email   VARCHAR2(100 BYTE),
    point   INTEGER DEFAULT 0,
    "level" INTEGER DEFAULT 1,
    address VARCHAR2(100 BYTE),
    regdate DATE NOT NULL
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( userid );

ALTER TABLE "User" ADD CONSTRAINT user__un UNIQUE ( hp,
                                                    email );

ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE cart
    ADD CONSTRAINT cart_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE point
    ADD CONSTRAINT point_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE product
    ADD CONSTRAINT product_category_fk FOREIGN KEY ( cateno )
        REFERENCES category ( cateno );

ALTER TABLE product
    ADD CONSTRAINT product_seller_fk FOREIGN KEY ( sellerno )
        REFERENCES seller ( sellerno );

CREATE SEQUENCE cart_cartno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cart_cartno_trg BEFORE
    INSERT ON cart
    FOR EACH ROW
    WHEN ( new.cartno IS NULL )
BEGIN
    :new.cartno := cart_cartno_seq.nextval;
END;
/

CREATE SEQUENCE ordersitem_itemno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ordersitem_itemno_trg BEFORE
    INSERT ON ordersitem
    FOR EACH ROW
    WHEN ( new.itemno IS NULL )
BEGIN
    :new.itemno := ordersitem_itemno_seq.nextval;
END;
/

CREATE SEQUENCE point_pointno_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER point_pointno_trg BEFORE
    INSERT ON point
    FOR EACH ROW
    WHEN ( new.pointno IS NULL )
BEGIN
    :new.pointno := point_pointno_seq.nextval;
END;
/

-- User
insert into "User" values ('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 7000, 1, '서울', '2022-01-10
10:50:12');
insert into "User" values ('user2', '계백', '1975-06-11', 'M', '010-1102-1975', '-', 5650, 1, '서울', '2022-01-10
10:50:12');
insert into "User" values ('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', '-', 4320, 2, '서울', '2022-01-10
10:50:12');
insert into "User" values ('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 0, 1, '서울', '2022-01-10
10:50:12');
insert into "User" values ('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 3000, 4, '대전', '2022-01-10
10:50:12');
insert into "User" values ('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 15840, 2, '대전', '2022-01-10
10:50:12');
insert into "User" values ('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 3610, 0, '대구', '2022-01-10
10:50:12');
insert into "User" values ('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 0, 1, '대구', '2022-01-10
10:50:12');
insert into "User" values ('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 0, 3, '부산', '2022-01-10
10:50:12');
insert into "User" values ('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', '-', 0, 3, '광주', '2022-01-10
10:50:12');

-- Point
insert into point(userId, point, "desc", pointDate) values('user1', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user1', 6000, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user3', 2820, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user5', 3000, '이벤트 응모 3000 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user2', 2650, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12');
insert into point(userId, point, "desc", pointDate) values('user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');

-- Seller
insert into seller values(10001, '(주)다팔아', '02-201-1976', '정우성', '서울');
insert into seller values(10002, '판매의민족', '02-102-1975', '이정재', '서울');
insert into seller values(10003, '멋남', '031-103-1989', '원빈', '경기');
insert into seller values(10004, '스타일살아', '032-201-1979', '이나영', '경기');
insert into seller values(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울');
insert into seller values(10006, '복실이옷짱', '051-301-1979', '고소영', '부산');
insert into seller values(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구');
insert into seller values(10008, '(주)LG전자', '02-511-1965', '강호동', '서울');
insert into seller values(10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산');
insert into seller values(10010, '누리푸드', '051-710-1992', '강동원', '부산');

-- Category
insert into category values(10, '여성의류패션');
insert into category values(11, '남성의류패션');
insert into category values(12, '식품·생필품');
insert into category values(13, '취미·반려견');
insert into category values(14, '홈·문구');
insert into category values(15, '자동차·공구');
insert into category values(16, '스포츠·건강');
insert into category values(17, '컴퓨터·가전·디지털');
insert into category values(18, '여행');
insert into category values(19, '도서');

-- Product
insert into product values(100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20);
insert into product values(100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15);
insert into product values(110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5);
insert into product values(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', 0, 150000, 87, 15);
insert into product values(120103, 12, 10010, '바로구이 부채살 250g', 0, 21000, 61, 10);
insert into product values(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0);
insert into product values(130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0);
insert into product values(141001, 14, 10001, '라떼 2인 소파/방수 패브릭', 0, 320000, 42, 0);
insert into product values(170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12);
insert into product values(160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0);

-- Orders
insert into orders values('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12');
insert into orders values('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12');
insert into orders values('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12');
insert into orders values('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12');
insert into orders values('22010310100', 'user1', 12000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12');
insert into orders values('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12');
insert into orders values('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12');
insert into orders values('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2022-01-10 10:50:12');
insert into orders values('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-01-10 10:50:12');
insert into orders values('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');

-- OrdersItem
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010210001', 100110, 38000, 15, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010210001', 100101, 25000, 20, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010210002', 120103, 21000, 10, 3);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010310001', 130112, 15000, 0, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010310001', 130101, 56000, 0, 2);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010210010', 110101, 76000, 5, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010310100', 160103, 120000, 0, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010410101', 170115, 900000, 12, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010510021', 110101, 76000, 5, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010510027', 130101, 56000, 0, 2);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010510021', 100101, 25000, 20, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010510031', 170115, 900000, 12, 1);
insert into ordersitem(orderno, prodno, itemprice, itemdiscount, itemcount) values('22010710110', 120103, 21000, 10, 5);

-- Cart
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user1', 100101, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user1', 100110, 2, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user3', 120103, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user4', 130112, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user5', 130101, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user2', 110101, 3, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user2', 160103, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user2', 170115, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user3', 110101, 1, '2022-01-10 10:50:12');
insert into cart(userid, prodno, cartprodcount, cartproddate) values('user6', 130101, 1, '2022-01-10 10:50:12');

-- 문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
select u.name, p.prodName, c.cartprodcount
      from cart c join product p
      on c.prodno = p.prodno
      join "User" u
      on u.userid = c.userid
      where c.cartprodcount >= 2;

-- 문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
select p.prodno, c.catename, p.prodname, p.prodprice, s.manager, s.tel
      from product p join cart c
      on p.prodno = c.prodno
      join seller s
      on s.sellerno = p.sellerno
      join category c
      on c.cateno = p.cateno;
      
-- 문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
select u.userid, u.name, u.hp, u.point, NVL(u.point + sum(p.point),0)
      from "User" u left join point p
      on u.userid = p.userid
      group by u.userid, u.name, u.hp, u.point;
      
-- 문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오.
--       단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
select o.orderno, o.userid, u.name, o.ordertotalprice, o.orderdate
      from orders o join "User" u
      on u.userid = o.userid
      where o.ordertotalprice >= 10
      order by o.ordertotalprice desc, u.name asc;
      
-- 문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 주문번호는 중복없이 상품명은 구분자 ,로 나열할것
select o.orderno, o.userid, u.name, 
      LISTAGG(p.prodname, ',') within group(order by p.prodname), 
      o.orderdate
      from orders o join "User" u
      on u.userid = o.userid
      join ordersitem i
      on i.orderno = o.orderno
      join product p
      on p.prodno = i.prodno
      group by o.orderno, o.userid, u.name, o.orderdate;
      
-- 문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
select prodno, prodname, prodprice, proddiscount,
      case
        when prodprice = 0 or proddiscount = 0 then 0
        else round(prodprice - prodprice*proddiscount/100, 0)
      end as "할인된 가격"
      from product;

-- 문제7. 고소영 판매자가 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오.
select p.prodno, p.prodname, p.prodprice, p.prodstock, s.manager
      from product p join seller s
      on p.sellerno = s.sellerno
      where s.manager = '고소영';

-- 문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회하시오.
select s.sellerno, company, manager, tel
      from seller s left join product p
      on s.sellerno = p.sellerno
      where prodno is null;
      
--문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고 그 가격으로
--       주문별 총합을 구해서 주문별 총합이 10만원이상 그리고 큰 금액 순으로 주문번호, 최종총합을 조회하시오. 
select orderno,
       sum(할인가 * itemcount)
       from ( select
       orderno,
       itemcount,
       itemprice * ((100-itemdiscount)/100) as 할인가
       from ordersitem
       ) 
       group by orderno
       having sum(할인가 * itemcount) >= 100000
       order by sum(할인가 * itemcount) desc;
       
-- 문제10. 장보고 고객이 주문했던 모든 상품명을 `고객명`, `상품명`으로 조회하시오.
-- 단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
select u.name 고객명, 
       listagg(distinct p.prodname, ',') within group(order by p.prodname) 상품명
       from orders o join "User" u
       on o.userid = u.userid
       join ordersitem i
       on i.orderno = o.orderno
       join product p
       on i.prodno = p.prodno
       where u.name = '장보고'
       group by u.name;
       