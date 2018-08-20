--grade , dept, area, warehouse , employee, store, account 정보 입력 --


--grade code 
insert into grade(grade_code,grade_name)
values('1','마스터');
insert into grade(grade_code,grade_name)
values('2','본사 관리자');
insert into grade(grade_code,grade_name)
values('3','점장');
insert into grade(grade_code,grade_name)
values('4','사원');

commit;

select * from grade;

-- dept 기본정보--
insert into dept(dept_no,dept_name)
values('10','정직원');

insert into dept(dept_no,dept_name)
values('20','계약직');

insert into dept(dept_no,dept_name)
values('30','단기알바');

commit;

select * from dept;

--지역코드 생성 area(서울, 인천, 부산)
select * from area;

insert into area(AREA_CODE, AREA_NAME)
values(100,'서울');
insert into area(AREA_CODE, AREA_NAME)
values(110,'인천');
insert into area(AREA_CODE, AREA_NAME)
values(120,'부산');

commit;

select * from area;

--창고위치 코드 생성 warehouse(서울, 인천, 부산) 3개
select * from warehouse;

insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'서울창고','56396','경기도 하남시 신장1로27번길 13~서울창고','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );
insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'인천창고','46729','인천 강화군 강화읍 갑룡길 3 (관청리)~인천창고','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );
insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'부산창고','23036','부산 강서구 가달1로 7 (생곡동)~부산창고','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );

commit;

select * from warehouse;
		
--본사 인사정보(마스터 생성)--
select * from employee;

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '마스터', '123', '12345', '서울 강남구 본사~마이오피스', '123456-1234567','02-999-9999'
                     ,'마스터',1,'','master@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
 --본사 직원--
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '관리자', '123', '12345', '서울 강남구 본사~마이오피스', '234567-1234567','02-999-9999'
                     ,'본사 관리자',2,'','master@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');


--매장 점주 강남,강북,부평,주안,서면, 해운대 순--
select * from employee;

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '김철수', '김철수1!', '12345', '서울 강남구 본사~마이오피스', '234567-1234567','010-9191-4537'
                     ,'강남점점장',3,'','kim@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '박호준', '박호준1!', '45432', '서울 강북구 본사~마이오피스', '773123-1234567','010-2232-4424'
                     ,'강북점점장',3,'','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '오지명', '오지명1!', '45432', '인천시 부평구 롯데아파트~ 101동 101호', '670123-1234567','010-8897-2211'
                     ,'부평점점장',3,'','oh@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y'); 
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '윤명수', '윤명수!', '45432', '인천시 주안구 하늘빌라~ 103동 103호', '801221-1234567','010-5542-8899'
                     ,'주안점점장',3,'','yoon@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y'); 
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '이준', '이준1!', '77666', '부산시 서면구 자이아파트~ 111동 1101호', '820505-1234567','010-8891-5565'
                     ,'서면점점장',3,'','lee@hanmail.net', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '황준호', '황준호1!', '47462', '부산시 해운대구 주공3단지~ 301동 408호', '810222-1234567','010-6766-7776'
                     ,'해운대점점장',3,'','lee@hanmail.net', to_char(sysdate,'YYYY/MM/DD'), 'Y');
           
commit;

--각 매장 직원 정직원, 계약직, 단기알바--

--매장 생성 코드 서울, 인천, 부산 각 2개 매장--
select * from store;

insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1002','강남점','47365','서울특별시 강남구 강남대로 382~비전타워 1층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'02-998-5546','1111111111');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1003','강북점','94573','서울특별시 강북구 도봉로 62 롯데백화점미아점~비전타워 1층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'02-554-1156', '2222222222' );
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1004','부평점','12574','인천광역시 부평구 시장로 7 ~신라빌딩 1층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'031-754-1716', '3333333333');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1005','주안점','12574','인천광역시 미추홀구 주안로 100-1 ~로직타워 1층,2층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'031-223-5699', '4444444444');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1006','서면점','77263','부산광역시 부산진구 가야대로 772 롯데백화점부산본점 ~ 4층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'051-442-8686', '5555555555');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1007','해운대점','91122','부산광역시 해운대구 구남로 26-1 ~ 1층','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'051-334-2277', '6666666666');		

