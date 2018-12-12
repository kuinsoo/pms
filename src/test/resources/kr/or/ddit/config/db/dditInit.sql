-- 운영db에는 없는 테이블
select * from NOTEXISTSINPRD;

-- Work Table
Delete from WORK;
Insert into WORK values ('1','8','WORK_TEST1','WORK_TEST_CONTENT','1',5,to_date('18/12/08','yy/MM/dd'),to_date('18/12/20','yy/MM/dd'),30,'N','','Y','');
Insert into WORK values ('2','10','WORK_TEST_PROJECT10','WORK_TEST_CONTENT10','1',5,to_date('18/12/08','yy/MM/dd'),to_date('18/12/20','yy/MM/dd'),30,'N','','Y','');

