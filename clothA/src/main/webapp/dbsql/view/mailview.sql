select * from mail order by mail_no desc;
select * from get_mail;



create view mailview
as
select m.mail_no,m.sender,m.mail_content,m.mail_file,m.mail_name,g.get_mail_pk,g.emp_no
from mail m join get_mail g
on m.mail_no = g.mail_no;

select * from mailview;