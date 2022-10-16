DROP TABLE boardcate;
CREATE TABLE boardcate (
	boardcateid VARCHAR2(50)	PRIMARY KEY ,
	boardcatename VARCHAR2(50),
	boardcatedate DATE NULL
);

INSERT INTO boardcate( boardcateid, boardcatename, boardcatedate ) VALUES ('board01', '�߰�ŷ�', sysdate);
INSERT INTO boardcate( boardcateid, boardcatename, boardcatedate ) VALUES ('board02', '��������', sysdate);

commit;

SELECT * FROM boardcate;




DROP TABLE notice;

CREATE TABLE notice (
	nno NUMBER PRIMARY KEY,
	boardcateid VARCHAR2(50) DEFAULT 'board02',
	ncategory VARCHAR2(50),
	ntitle VARCHAR2(500) ,
	ncontent	VARCHAR2(4000),
	nwritedate DATE DEFAULT sysdate,
	nupdatetime DATE NULL,
	ntop NUMBER DEFAULT 0,
	nhit NUMBER DEFAULT 0
);

ALTER TABLE notice
ADD CONSTRAINT notice_fk
    FOREIGN KEY (boardcateid)
    REFERENCES boardcate(boardcateid);

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq;

SELECT * FROM notice;



DELETE notice;

INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 01', '��������01', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 02', '��������02', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 03', '��������03', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'�̺�Ʈ', '�̺�Ʈ ���� 01', '�̺�Ʈ ��������01', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'�̺�Ʈ', '�̺�Ʈ ���� 02', '�̺�Ʈ ��������02', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'�̺�Ʈ', '�̺�Ʈ ���� 03', '�̺�Ʈ ��������03', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'�̺�Ʈ', '�̺�Ʈ ���� 04', '�̺�Ʈ ��������04', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 04', '��������04', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 05', '��������05', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 06', '��������06', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 07', '��������07', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 08', '��������08', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 09', '��������09', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 10', '��������10', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 11', '��������11', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 12', '��������12', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 13', '��������13', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'����', '���� 14', '��������14', sysdate);

commit;

SELECT * FROM notice;




DROP TABLE nfile;
CREATE TABLE nfile (
	nfileno NUMBER PRIMARY KEY,
	nno NUMBER,
	nfileoriginname VARCHAR2(300) ,
	nfilestoredname VARCHAR2(300),
	nfilesize	NUMBER	 ,
	nfilewritedate DATE DEFAULT sysdate
);

ALTER TABLE nfile
ADD CONSTRAINT nfile_fk
    FOREIGN KEY (nno)
    REFERENCES notice(nno);
  
DROP SEQUENCE nfile_seq;
CREATE SEQUENCE nfile_seq;

commit;

SELECT * FROM nfile;

DROP TABLE ncomment;
CREATE TABLE ncomment (
	ncmtid NUMBER  PRIMARY KEY,
	nno NUMBER DEFAULT 0,
	ncmtcontent VARCHAR2(1000),
	ncmtwritedate DATE DEFAULT sysdate,
	ncmtupdatetime DATE DEFAULT sysdate,
	userid VARCHAR2(200) NOT NULL 
);

ALTER TABLE ncomment
ADD CONSTRAINT ncomment_fk
    FOREIGN KEY (nno)
    REFERENCES notice(nno);


DROP SEQUENCE ncomment_seq;
CREATE SEQUENCE ncomment_seq;


INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, userid) VALUES (ncomment_seq.nextval, 131, 'ù���̴� �׽�Ʈ', 'id1');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 131, '�ι�° ����Դϴ�. ', sysdate, sysdate, 'id1');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 131, '����° ����Դϴ�', sysdate, sysdate, 'id2');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 132, '����° ����Դϴ�', sysdate, sysdate, 'id1');


commit;

SELECT * FROM ncomment;

SELECT * FROM notice;