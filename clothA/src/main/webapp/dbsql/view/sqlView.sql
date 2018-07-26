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

commit;





