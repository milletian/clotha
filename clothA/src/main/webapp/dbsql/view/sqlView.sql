create view AccProductsView
as
select a.ACC_NAME, p.*
from products p  join account a
on p.ACC_CODE=a.ACC_CODE;

-- 상품 상세보기 view

ALTER TABLE products ADD(PD_DEL varchar2(10));

create view StProductsView
as
select p.pd_code, p.PD_NAME,p.PD_DEL,p.PD_IMAGE,p.PD_REGDATE,s.STYLE_NAME, p.PD_ORIGINALPRICE,p.PD_SELLPRICE,p.PD_WARNING,p.PD_EXPLANATION 
from products p join style s
on p.STYLE_CODE = s.STYLE_CODE;

create or replace view warehousingview 
as
select i.IS_IN,i.INOUT_CODE,i.INOUT_STARTDATE, i.INOUT_ENDDATE,w.WH_NAME,w.WH_CODE,S.STORE_NAME,s.STORE_CODE,p.ACC_CODE,p.ACC_NAME,d.PD_CODE,p.PD_NAME,p.COLOR_CODE,c.COLOR_NAME,d.INOUT_DETAIL_QTY
from inoutview i join inout_detail d
on i.INOUT_CODE = d.INOUT_CODE
join warehouse w
on i.AREA_START = w.STA_CODE
join store s
on i.AREA_END = s.STA_CODE
join ACCPRODUCTSVIEW  p
on d.PD_CODE = p.PD_CODE
join color c
on p.COLOR_CODE = c.COLOR_CODE;

commit;





