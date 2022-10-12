DROP TABLE tuser;

CREATE TABLE tuser (
    userno NUMBER PRIMARY KEY
    , userid VARCHAR2(200) NOT NULL
    , userpw VARCHAR2(500) NOT NULL
    , username VARCHAR2(200) NOT NULL
    , useremail VARCHAR2(100) NOT NULL
    , userphone VARCHAR2(50) NOT NULL
    , usergender VARCHAR2(1)
    , userbirth VARCHAR2(50)
    , useraddr VARCHAR2(4000)
    , usernick VARCHAR2(200)
    , usergrade VARCHAR2(20)
    , userjoindate DATE DEFAULT sysdate
    , userupdate DATE DEFAULT sysdate -- 추후 수정 예정
    , reportcount NUMBER
);

DROP SEQUENCE tuser_seq;
CREATE SEQUENCE tuser_seq;

SELECT * FROM tuser;

INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id1', 'pw1', 'name1', 'email1@naver.com', '010-1111-2222', 'F', '1990-01-01', 'addr1', 'nick1', '관리자', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id2', 'pw2', 'name2', 'email2@naver.com', '010-1111-2223', 'F', '1990-01-02', 'addr2', 'nick2', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id3', 'pw3', 'name3', 'email3@naver.com', '010-1111-2224', 'F', '1990-01-03', 'addr3', 'nick3', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id4', 'pw4', 'name4', 'email4@naver.com', '010-1111-2225', 'F', '1990-01-04', 'addr4', 'nick4', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id5', 'pw5', 'name5', 'email5@naver.com', '010-1111-2226', 'F', '1990-01-05', 'addr5', 'nick5', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id6', 'pw6', 'name6', 'email6@naver.com', '010-1111-2227', 'F', '1990-01-06', 'addr6', 'nick6', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id7', 'pw7', 'name7', 'email7@naver.com', '010-1111-2228', 'F', '1990-01-07', 'addr7', 'nick7', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id8', 'pw8', 'name8', 'email8@naver.com', '010-1111-2229', 'F', '1990-01-08', 'addr8', 'nick8', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id9', 'pw9', 'name9', 'email9@naver.com', '010-1111-2230', 'F', '1990-01-09', 'addr9', 'nick9', '일반회원', 1);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id10', 'pw10', 'name10', 'email10@naver.com', '010-1111-2231', 'F', '1990-01-10', 'addr10', 'nick10', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id11', 'pw11', 'name11', 'email11@naver.com', '010-1111-2232', 'F', '1990-01-11', 'addr11', 'nick11', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id12', 'pw12', 'name12', 'email12@naver.com', '010-1111-2233', 'F', '1990-01-12', 'addr12', 'nick12', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id13', 'pw13', 'name13', 'email13@naver.com', '010-1111-2234', 'F', '1990-01-13', 'addr13', 'nick13', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id14', 'pw14', 'name14', 'email14@naver.com', '010-1111-2235', 'F', '1990-01-14', 'addr14', 'nick14', '일반회원', 5);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id15', 'pw15', 'name15', 'email15@naver.com', '010-1111-2236', 'F', '1990-01-15', 'addr15', 'nick15', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id16', 'pw16', 'name16', 'email16@naver.com', '010-1111-2237', 'F', '1990-01-16', 'addr16', 'nick16', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id17', 'pw17', 'name17', 'email17@naver.com', '010-1111-2238', 'F', '1990-01-17', 'addr17', 'nick17', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id18', 'pw18', 'name18', 'email18@naver.com', '010-1111-2239', 'F', '1990-01-18', 'addr18', 'nick18', '일반회원', 3);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id19', 'pw19', 'name19', 'email19@naver.com', '010-1111-2240', 'F', '1990-01-19', 'addr19', 'nick19', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id20', 'pw20', 'name20', 'email20@naver.com', '010-1111-2241', 'F', '1990-01-20', 'addr20', 'nick20', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id21', 'pw21', 'name21', 'email21@naver.com', '010-1111-2242', 'F', '1990-01-21', 'addr21', 'nick21', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id22', 'pw22', 'name22', 'email22@naver.com', '010-1111-2243', 'F', '1990-01-22', 'addr22', 'nick22', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id23', 'pw23', 'name23', 'email23@naver.com', '010-1111-2244', 'F', '1990-01-23', 'addr23', 'nick23', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id24', 'pw24', 'name24', 'email24@naver.com', '010-1111-2245', 'F', '1990-01-24', 'addr24', 'nick24', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id25', 'pw25', 'name25', 'email25@naver.com', '010-1111-2246', 'F', '1990-01-25', 'addr25', 'nick25', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id26', 'pw26', 'name26', 'email26@naver.com', '010-1111-2247', 'F', '1990-01-26', 'addr26', 'nick26', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id27', 'pw27', 'name27', 'email27@naver.com', '010-1111-2248', 'F', '1990-01-27', 'addr27', 'nick27', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id28', 'pw28', 'name28', 'email28@naver.com', '010-1111-2249', 'F', '1990-01-28', 'addr28', 'nick28', '일반회원', 1);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id29', 'pw29', 'name29', 'email29@naver.com', '010-1111-2250', 'F', '1990-01-29', 'addr29', 'nick29', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id30', 'pw30', 'name30', 'email30@naver.com', '010-1111-2251', 'F', '1990-01-30', 'addr30', 'nick30', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id31', 'pw31', 'name31', 'email31@gmail.com', '010-1111-2252', 'F', '1990-01-31', 'addr31', 'nick31', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id32', 'pw32', 'name32', 'email32@gmail.com', '010-1111-2253', 'F', '1990-02-01', 'addr32', 'nick32', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id33', 'pw33', 'name33', 'email33@gmail.com', '010-1111-2254', 'F', '1990-02-02', 'addr33', 'nick33', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id34', 'pw34', 'name34', 'email34@gmail.com', '010-1111-2255', 'F', '1990-02-03', 'addr34', 'nick34', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id35', 'pw35', 'name35', 'email35@gmail.com', '010-1111-2256', 'F', '1990-02-04', 'addr35', 'nick35', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id36', 'pw36', 'name36', 'email36@gmail.com', '010-1111-2257', 'F', '1990-02-05', 'addr36', 'nick36', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id37', 'pw37', 'name37', 'email37@gmail.com', '010-1111-2258', 'F', '1990-02-06', 'addr37', 'nick37', '일반회원', 1);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id38', 'pw38', 'name38', 'email38@gmail.com', '010-1111-2259', 'F', '1990-02-07', 'addr38', 'nick38', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id39', 'pw39', 'name39', 'email39@gmail.com', '010-1111-2260', 'F', '1990-02-08', 'addr39', 'nick39', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id40', 'pw40', 'name40', 'email40@gmail.com', '010-1111-2261', 'F', '1990-02-09', 'addr40', 'nick40', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id41', 'pw41', 'name41', 'email41@gmail.com', '010-1111-2262', 'F', '1990-02-10', 'addr41', 'nick41', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id42', 'pw42', 'name42', 'email42@gmail.com', '010-1111-2263', 'F', '1990-02-11', 'addr42', 'nick42', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id43', 'pw43', 'name43', 'email43@gmail.com', '010-1111-2264', 'F', '1990-02-12', 'addr43', 'nick43', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id44', 'pw44', 'name44', 'email44@gmail.com', '010-1111-2265', 'F', '1990-02-13', 'addr44', 'nick44', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id45', 'pw45', 'name45', 'email45@gmail.com', '010-1111-2266', 'F', '1990-02-14', 'addr45', 'nick45', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id46', 'pw46', 'name46', 'email46@gmail.com', '010-1111-2267', 'F', '1990-02-15', 'addr46', 'nick46', '일반회원', 2);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id47', 'pw47', 'name47', 'email47@gmail.com', '010-1111-2268', 'F', '1990-02-16', 'addr47', 'nick47', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id48', 'pw48', 'name48', 'email48@gmail.com', '010-1111-2269', 'F', '1990-02-17', 'addr48', 'nick48', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id49', 'pw49', 'name49', 'email49@gmail.com', '010-1111-2270', 'F', '1990-02-18', 'addr49', 'nick49', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id50', 'pw50', 'name50', 'email50@gmail.com', '010-1111-2271', 'F', '1990-02-19', 'addr50', 'nick50', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id51', 'pw51', 'name51', 'email51@gmail.com', '010-1111-2272', 'M', '1990-03-01', 'addr51', 'nick51', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id52', 'pw52', 'name52', 'email52@gmail.com', '010-1111-2273', 'M', '1990-03-02', 'addr52', 'nick52', '일반회원', 2);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id53', 'pw53', 'name53', 'email53@gmail.com', '010-1111-2274', 'M', '1990-03-03', 'addr53', 'nick53', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id54', 'pw54', 'name54', 'email54@gmail.com', '010-1111-2275', 'M', '1990-03-04', 'addr54', 'nick54', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id55', 'pw55', 'name55', 'email55@gmail.com', '010-1111-2276', 'M', '1990-03-05', 'addr55', 'nick55', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id56', 'pw56', 'name56', 'email56@gmail.com', '010-1111-2277', 'M', '1990-03-06', 'addr56', 'nick56', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id57', 'pw57', 'name57', 'email57@gmail.com', '010-1111-2278', 'M', '1990-03-07', 'addr57', 'nick57', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id58', 'pw58', 'name58', 'email58@gmail.com', '010-1111-2279', 'M', '1990-03-08', 'addr58', 'nick58', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id59', 'pw59', 'name59', 'email59@gmail.com', '010-1111-2280', 'M', '1990-03-09', 'addr59', 'nick59', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id60', 'pw60', 'name60', 'email60@hanmail.com', '010-1111-2281', 'M', '1990-03-10', 'addr60', 'nick60', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id61', 'pw61', 'name61', 'email61@hanmail.com', '010-1111-2282', 'M', '1990-03-11', 'addr61', 'nick61', '일반회원', 3);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id62', 'pw62', 'name62', 'email62@hanmail.com', '010-1111-2283', 'M', '1990-03-12', 'addr62', 'nick62', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id63', 'pw63', 'name63', 'email63@hanmail.com', '010-1111-2284', 'M', '1990-03-13', 'addr63', 'nick63', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id64', 'pw64', 'name64', 'email64@hanmail.com', '010-1111-2285', 'M', '1990-03-14', 'addr64', 'nick64', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id65', 'pw65', 'name65', 'email65@hanmail.com', '010-1111-2286', 'M', '1990-03-15', 'addr65', 'nick65', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id66', 'pw66', 'name66', 'email66@hanmail.com', '010-1111-2287', 'M', '1990-03-16', 'addr66', 'nick66', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id67', 'pw67', 'name67', 'email67@hanmail.com', '010-1111-2288', 'M', '1990-03-17', 'addr67', 'nick67', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id68', 'pw68', 'name68', 'email68@hanmail.com', '010-1111-2289', 'M', '1990-03-18', 'addr68', 'nick68', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id69', 'pw69', 'name69', 'email69@hanmail.com', '010-1111-2290', 'M', '1990-03-19', 'addr69', 'nick69', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id70', 'pw70', 'name70', 'email70@hanmail.com', '010-1111-2291', 'M', '1990-03-20', 'addr70', 'nick70', '일반회원', 3);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id71', 'pw71', 'name71', 'email71@hanmail.com', '010-1111-2292', 'M', '1990-03-21', 'addr71', 'nick71', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id72', 'pw72', 'name72', 'email72@hanmail.com', '010-1111-2293', 'M', '1990-03-22', 'addr72', 'nick72', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id73', 'pw73', 'name73', 'email73@hanmail.com', '010-1111-2294', 'M', '1990-03-23', 'addr73', 'nick73', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id74', 'pw74', 'name74', 'email74@hanmail.com', '010-1111-2295', 'M', '1990-03-24', 'addr74', 'nick74', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id75', 'pw75', 'name75', 'email75@hanmail.com', '010-1111-2296', 'M', '1990-03-25', 'addr75', 'nick75', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id76', 'pw76', 'name76', 'email76@hanmail.com', '010-1111-2297', 'M', '1990-03-26', 'addr76', 'nick76', '일반회원', 4);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id77', 'pw77', 'name77', 'email77@hanmail.com', '010-1111-2298', 'M', '1990-03-27', 'addr77', 'nick77', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id78', 'pw78', 'name78', 'email78@hanmail.com', '010-1111-2299', 'M', '1990-03-28', 'addr78', 'nick78', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id79', 'pw79', 'name79', 'email79@hanmail.com', '010-1111-2300', 'M', '1990-03-29', 'addr79', 'nick79', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id80', 'pw80', 'name80', 'email80@nate.com', '010-1111-2301', 'M', '1990-03-30', 'addr80', 'nick80', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id81', 'pw81', 'name81', 'email81@nate.com', '010-1111-2302', 'M', '1990-03-31', 'addr81', 'nick81', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id82', 'pw82', 'name82', 'email82@nate.com', '010-1111-2303', 'M', '1990-04-01', 'addr82', 'nick82', '일반회원', 5);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id83', 'pw83', 'name83', 'email83@nate.com', '010-1111-2304', 'M', '1990-04-02', 'addr83', 'nick83', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id84', 'pw84', 'name84', 'email84@nate.com', '010-1111-2305', 'M', '1990-04-03', 'addr84', 'nick84', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id85', 'pw85', 'name85', 'email85@nate.com', '010-1111-2306', 'M', '1990-04-04', 'addr85', 'nick85', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id86', 'pw86', 'name86', 'email86@nate.com', '010-1111-2307', 'M', '1990-04-05', 'addr86', 'nick86', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id87', 'pw87', 'name87', 'email87@nate.com', '010-1111-2308', 'M', '1990-04-06', 'addr87', 'nick87', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id88', 'pw88', 'name88', 'email88@nate.com', '010-1111-2309', 'M', '1990-04-07', 'addr88', 'nick88', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id89', 'pw89', 'name89', 'email89@nate.com', '010-1111-2310', 'M', '1990-04-08', 'addr89', 'nick89', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id90', 'pw90', 'name90', 'email90@nate.com', '010-1111-2311', 'M', '1990-04-09', 'addr90', 'nick90', '일반회원', 4);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id91', 'pw91', 'name91', 'email91@nate.com', '010-1111-2312', 'M', '1990-04-10', 'addr91', 'nick91', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id92', 'pw92', 'name92', 'email92@nate.com', '010-1111-2313', 'M', '1990-04-11', 'addr92', 'nick92', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id93', 'pw93', 'name93', 'email93@nate.com', '010-1111-2314', 'M', '1990-04-12', 'addr93', 'nick93', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id94', 'pw94', 'name94', 'email94@nate.com', '010-1111-2315', 'M', '1990-04-13', 'addr94', 'nick94', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id95', 'pw95', 'name95', 'email95@nate.com', '010-1111-2316', 'M', '1990-04-14', 'addr95', 'nick95', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id96', 'pw96', 'name96', 'email96@nate.com', '010-1111-2317', 'M', '1990-04-15', 'addr96', 'nick96', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id97', 'pw97', 'name97', 'email97@nate.com', '010-1111-2318', 'M', '1990-04-16', 'addr97', 'nick97', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id98', 'pw98', 'name98', 'email98@nate.com', '010-1111-2319', 'M', '1990-04-17', 'addr98', 'nick98', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id99', 'pw99', 'name99', 'email99@nate.com', '010-1111-2320', 'M', '1990-04-18', 'addr99', 'nick99', '일반회원', null);  
INSERT INTO tuser( userno, userid, userpw, username, useremail, userphone, usergender, userbirth, useraddr, usernick, usergrade, reportcount ) VALUES ( tuser_seq.nextval, 'id100', 'pw100', 'name100', 'email100@nate.com', '010-1111-2321', 'M', '1990-04-19', 'addr100', 'nick100', '일반회원', null);  

commit;

SELECT * FROM tuser
ORDER BY userno;