DROP TABLE boardcate;
CREATE TABLE boardcate (
	boardcateid VARCHAR2(50)	PRIMARY KEY ,
	boardcatename VARCHAR2(50),
	boardcatedate DATE NULL
);

INSERT INTO boardcate( boardcateid, boardcatename, boardcatedate ) VALUES ('board01', '중고거래', sysdate);
INSERT INTO boardcate( boardcateid, boardcatename, boardcatedate ) VALUES ('board02', '공지사항', sysdate);

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

INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 01', '본문내용01', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 02', '본문내용02', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 03', '본문내용03', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'이벤트', '이벤트 제목 01', '이벤트 본문내용01', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'이벤트', '이벤트 제목 02', '이벤트 본문내용02', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'이벤트', '이벤트 제목 03', '이벤트 본문내용03', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'이벤트', '이벤트 제목 04', '이벤트 본문내용04', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 04', '본문내용04', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 05', '본문내용05', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 06', '본문내용06', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 07', '본문내용07', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 08', '본문내용08', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 09', '본문내용09', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 10', '본문내용10', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 11', '본문내용11', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 12', '본문내용12', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 13', '본문내용13', sysdate);
INSERT INTO notice( nno, ncategory, ntitle, ncontent, nwritedate) VALUES (notice_seq.nextval,'공지', '제목 14', '본문내용14', sysdate);

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


INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, userid) VALUES (ncomment_seq.nextval, 131, '첫댓이다 테스트', 'id1');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 131, '두번째 댓글입니다. ', sysdate, sysdate, 'id1');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 131, '세번째 댓글입니다', sysdate, sysdate, 'id2');
INSERT INTO ncomment ( ncmtid, nno, ncmtcontent, ncmtwritedate, ncmtupdatetime, userid) 
VALUES (ncomment_seq.nextval, 132, '세번째 댓글입니다', sysdate, sysdate, 'id1');


commit;

SELECT * FROM ncomment;

SELECT * FROM notice;