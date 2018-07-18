drop sequence ACCOUNT_seq;
drop sequence ACCOUNT_DETAIL_seq;
drop sequence AREA_seq;
drop sequence COLOR_seq;
drop sequence coupon_seq;
drop sequence dept_seq;
drop sequence employee_seq;
drop sequence get_mail_seq;
drop sequence grade_seq;
drop sequence inout_seq;
drop sequence inout_detail_seq;
drop sequence log_seq;
drop sequence mail_seq;
drop sequence member_seq;
drop sequence notice_seq;
drop sequence point_seq;
drop sequence products_seq;
drop sequence sales_seq;
drop sequence sales_detail_seq;
drop sequence season_seq;
drop sequence size_seq;
drop sequence stock_seq;
drop sequence stock_area_seq;
drop sequence store_seq;
drop sequence style_seq;
drop sequence transport_seq;
drop sequence transport_detail_seq;
drop sequence warehouse_seq;


-- ����������
create sequence stock_area_seq
increment by 100
start with 1000
nocache;

-- ����������
create sequence area_seq
increment by 10
start with 100
nocache;

-- ����������
create sequence member_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence account_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence account_detail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence stock_area
increment by 1
start with 1
nocache;

-- ����������
create sequence color_seq
increment by 1
start with 1
nocache;



-- ����������
create sequence coupon_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence dept_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence employee_seq
increment by 1
start with 1000
nocache;

-- ����������
create sequence get_mail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence grade_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence inout_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence inout_detail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence log_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence mail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence notice_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence point_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence products_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence sales_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence sales_detail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence season_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence size_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence stock_seq
increment by 1
start with 30
nocache;

-- ����������
create sequence store_seq
increment by 1
start with 300
nocache;

-- ����������
create sequence style_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence transport_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence transport_detail_seq
increment by 1
start with 1
nocache;

-- ����������
create sequence warehouse_seq
increment by 1
start with 1
nocache;