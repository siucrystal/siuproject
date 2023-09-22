select * from member;
select * from post;

INSERT INTO member VALUES (member_idx.NEXTVAL,'test4', '4444', 'test4', 'GENERAL', SYSDATE);

INSERT INTO MEMBER (IDX, ID, PW, NICKNAME, GRADE) VALUES (1, 'test1', '1111', 'test1', 'GENERAL');


SELECT pw, name, grade FROM member WHERE id = 'test1';
commit;