commit;

--매장별 직원 등록 --

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '오나미', '오나미1!', '12345', '서울 화곡동 ~ 그린빌라', '901231-1234567','010-1111-0001'
                     ,'정직원',4,'ca300','oh@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '임인구', '임인구1!', '12345', '서울 광진구 ~해피 아파트', '921231-1234567','010-1111-0002'
                     ,'계약직',4,'ca300','lim@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '고수정', '고수정1!', '12345', '서울 강북구 ~ 345-81번지', '931231-1234567','010-1111-0003'
                     ,'알바',4,'ca300','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'N');
                     
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '황진이', '황진이1!', '23456', '서울 광진구 ~ 토토빌라', '900511-1234567','010-2222-0001'
                     ,'정직원',4,'ca301','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '구봉선', '구봉선1!', '23456', '서울 용산구 ~자이 아파트', '930303-1234567','010-2222-0002'
                     ,'계약직',4,'ca301','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'N');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '이선화', '이선화1!', '23456', '경기도 남양주시 ~ 34-21번지', '880131-1234567','010-2222-0003'
                     ,'알바',4,'ca301','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '박검진', '박검진1!', '34567', '인천 부평구 ~ 하이빌라', '800511-1234567','010-3333-0001'
                     ,'정직원',4,'ca302','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '구봉선', '구봉선1!', '34567', '인천  미추홀구 ~자이 아파트', '840303-1234567','010-3333-0002'
                     ,'계약직',4,'ca302','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '윤만수', '윤만수1!', '34567', '인천 청천동 ~ 15-21번지', '890131-1234567','010-3333-0003'
                     ,'알바',4,'ca302','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
                     
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '김호균', '김호균1!', '34567', '인천 부평구 ~ 검정아파트 101동 1104호', '810911-1234567','010-5555-0001'
                     ,'정직원',4,'ca303','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '신지선', '신지선1!', '34567', '인천  미추홀구 ~부흥 아파트 301동 707호', '880703-1234567','010-5555-0002'
                     ,'계약직',4,'ca303','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '이진규', '이진규1!', '34567', '인천 청천동 ~ 헬로빌라', '900731-1234567','010-5555-0003'
                     ,'알바',4,'ca303','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '김천호', '김천호1!', '34567', '부산 동래구 ~ 바다아파트 401동 504호', '810911-1234567','010-4444-0001'
                     ,'정직원',4,'ca304','hoho@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '박규상', '박규상1!', '34567', '부산  사상구 ~부산아파트 201동 407호', '880703-1234567','010-4444-0002'
                     ,'계약직',4,'ca304','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '박찬범', '박찬범1!', '34567', '부산 부산진구 ~ 가야아파트 101동 102호', '930324-1234567','010-4444-0003'
                     ,'알바',4,'ca304','hotB@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '오상진', '오상진1!', '45678', '부산 동래구 ~ 바다아파트 401동 504호', '810911-1234567','010-6666-0001'
                     ,'정직원',4,'ca305','hoho@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '김선민', '김선민1!', '45678', '부산  사상구 ~로열아파트 401동 407호', '900703-1234567','010-6666-0002'
                     ,'계약직',4,'ca305','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '박초롱', '박초롱1!', '45678', '부산 부산진구 ~ 가야아파트 101동 103호', '930324-1234567','010-6666-0003'
                     ,'알바',4,'ca305','hotB@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

commit;

--매장별 점장 업데이트--

select * from employee;

update employee
set store_code='ca301'
where emp_name='박호준';
update employee
set store_code='ca302'
where emp_name='오지명';
update employee
set store_code='ca303'
where emp_name='윤명수';
update employee
set store_code='ca304'
where emp_name='이준';
update employee
set store_code='ca305'
where emp_name='황준호';

commit;

-- account 테이블 --

insert into account(acc_code,acc_name,acc_zipcode,acc_address,acc_tel,acc_ceo,acc_no)
values('acc'||account_seq.nextval,'홍길동_주','1111','서울 시','02-777-7777','홍길동','11-222-333333');
