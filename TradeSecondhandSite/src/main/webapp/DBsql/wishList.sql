-- ���ɻ�ǰ ���̺� ����
create table wishlist (
    wishlistno     number          not null,
    userno      number          not null,
    tradeno     number          not null,
    imgno       number          not null,
    userid      varchar2(50)    not null,
    addDate     date            default sysdate,
    primary key(wishlistno, userno)
);

-- ���ɻ�ǰ ������ ����
create sequence wishlist_seq;

DROP TABLE wishlist;
DROP SEQUENCE wishlist_seq;

-- user ���̺� ����
alter table wishlist
    add constraint wishlist_userno foreign key(userno)
    references tuser(userno);

-- trade ���̺� ����
alter table wishlist
    add constraint wishlist_tradeno foreign key(tradeno)
    references trade(tradeno);
    
-- trade ���̺� ����
alter table wishlist
    add constraint wishlist_imgno foreign key(imgno)
    references tradeimg(imgno);

commit;

select * FROM wishlist;

-- ���ɻ�ǰ �߰�
INSERT INTO wishlist (wishlistno, userno, tradeno, imgno, userid, addDate) VALUES (wishlist_seq.nextval, 2, 792, 2, 'id2', '22-10-18');

-- ���ɻ�ǰ ��ȸ
select
      row_number() over(order by w.wishlistno desc) as num,
      w.wishlistno, w.userno, w.tradeno, i.imgno,
      w.userid, w.addDate, t.title, t.price, t.sale_State
      from wishlist w inner join trade t
      on w.tradeno = t.tradeno
      inner join tradeimg i
      on w.imgno = i.imgno
where w.userid = 'id2';