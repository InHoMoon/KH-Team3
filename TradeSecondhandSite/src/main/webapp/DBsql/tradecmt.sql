drop table tradecmt;

create table tradecmt (
    cmtno NUMBER primary key,
    cmt_content VARCHAR2(4000),
    cmt_date DATE DEFAULT sysdate,
    tradeno NUMBER,
    cmt_depth NUMBER DEFAULT 0,
    cmt_group NUMBER,
    userno NUMBER,
    userid VARCHAR2(300)
);

drop SEQUENCE tradecmt_seq;
create SEQUENCE tradecmt_seq;