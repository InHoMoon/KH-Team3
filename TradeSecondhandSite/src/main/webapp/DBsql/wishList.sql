-- trade ���̺� ���ɻ�ǰ ���� �÷����� ( 0 = null / 1 = ���ɻ�ǰ )
ALTER TABLE trade
ADD wish_check NUMBER(1);

-- trade ���̺� ���ɻ�ǰ �׽�Ʈ�� ���� �߰�
INSERT INTO trade( tradeno, title, userid, content, hit, insert_date, price, product_State, sale_State, category, userphone, wish_check ) VALUES ( trade_seq.nextval, '���ø���Ʈ �׽�Ʈ', 'id2', '���ø���Ʈ �߰� �׽�Ʈ', 15, '22-10-15', 15000, '����', '������', '�Ǹ�', '010-1234-5678', 1);

-- ���ɻ�ǰ ���̺� ����
DROP TABLE wishlist;

-- ���ɻ�ǰ ���̺� ����
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

-- ���ɻ�ǰ ������ ����
CREATE SEQUENCE wishlist_seq;

-- ���ɻ�ǰ ������ ����
DROP SEQUENCE wishlist_seq;

SELECT * FROM wishlist;

DELETE wishlist;

-- trade���̺��� wishlist��� �Ӽ��� ����
INSERT INTO wishlist ( wishlistno, tradeno, title, userid, content, hit, insert_date, price, product_state, sale_state, category, userphone )
SELECT wishlist_seq.nextval, tradeno, title, userid, content, hit, insert_date, price, product_state, sale_state, category, userphone FROM trade
<<<<<<< HEAD
WHERE userid = 'id2';
=======
WHERE wish_ckeck = '1';
>>>>>>> branch 'master' of https://github.com/InHoMoon/KH-Team3.git

INSERT INTO test1 ( testno, title , content ) VALUES ( test1_seq.nextval, '�׽�Ʈ �ι�°', '�׽�Ʈ���� �ι�°' );

INSERT INTO test2 ( testno, title , content ) SELECT testno, title , content FROM test1 WHERE testno = 1;