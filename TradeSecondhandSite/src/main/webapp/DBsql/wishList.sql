-- trade 테이블에 관심상품 구분 컬럼생성 ( 0 = null / 1 = 관심상품 )
ALTER TABLE trade
ADD wish_check NUMBER(1);

-- trade 테이블 관심상품 테스트용 더미 추가
INSERT INTO trade( tradeno, title, userid, content, hit, insert_date, price, product_State, sale_State, category, userphone, wish_check ) VALUES ( trade_seq.nextval, '위시리스트 테스트', 'id2', '위시리시트 추가 테스트', 15, '22-10-15', 15000, '가구', '예약중', '판매', '010-1234-5678', 1);

-- 관심상품 테이블 삭제
DROP TABLE wishlist;

-- 관심상품 테이블 생성
create table wishlist (
    wishlistno NUMBER PRIMARY KEY,
    tradeno NUMBER,
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

-- 관심상품 시퀀스 생성
CREATE SEQUENCE wishlist_seq;

-- 관심상품 시퀀스 삭제
DROP SEQUENCE wishlist_seq;

SELECT * FROM wishlist;

DELETE wishlist;

-- trade테이블의 wishlist등록 속성값 복사
INSERT INTO wishlist ( wishlistno, tradeno, title, userid, content, hit, insert_date, price, product_state, sale_state, category, userphone )
SELECT wishlist_seq.nextval, tradeno, title, userid, content, hit, insert_date, price, product_state, sale_state, category, userphone FROM trade
<<<<<<< HEAD
WHERE userid = 'id2';
=======
WHERE wish_ckeck = '1';
>>>>>>> branch 'master' of https://github.com/InHoMoon/KH-Team3.git

INSERT INTO test1 ( testno, title , content ) VALUES ( test1_seq.nextval, '테스트 두번째', '테스트내용 두번째' );

INSERT INTO test2 ( testno, title , content ) SELECT testno, title , content FROM test1 WHERE testno = 1;