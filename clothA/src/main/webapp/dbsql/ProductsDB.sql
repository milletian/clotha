-- size테이블

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




--color 테이블


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



--season 테이블

select * from season;

insert into season(season_code,season_name)
values('SS','봄/여름');

insert into season(season_code,season_name)
values('FW','가을/겨울');





--style 테이블



insert into style(style_code,style_name)
values('S','셔츠');

insert into style(style_code,style_name)
values('O','원피스');

insert into style(style_code,style_name)
values('T','티셔츠');

insert into style(style_code,style_name)
values('K','스커트');

insert into style(style_code,style_name)
values('P','바지');

insert into style(style_code,style_name)
values('U','아우터');

insert into style(style_code,style_name)
values('E','기타');



-- account 테이블


insert into account(acc_code,acc_name,acc_zipcode,acc_address,acc_tel,acc_ceo,acc_no)
values('acc'||account_seq.nextval,'홍길동_주','1111','서울 시','02-777-7777','홍길동','11-222-333333');

--products 테이블


insert into products(pd_code,pd_name,pd_originalprice,pd_sellprice,style_code,color_code,season_code,size_code,acc_code,gender_code)
values('SXS0269'||products_seq.nextval||'-SS','린넨셔츠','5000','59800','S','69','SS','XS','acc1','F');

commit;


select * from "SIZE";
select * from color;
select * from season;
select * from style;
select * from account;
select * from products;
