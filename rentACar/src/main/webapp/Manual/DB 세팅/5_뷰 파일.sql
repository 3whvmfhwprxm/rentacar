
--업체에서 간략한 예약화면 보여주는 뷰
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
   

--예약정보에 결제결과와 결제일을 함께 보여주는 view 
create or replace view reservPayInfoView
as
select r.*, p.PAY_CONDITION, p.PAY_REGDATE, p.PAY_CANCELDATE, p.PAY_MONEY
from RESERVATION r join payinfo p
on r.RESERV_NUM=p.RESERV_NUM(+);

select * from reservPayInfoView;
commit;

--특정 기업의 매출을 보여주는 view 사용할때 년,월,특정 업체
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

--사용 예시
select sum(PAY_MONEY) as sales from company_paymoney
where COM_ID='rentGo'   --특정기업
and extract(year from PAY_REGDATE)='2017'   --특정년도
and extract(month from PAY_REGDATE)='05';   --특정월

select count(RESERV_NUM) as reserv from company_paymoney
where COM_ID='rentGo'   --특정기업
and extract(year from PAY_REGDATE)='2017'   --특정년도
and extract(month from PAY_REGDATE)='05';   --특정월
