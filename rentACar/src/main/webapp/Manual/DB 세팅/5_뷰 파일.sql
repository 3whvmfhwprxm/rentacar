
--��ü���� ������ ����ȭ�� �����ִ� ��
create or replace view com_reservView
as
select c.car_name, cco.*, rv.RESERV_START_DATE, rv.RESERV_END_DATE,rv.USER_ID,
rv.RESERV_DATE, trunc(to_date(rv.reserv_start_date)-sysdate,0) as remainingday,
rvu.*, p.pay_money, p.PAY_REGDATE, p.PAY_CONDITION, p.PAY_CANCELDATE
from companycaroption cco, car c, reservation rv, reserv_user rvu, payinfo p
where cco.CAR_CODE = c.CAR_CODE
and cco.CCAR_CAR_ID = rv.CCAR_CAR_ID
and rv.RESERV_NUM = rvu.RESERV_NUM
and p.RESERV_NUM (+) = rvu.RESERV_NUM;

select * from com_reservView;
   

--���������� ��������� �������� �Բ� �����ִ� view 
create or replace view reservPayInfoView
as
select r.*, p.PAY_CONDITION, p.PAY_REGDATE, p.PAY_CANCELDATE, p.PAY_MONEY
from RESERVATION r join payinfo p
on r.RESERV_NUM=p.RESERV_NUM(+);

select * from reservPayInfoView;
commit;

--Ư�� ����� ������ �����ִ� view ����Ҷ� ��,��,Ư�� ��ü
create or replace view company_paymoney
as
select c.COM_ID, c.COM_NAME, p.PAY_REGDATE, p.PAY_MONEY, r.RESERV_NUM  
from COMPANYCAROPTION cc join company c
on cc.COM_ID = c.COM_ID join RESERVATION r
on r.CCAR_CAR_ID=cc.CCAR_CAR_ID join PAYINFO p
on r.RESERV_NUM=p.RESERV_NUM
where p.PAY_CANCELDATE is null;
/*
and c.COM_ID='rentGo'
and extract(year from p.PAY_REGDATE)='2017'
and extract(month from p.PAY_REGDATE)='05'
*/ 
select * from company_paymoney;

--��� ����
select sum(PAY_MONEY) as sales from company_paymoney
where COM_ID='rentGo'   --Ư�����
and extract(year from PAY_REGDATE)='2017'   --Ư���⵵
and extract(month from PAY_REGDATE)='05';   --Ư����

select count(RESERV_NUM) as reserv from company_paymoney
where COM_ID='rentGo'   --Ư�����
and extract(year from PAY_REGDATE)='2017'   --Ư���⵵
and extract(month from PAY_REGDATE)='05';   --Ư����
