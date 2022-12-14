drop table trade;

create table trade (
    tradeno NUMBER primary key,
    title VARCHAR2(500),
    userid VARCHAR2(200),
    content VARCHAR2(4000),
    hit NUMBER,
    insert_date DATE DEFAULT sysdate,
    price NUMBER,
    product_state VARCHAR2(200),
    sale_state VARCHAR2(200),
    category VARCHAR2(200),
    userphone VARCHAR2(200)
);

drop SEQUENCE trade_seq;
create SEQUENCE trade_seq;

select * from trade;
