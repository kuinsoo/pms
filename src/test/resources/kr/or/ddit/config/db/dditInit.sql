
-- 시퀀스 삭제 
drop sequence seq_BOARD_ID;
drop sequence seq_POST_ID;

-- 운영db에는 없는 테이블
-- *(testdb(3번)에만 있는 안전장치)
select * from NOTEXISTSINPRD;

-- 테이블 지우기
Delete from NOTIFIED_PMEMBER;
Delete from PROJECT_NOTIFICATION;
Delete from PROJECT_JPA;
Delete from MEETING_MEMBER;
Delete from CHATTING;
Delete from MEETING_ISSUE;
Delete from MEETING;
Delete from TODO;
Delete from ISSUE;
Delete from WORK_CARD;
Delete from COMMENTS;
Delete from ATTACHMENT;
Delete from WORK_MEMBER;
Delete from PROJECT_MEMBER;
Delete from NOTIFIED_PMEMBER;
Delete from PROJECT_NOTIFICATION;
Delete from PROJECT_JPA;
Delete from PROJECT_MEMBER;
Delete from INVITE_PROJECT;
Delete from PROJECT;
Delete from MESSAGE_MEMBER;
Delete from MESSAGE;
Delete from MEMBER_JPA;
Delete from FRIENDSLIST;
Delete from AUTHORITY;
Delete from POST;
Delete from BOARD;
Delete from MEMBER;


-- 시퀀스 초기화 
CREATE SEQUENCE seq_BOARD_ID MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
CREATE SEQUENCE seq_POST_ID MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


-------- *** for Q&A test : 변찬우20181219
-- member Table 
insert into MEMBER values('skwlstlf1227@gmail.com', 'skwlstlf1227',	'1234', '119', '/images/basic.png', 'n');
insert into MEMBER values('admin@admin.com', 'admin',	'admin', '114', '/images/basic.png', 'n');

-- board Table 
insert into BOARD values( 'board4', 'admin@admin.com', 'QAboard');

-- Q&A Table
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', '1234', '질문있습니다~', '오늘 언제 끝나나요?', 'n', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', '1234', '네, 답변드립니다~', '너, 다 끝나시면 끝나요~', 'n', 'QApost'||(seq_POST_ID.nextval-1), sysdate );
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', null, '그런데 회식은 언제하나요~', '어서 어서 하고싶어요~', 'y', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', null , '짜잔, 회식은~', '오늘 오늘합니다~', 'y', 'QApost'||(seq_POST_ID.nextval-1), sysdate );
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', null, '내년 설은 무슨 요일인가요?', '무슨요일인지, 연휴기간은 얼마나되는지 알려주세요~', 'y', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', '1234', '질문있습니다~', '오늘 언제 끝나나요?', 'n', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', '1234', '네, 답변드립니다~', '너, 다 끝나시면 끝나요~', 'n', 'QApost'||(seq_POST_ID.nextval-1), sysdate );
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', null, '그런데 회식은 언제하나요~', '어서 어서 하고싶어요~', 'y', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', null , '짜잔, 회식은~', '오늘 오늘합니다~', 'y', 'QApost'||(seq_POST_ID.nextval-1), sysdate );
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', null, '내년 설은 무슨 요일인가요?', '무슨요일인지, 연휴기간은 얼마나되는지 알려주세요~', 'y', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', '1234', '질문있습니다~', '오늘 언제 끝나나요?', 'n', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', '1234', '네, 답변드립니다~', '너, 다 끝나시면 끝나요~', 'n', 'QApost'||(seq_POST_ID.nextval-1), sysdate );




