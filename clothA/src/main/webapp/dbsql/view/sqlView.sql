create or replace view AccProductsView
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
select i.*,w.WH_NAME,w.WH_CODE,S.STORE_NAME,s.STORE_CODE,p.ACC_CODE,p.ACC_NAME,p.PD_NAME,p.COLOR_CODE,c.COLOR_NAME
from inoutview i join inout_detail d
on i.INOUT_CODE = d.INOUT_CODE
left join warehouse w
on i.AREA_START = w.STA_CODE
left join store s
on i.AREA_END = s.STA_CODE
join ACCPRODUCTSVIEW  p
on d.PD_CODE = p.PD_CODE
join color c
on p.COLOR_CODE = c.COLOR_CODE;

create or replace view warehousingOutview
as
select i.*,w.WH_NAME,w.WH_CODE,S.STORE_NAME,s.STORE_CODE,p.ACC_CODE,p.ACC_NAME,p.PD_NAME,p.COLOR_CODE,c.COLOR_NAME
from inoutview i join inout_detail d
on i.INOUT_CODE = d.INOUT_CODE
left join warehouse w
on i.AREA_END = w.STA_CODE
left join store s
on i.AREA_START = s.STA_CODE
join ACCPRODUCTSVIEW  p
on d.PD_CODE = p.PD_CODE
join color c
on p.COLOR_CODE = c.COLOR_CODE;
commit;

create or replace view inoutview 
as
select i.*,id.PD_CODE,id.INOUT_DETAIL_QTY from inout i join inout_detail id 
on i.INOUT_CODE = id.INOUT_CODE ;

create or replace view transportlistview
as
select t.*,s2.STORE_NAME as "END_STORE_NAME", s.STORE_NAME as "START_STORE_NAME",td.PD_CODE,p.PD_NAME,td.QUANTITY from transport t join store s 
on t.STORE_CODE2= s.STORE_CODE
join store s2 
on t.STORE_CODE = s.STORE_CODE
join transport_detail td
on t.TP_CODE = td.TP_CODE
join products p 
on td.PD_CODE = p.PD_CODE;