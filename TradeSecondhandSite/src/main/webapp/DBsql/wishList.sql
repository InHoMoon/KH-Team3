-- 관심상품 테이블 생성
create table wishlist (
    wishlistno     number          not null,
    userno      number          not null,
    tradeno     number          not null,
    imgno       number          not null,
    userid      varchar2(50)    not null,
    addDate     date            default sysdate,
    primary key(wishlistno, userno)
);

-- 관심상품 시퀀스 생성
create sequence wishlist_seq;

DROP TABLE wishlist;
DROP SEQUENCE wishlist_seq;

-- user 테이블 연결
alter table wishlist
    add constraint wishlist_userno foreign key(userno)
    references tuser(userno);

-- trade 테이블 연결
alter table wishlist
    add constraint wishlist_tradeno foreign key(tradeno)
    references trade(tradeno);
    
-- trade 테이블 연결
alter table wishlist
    add constraint wishlist_imgno foreign key(imgno)
    references tradeimg(imgno);

commit;

select * FROM wishlist;

-- 관심상품 추가
INSERT INTO wishlist (wishlistno, userno, tradeno, imgno, userid, addDate) VALUES (wishlist_seq.nextval, 2, 792, 2, 'id2', '22-10-18');

-- 관심상품 조회
select
      row_number() over(order by w.wishlistno desc) as num,
      w.wishlistno, w.userno, w.tradeno, i.imgno,
      w.userid, w.addDate, t.title, t.price, t.sale_State
      from wishlist w inner join trade t
      on w.tradeno = t.tradeno
      inner join tradeimg i
      on w.imgno = i.imgno
where w.userid = 'id2';