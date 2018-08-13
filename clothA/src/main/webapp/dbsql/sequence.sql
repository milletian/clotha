drop sequence ACCOUNT_seq;
drop sequence ACCOUNT_DETAIL_seq;
drop sequence AREA_seq;
drop sequence COLOR_seq;
drop sequence dept_seq;
drop sequence employee_seq;
drop sequence get_mail_seq;
drop sequence grade_seq;
drop sequence inout_seq;
drop sequence inout_detail_seq;
drop sequence log_seq;
drop sequence mail_seq;
drop sequence notice_seq;
drop sequence products_seq;
drop sequence sales_seq;
drop sequence season_seq;
drop sequence size_seq;
drop sequence stock_seq;
drop sequence stock_area_seq;
drop sequence store_seq;
drop sequence style_seq;
drop sequence transport_seq;
drop sequence transport_detail_seq;
drop sequence warehouse_seq;


-- 시퀀스증가
create sequence stock_area_seq
increment by 100
start with 1000
nocache;

-- 시퀀스증가
create sequence area_seq
increment by 10
start with 100
nocache;

-- 시퀀스증가
create sequence account_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence account_detail_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence stock_area_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence color_seq
increment by 1
start with 1
nocache;


-- 시퀀스증가
create sequence dept_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence employee_seq
increment by 1
start with 1000
nocache;

-- 시퀀스증가
create sequence get_mail_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence grade_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence inout_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence inout_detail_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence log_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence mail_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence notice_seq
increment by 1
start with 1
nocache;


-- 시퀀스증가
create sequence products_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence sales_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence season_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence size_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence stock_seq
increment by 1
start with 30
nocache;

-- 시퀀스증가
create sequence store_seq
increment by 1
start with 300
nocache;

-- 시퀀스증가
create sequence style_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence transport_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence transport_detail_seq
increment by 1
start with 1
nocache;

-- 시퀀스증가
create sequence warehouse_seq
increment by 1
start with 1
nocache;