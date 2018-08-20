--grade , dept, area, warehouse , employee, store, account ���� �Է� --


--grade code 
insert into grade(grade_code,grade_name)
values('1','������');
insert into grade(grade_code,grade_name)
values('2','���� ������');
insert into grade(grade_code,grade_name)
values('3','����');
insert into grade(grade_code,grade_name)
values('4','���');

commit;

select * from grade;

-- dept �⺻����--
insert into dept(dept_no,dept_name)
values('10','������');

insert into dept(dept_no,dept_name)
values('20','�����');

insert into dept(dept_no,dept_name)
values('30','�ܱ�˹�');

commit;

select * from dept;

--�����ڵ� ���� area(����, ��õ, �λ�)
select * from area;

insert into area(AREA_CODE, AREA_NAME)
values(100,'����');
insert into area(AREA_CODE, AREA_NAME)
values(110,'��õ');
insert into area(AREA_CODE, AREA_NAME)
values(120,'�λ�');

commit;

select * from area;

--â����ġ �ڵ� ���� warehouse(����, ��õ, �λ�) 3��
select * from warehouse;

insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'����â��','56396','��⵵ �ϳ��� ����1��27���� 13~����â��','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );
insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'��õâ��','46729','��õ ��ȭ�� ��ȭ�� ����� 3 (��û��)~��õâ��','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );
insert into Warehouse(wh_code,wh_Name,wh_zipcode,wh_address,wh_image,sta_code)
		values('wh'||warehouse_seq.nextval,'�λ�â��','23036','�λ� ������ ����1�� 7 (���)~�λ�â��','', 
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ) );

commit;

select * from warehouse;
		
--���� �λ�����(������ ����)--
select * from employee;

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '������', '123', '12345', '���� ������ ����~���̿��ǽ�', '123456-1234567','02-999-9999'
                     ,'������',1,'','master@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
 --���� ����--
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '������', '123', '12345', '���� ������ ����~���̿��ǽ�', '234567-1234567','02-999-9999'
                     ,'���� ������',2,'','master@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');


--���� ���� ����,����,����,�־�,����, �ؿ�� ��--
select * from employee;

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '��ö��', '��ö��1!', '12345', '���� ������ ����~���̿��ǽ�', '234567-1234567','010-9191-4537'
                     ,'����������',3,'','kim@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '��ȣ��', '��ȣ��1!', '45432', '���� ���ϱ� ����~���̿��ǽ�', '773123-1234567','010-2232-4424'
                     ,'����������',3,'','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '������', '������1!', '45432', '��õ�� ���� �Ե�����Ʈ~ 101�� 101ȣ', '670123-1234567','010-8897-2211'
                     ,'����������',3,'','oh@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y'); 
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '�����', '�����!', '45432', '��õ�� �־ȱ� �ϴú���~ 103�� 103ȣ', '801221-1234567','010-5542-8899'
                     ,'�־�������',3,'','yoon@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y'); 
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '����', '����1!', '77666', '�λ�� ���鱸 ���̾���Ʈ~ 111�� 1101ȣ', '820505-1234567','010-8891-5565'
                     ,'����������',3,'','lee@hanmail.net', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, 'Ȳ��ȣ', 'Ȳ��ȣ1!', '47462', '�λ�� �ؿ�뱸 �ְ�3����~ 301�� 408ȣ', '810222-1234567','010-6766-7776'
                     ,'�ؿ��������',3,'','lee@hanmail.net', to_char(sysdate,'YYYY/MM/DD'), 'Y');
           
commit;

--�� ���� ���� ������, �����, �ܱ�˹�--

--���� ���� �ڵ� ����, ��õ, �λ� �� 2�� ����--
select * from store;

insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1002','������','47365','����Ư���� ������ ������� 382~����Ÿ�� 1��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'02-998-5546','1111111111');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1003','������','94573','����Ư���� ���ϱ� ������ 62 �Ե���ȭ���̾���~����Ÿ�� 1��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'02-554-1156', '2222222222' );
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1004','������','12574','��õ������ ���� ����� 7 ~�Ŷ���� 1��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'031-754-1716', '3333333333');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1005','�־���','12574','��õ������ ����Ȧ�� �־ȷ� 100-1 ~����Ÿ�� 1��,2��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'031-223-5699', '4444444444');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1006','������','77263','�λ걤���� �λ����� ���ߴ�� 772 �Ե���ȭ���λ꺻�� ~ 4��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'051-442-8686', '5555555555');
insert into store(store_code,emp_No,store_Name,store_zipcode,store_address,store_image, store_join, sta_code,store_tel,store_No)
		values('ca'||store_seq.nextval,'1007','�ؿ����','91122','�λ걤���� �ؿ�뱸 ������ 26-1 ~ 1��','',to_char(sysdate,'YYYY/MM/DD'),
		( select sta_code from ( select * from stock_area order by sta_code desc ) where rownum=1 ),'051-334-2277', '6666666666');		

