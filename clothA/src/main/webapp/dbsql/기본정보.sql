insert into grade(grade_code,grade_name)
values('1','������');
insert into grade(grade_code,grade_name)
values('2','���� ������');
insert into grade(grade_code,grade_name)
values('3','����');
insert into grade(grade_code,grade_name)
values('4','���');

insert into dept(dept_no,dept_name)
values('10','������');

insert into dept(dept_no,dept_name)
values('20','�����');

insert into dept(dept_no,dept_name)
values('30','�ܱ�˹�');


insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'20','ȫ�浿','123','23412','�����','1234567-1234567','01012341234','4','nana@naver.com');

insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'10','������','123','52624','��ġ��ġ','1234567-1234567','01012341234','2','ehslek22@naver.com');

insert into employee(emp_no,dept_no,emp_name,emp_pwd,emp_zipcode,emp_address,emp_jumin,emp_tel,grade_code,emp_email)
values(employee_seq.nextval,'20','�¼���','123','45487','��õ��','1234567-1234567','01012341234','3','dhstnals@naver.com');

select * from employee;


update employee set emp_del = 'Y' where emp_no between 1000 and 1002 ;

select * from area;

insert into area (area_code,area_name)
values(area_seq.nextval,'����');

insert into area (area_code,area_name)
values(area_seq.nextval,'��õ');

insert into area (area_code,area_name)
values(area_seq.nextval,'�λ�');

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
values('ca'||store_seq.nextval,'1000','12345','�����','1200');

insert into store(store_code,emp_no,store_zipcode,store_address,sta_code)
values('ca'||store_seq.nextval,'1001','6252','�����','1100');

insert into store(store_code,emp_no,store_zipcode,store_address,sta_code)
values('ca'||store_seq.nextval,'1002','6252','�����','1000');