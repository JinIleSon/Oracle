-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-12 16:25:20 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE bo_book (
    bookid   NUMBER NOT NULL,
    bookname CHAR(50),
    price    NUMBER
);

ALTER TABLE bo_book ADD CONSTRAINT book_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_book3 (
    bookid   NUMBER NOT NULL,
    bookname CHAR(50)
);

ALTER TABLE bo_book3 ADD CONSTRAINT bo_bookv1_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_customer (
    custid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20),
    address VARCHAR2(100)
);

ALTER TABLE bo_customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

CREATE TABLE bo_customer3 (
    custid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20),
    address VARCHAR2(100)
);

ALTER TABLE bo_customer3 ADD CONSTRAINT bo_customerv1_pk PRIMARY KEY ( custid );

CREATE TABLE bo_order (
    orderno   NUMBER NOT NULL,
    orderid   VARCHAR2(20),
    bookid    NUMBER,
    count     NUMBER,
    orderdate DATE
);

ALTER TABLE bo_order ADD CONSTRAINT order_pk PRIMARY KEY ( orderno );

CREATE TABLE bo_order3 (
    orderno   NUMBER NOT NULL,
    orderid   VARCHAR2(20),
    orderdate DATE
);

ALTER TABLE bo_order3 ADD CONSTRAINT bo_orderv1_pk PRIMARY KEY ( orderno );

CREATE TABLE bo_orderitem (
    orderno NUMBER NOT NULL,
    bookid  NUMBER NOT NULL,
    count   NUMBER,
    price   NUMBER
);

ALTER TABLE bo_orderitem ADD CONSTRAINT bo_order3v1_pk PRIMARY KEY ( orderno,
                                                                     bookid );

CREATE TABLE bookorder (
    orderno   NUMBER NOT NULL,
    orderdate DATE,
    custid    VARCHAR2(20),
    cname     VARCHAR2(20),
    address   VARCHAR2(100),
    bookid    NUMBER,
    bookname  VARCHAR2(100),
    count     NUMBER,
    price     NUMBER
);

ALTER TABLE bookorder ADD CONSTRAINT bookorder_pk PRIMARY KEY ( orderno );

ALTER TABLE bo_order3
    ADD CONSTRAINT bo_order3_bo_customer3_fk FOREIGN KEY ( orderid )
        REFERENCES bo_customer3 ( custid );

ALTER TABLE bo_orderitem
    ADD CONSTRAINT bo_orderitem_bo_book3_fk FOREIGN KEY ( bookid )
        REFERENCES bo_book3 ( bookid );

ALTER TABLE bo_orderitem
    ADD CONSTRAINT bo_orderitem_bo_order3_fk FOREIGN KEY ( orderno )
        REFERENCES bo_order3 ( orderno );

ALTER TABLE bo_order
    ADD CONSTRAINT order_book_fk FOREIGN KEY ( bookid )
        REFERENCES bo_book ( bookid );

ALTER TABLE bo_order
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( orderid )
        REFERENCES bo_customer ( custid );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
