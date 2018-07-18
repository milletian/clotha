create view AccProductsView
as
select a.ACC_NAME, p.*
from products p  join account a
on p.ACC_CODE=a.ACC_CODE;

commit;