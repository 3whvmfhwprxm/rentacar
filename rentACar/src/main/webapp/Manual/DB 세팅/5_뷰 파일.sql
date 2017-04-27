
--예약 가능 차 정보 보여주는 join문
select a.*, b.COM_NAME
from (select comc.*, c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img
        from (select * from COMPANYCAROPTION
        where car_code in (
        select car_code from car
        where car_type=4
        )
        and ccar_car_id not in (
        select ccar_car_id from RESERVATION
        where reserv_end_date >= to_date('2017-05-29 08:00', 'yyyy/mm/dd hh24:mi')
        and reserv_start_date <= to_date('2017-05-31 09:30', 'yyyy/mm/dd hh24:mi')
        )
        and comcar_outdate is null
    ) comc join car c
    on comc.car_code=c.car_code) a join company b
on a.com_id=b.com_id 
order by car_name;

--업체에서 간략한 예약화면 보여주는 뷰
create or replace view com_reservView
as
    select c.car_name, cco.*, rv.RESERV_START_DATE, rv.RESERV_END_DATE,
    trunc(to_date(rv.reserv_start_date)-sysdate,0) as remainingday,
    rvu.*, p.pay_money
    from companycaroption cco, car c, reservation rv, reserv_user rvu, payinfo p
    where cco.CAR_CODE = c.CAR_CODE
    and cco.CCAR_CAR_ID = rv.CCAR_CAR_ID
    and rv.RESERV_NUM = rvu.RESERV_NUM
    and p.RESERV_NUM (+) = rvu.RESERV_NUM

    
    select * from com_reservView
    
--
select a.*, b.COM_NAME, b.COM_TEL1, b.COM_TEL2, b.COM_TEL3 
from (	select comc.*, c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img
        from COMPANYCAROPTION comc join car c
        on comc.car_code=c.car_code) a join company b
on a.com_id=b.com_id
where ccar_car_id='rentZoa_0001';


select * from company