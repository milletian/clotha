-- size���̺�

insert into "SIZE"(size_code,size_name)
values('XS',85);

insert into "SIZE"(size_code,size_name)
values('S',90);

insert into "SIZE"(size_code,size_name)
values('M',95);

insert into "SIZE"(size_code,size_name)
values('L',100);

insert into "SIZE"(size_code,size_name)
values('XL',105);




--color ���̺�


insert into color(color_code, color_name)
values('69','navy');

insert into color(color_code, color_name)
values('89','black');

insert into color(color_code, color_name)
values('00','white');

insert into color(color_code, color_name)
values('04','pink');

insert into color(color_code, color_name)
values('32','beige');

insert into color(color_code, color_name)
values('67','blue');

insert into color(color_code, color_name)
values('05','red');

insert into color(color_code, color_name)
values('88','gray');

insert into color(color_code, color_name)
values('25','yellow');

insert into color(color_code, color_name)
values('99','gold');



--season ���̺�

select * from season;

insert into season(season_code,season_name)
values('SS','��/����');

insert into season(season_code,season_name)
values('FW','����/�ܿ�');





--style ���̺�



insert into style(style_code,style_name)
values('S','����');

insert into style(style_code,style_name)
values('O','���ǽ�');

insert into style(style_code,style_name)
values('T','Ƽ����');

insert into style(style_code,style_name)
values('K','��ĿƮ');

insert into style(style_code,style_name)
values('P','����');

insert into style(style_code,style_name)
values('U','�ƿ���');

insert into style(style_code,style_name)
values('E','��Ÿ');



--GENDER ���̺�

insert into gender(gender_code,gender_name)
values('M','����');

insert into gender(gender_code,gender_name)
values('F','����');


commit;


select * from "SIZE";
select * from color;
select * from season;
select * from style;
select * from account;
select * from products;

