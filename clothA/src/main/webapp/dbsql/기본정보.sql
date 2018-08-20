insert into grade(grade_code,grade_name)
values('1','마스터');
insert into grade(grade_code,grade_name)
values('2','본사 관리자');
insert into grade(grade_code,grade_name)
values('3','점장');
insert into grade(grade_code,grade_name)
values('4','사원');

insert into dept(dept_no,dept_name)
values('10','정직원');

insert into dept(dept_no,dept_name)
values('20','계약직');

insert into dept(dept_no,dept_name)
values('30','단기알바');


insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'20','홍길동','123','23412','서울시','1234567-1234567','01012341234','4','nana@naver.com');

insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'10','윤돈희','123','52624','까치까치','1234567-1234567','01012341234','2','ehslek22@naver.com');

insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'20','온수민','123','45487','인천시','1234567-1234567','01012341234','3','dhstnals@naver.com');

select * from employee;


update employee set emp_del = 'Y' where emp_no between 1000 and 1002 ;

select * from area;

insert into area (area_code,area_name)
values(area_seq.nextval,'서울');

insert into area (area_code,area_name)
values(area_seq.nextval,'인천');

insert into area (area_code,area_name)
values(area_seq.nextval,'부산');

select * from store;
select * from stock_area;

select * from user_sequences;

insert into stock_area(sta_code,area_code)
values(stock_area_seq.nextval,'110');

insert into stock_area(sta_code,area_code)
values(stock_area_seq.nextval,'120');

insert into stock_area(sta_code,area_code)
values(stock_area_seq.nextval,'100');

insert into store(store_code,emp_no,store_zipcode,store_address,sta_code)
values('ca'||store_seq.nextval,'1000','12345','서울시','1200');

insert into store(store_code,emp_no,store_zipcode,store_address,sta_code)
values('ca'||store_seq.nextval,'1001','6252','서울시','1100');

insert into store(store_code,emp_no,store_zipcode,store_address,sta_code)
values('ca'||store_seq.nextval,'1002','6252','서울시','1000');