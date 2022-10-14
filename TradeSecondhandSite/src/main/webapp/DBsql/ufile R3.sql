DROP TABLE ufile;
CREATE TABLE ufile (
    ufileno NUMBER PRIMARY KEY,
    userno NUMBER,
    ufileoriginname VARCHAR2(300),
    ufilestoredname VARCHAR2(300),
    ufilesize NUMBER,
    ufilewritedate DATE DEFAULT sysdate
);

ALTER TABLE ufile
ADD CONSTRAINT ufile_fk
    FOREIGN KEY (userno)
    REFERENCES tuser(userno);

DROP SEQUENCE ufile_seq;
CREATE SEQUENCE ufile_seq;

SELECT * FROM ufile
ORDER BY ufileno;