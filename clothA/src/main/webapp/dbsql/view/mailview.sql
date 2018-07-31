select * from mail order by mail_no desc;
select * from get_mail;



create view mailview
as
select m.*,g.get_mail_pk,g.emp_no,g.get_mail_read,g.get_mail_save, g.get_mail_del
from mail m join get_mail g
on m.mail_no = g.mail_no;

select * from mailview;

commit;