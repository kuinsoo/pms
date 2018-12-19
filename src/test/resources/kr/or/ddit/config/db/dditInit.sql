-- 운영db에는 없는 테이블
select * from NOTEXISTSINPRD;

Delete from comments;
Delete from WORK;
-- comment table
insert into comments values (SEQ_COMMENTS.nextval, '1', '나진실', '구인수 팀장님 쵝오!', sysdate);
insert into comments values (SEQ_COMMENTS.nextval, '1', '테스트맨', '구인수 팀장님 쵝오!!!', sysdate);

-- Work Table
Insert into WORK values ('1','8','WORK_TEST1','WORK_TEST_CONTENT','1',5,to_date('18/12/08','yy/MM/dd'),to_date('18/12/20','yy/MM/dd'),30,'N','','Y','');
Insert into WORK values ('2','10','WORK_TEST_PROJECT10','WORK_TEST_CONTENT10','1',5,to_date('18/12/08','yy/MM/dd'),to_date('18/12/20','yy/MM/dd'),30,'N','','Y','');



