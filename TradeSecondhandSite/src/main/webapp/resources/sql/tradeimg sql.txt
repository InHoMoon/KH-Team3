drop table tradeimg;

create table tradeimg(
    imgno NUMBER primary key,
    originname VARCHAR2(400),
    storedname VARCHAR2(400),
    imgsize number,
    tradeno number
);

drop SEQUENCE tradeimg_seq;
create SEQUENCE tradeimg_seq;