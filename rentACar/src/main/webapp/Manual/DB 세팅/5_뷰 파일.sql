
--업체에서 간략한 예약화면 보여주는 뷰
create or replace view com_reservView
as
select c.car_name, cco.*, rv.RESERV_START_DATE, rv.RESERV_END_DATE,rv.USER_ID,
rv.RESERV_DATE, trunc(to_date(rv.reserv_start_date)-sysdate,0) as remainingday,
rvu.*, p.pay_money, p.PAY_REGDATE, p.PAY_CONDITION
from companycaroption cco, car c, reservation rv, reserv_user rvu, payinfo p
where cco.CAR_CODE = c.CAR_CODE
and cco.CCAR_CAR_ID = rv.CCAR_CAR_ID
and rv.RESERV_NUM = rvu.RESERV_NUM
and p.RESERV_NUM (+) = rvu.RESERV_NUM;

select * from com_reservView
   

--예약정보에 결제결과와 결제일을 함께 보여주는 view 
create or replace view reservPayInfoView
as
select r.*, p.PAY_CONDITION, p.PAY_REGDATE
from RESERVATION r join payinfo p
on r.RESERV_NUM=p.RESERV_NUM(+);

select * from reservPayInfoView;