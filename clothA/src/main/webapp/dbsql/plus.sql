select * from mail;
select * from get_mail;
select * from employee;

ALTER TABLE mail ADD(mail_name varchar2(50));
ALTER TABLE store ADD(store_tel varchar2(30));
ALTER TABLE store ADD(store_no varchar2(30));
ALTER TABLE store ADD(store_name varchar2(100));
ALTER TABLE warehouse ADD(wh_del varchar2(10));

ALTER TABLE ACCOUNT_DETAIL  DROP COLUMN ACC_DT_ISAGREE;