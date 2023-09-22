select * from member;
select * from post;
INSERT INTO member (idx, id, pw, nickname, grade) VALUES ('1','test1', '1111', 'test1', 'GENERAL');
INSERT INTO member VALUES (member_idx.NEXTVAL,'test4', '4444', 'test4', 'GENERAL', SYSDATE);