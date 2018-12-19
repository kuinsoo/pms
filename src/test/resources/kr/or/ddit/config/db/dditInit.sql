-- 운영db에는 없는 테이블
-- *(testdb(3번)에만 있는 안전장치)
select * from NOTEXISTSINPRD;

-- 공용 reset tables
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

-------- *** for Q&A test : 변찬우20181219
-- member Table 
insert into MEMBER values('skwlstlf1227@gmail.com', 'skwlstlf1227',	'1234', '119', '/images/basic.png', 'n');
insert into MEMBER values('admin@admin.com', 'admin',	'admin', '114', '/images/basic.png', 'n');

-- board Table 
insert into BOARD values( 'board4', 'admin@admin.com', 'QAboard');

-- Q&A Table
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', '1234', '질문있습니다~', '오늘 언제 끝나나요?', 'n', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', '1234', '네, 답변드립니다~', '너, 다 끝나시면 끝나요~', 'n', 'QApost'||seq_POST_ID.nextval, sysdate );
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', null, 'skwlstlf1227@gmail.com', null, '그런데 회식은 언제하나요~', '어서 어서 하고싶어요~', 'n', 'QApost'||seq_POST_ID.nextval, sysdate);
insert into POST values('QApost'||seq_POST_ID.nextval, 'board4', 'QApost'||(seq_POST_ID.nextval-1), 'admin@admin.com', null , '짜잔, 회식은~', '오늘 오늘합니다~', 'n', 'QApost'||seq_POST_ID.nextval, sysdate );