commit;

--���庰 ���� ��� --

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '������', '������1!', '12345', '���� ȭ� ~ �׸�����', '901231-1234567','010-1111-0001'
                     ,'������',4,'ca300','oh@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '���α�', '���α�1!', '12345', '���� ������ ~���� ����Ʈ', '921231-1234567','010-1111-0002'
                     ,'�����',4,'ca300','lim@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '�����', '�����1!', '12345', '���� ���ϱ� ~ 345-81����', '931231-1234567','010-1111-0003'
                     ,'�˹�',4,'ca300','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'N');
                     
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, 'Ȳ����', 'Ȳ����1!', '23456', '���� ������ ~ �������', '900511-1234567','010-2222-0001'
                     ,'������',4,'ca301','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '������', '������1!', '23456', '���� ��걸 ~���� ����Ʈ', '930303-1234567','010-2222-0002'
                     ,'�����',4,'ca301','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'N');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '�̼�ȭ', '�̼�ȭ1!', '23456', '��⵵ �����ֽ� ~ 34-21����', '880131-1234567','010-2222-0003'
                     ,'�˹�',4,'ca301','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '�ڰ���', '�ڰ���1!', '34567', '��õ ���� ~ ���̺���', '800511-1234567','010-3333-0001'
                     ,'������',4,'ca302','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '������', '������1!', '34567', '��õ  ����Ȧ�� ~���� ����Ʈ', '840303-1234567','010-3333-0002'
                     ,'�����',4,'ca302','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '������', '������1!', '34567', '��õ ûõ�� ~ 15-21����', '890131-1234567','010-3333-0003'
                     ,'�˹�',4,'ca302','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
                     
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '��ȣ��', '��ȣ��1!', '34567', '��õ ���� ~ ��������Ʈ 101�� 1104ȣ', '810911-1234567','010-5555-0001'
                     ,'������',4,'ca303','jin2@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '������', '������1!', '34567', '��õ  ����Ȧ�� ~���� ����Ʈ 301�� 707ȣ', '880703-1234567','010-5555-0002'
                     ,'�����',4,'ca303','gugu@nate.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '������', '������1!', '34567', '��õ ûõ�� ~ ��κ���', '900731-1234567','010-5555-0003'
                     ,'�˹�',4,'ca303','go@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '��õȣ', '��õȣ1!', '34567', '�λ� ������ ~ �ٴپ���Ʈ 401�� 504ȣ', '810911-1234567','010-4444-0001'
                     ,'������',4,'ca304','hoho@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '�ڱԻ�', '�ڱԻ�1!', '34567', '�λ�  ��� ~�λ����Ʈ 201�� 407ȣ', '880703-1234567','010-4444-0002'
                     ,'�����',4,'ca304','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '������', '������1!', '34567', '�λ� �λ����� ~ ���߾���Ʈ 101�� 102ȣ', '930324-1234567','010-4444-0003'
                     ,'�˹�',4,'ca304','hotB@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 10, '������', '������1!', '45678', '�λ� ������ ~ �ٴپ���Ʈ 401�� 504ȣ', '810911-1234567','010-6666-0001'
                     ,'������',4,'ca305','hoho@gmail.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 20, '�輱��', '�輱��1!', '45678', '�λ�  ��� ~�ο�����Ʈ 401�� 407ȣ', '900703-1234567','010-6666-0002'
                     ,'�����',4,'ca305','park@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');
insert into employee(EMP_NO, DEPT_NO, EMP_NAME, EMP_PWD, EMP_ZIPCODE, EMP_ADDRESS,
                     EMP_JUMIN, EMP_TEL, EMP_JOB, GRADE_CODE, STORE_CODE, EMP_EMAIL, EMP_JOINDATE, EMP_DEL)
              values(employee_seq.nextval, 30, '���ʷ�', '���ʷ�1!', '45678', '�λ� �λ����� ~ ���߾���Ʈ 101�� 103ȣ', '930324-1234567','010-6666-0003'
                     ,'�˹�',4,'ca305','hotB@naver.com', to_char(sysdate,'YYYY/MM/DD'), 'Y');

commit;

--���庰 ���� ������Ʈ--

select * from employee;

update employee
set store_code='ca301'
where emp_name='��ȣ��';
update employee
set store_code='ca302'
where emp_name='������';
update employee
set store_code='ca303'
where emp_name='�����';
update employee
set store_code='ca304'
where emp_name='����';
update employee
set store_code='ca305'
where emp_name='Ȳ��ȣ';

commit;

-- account ���̺� --

insert into account(acc_code,acc_name,acc_zipcode,acc_address,acc_tel,acc_ceo,acc_no)
values('acc'||account_seq.nextval,'ȫ�浿_��','1111','���� ��','02-777-7777','ȫ�浿','11-222-333333');
