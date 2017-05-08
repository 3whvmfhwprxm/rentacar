select * from usernotice order by unotice_no desc;

--예약 가능 차량 검색 방법
/*
ex)검색조건. 기간:17.04.28~17.05.02  차종:중형 
1. Car테이블 -> 중형인차 목록 불러오기
        -> ex)모델코드-hd001(현대소나타17), hd002(현대액센트17), hd003(기아k5_17)

2. Reservation테이블 -> 기간내에 예약이 있는 회사차 ccar_car_id 목록 불러오기
        -> ex) ccar_car_id - rentGo_0002
        
3. COMPANYCAROPTION 테이블 -> 위 1조건에 해당하면서 2조건에는 해당하지 않는 회사차들 목록 불러오기
    +Company테이블과 join해서 Company의 com_name 업체명 가져오기
*/
--1번 검색 조건
select car_code from car
where car_type=1;

--2번 검색 조건
select ccar_car_id from RESERVATION
where reserv_end_date >= '17-04-29' and reserv_start_date <= '17-05-01';

--두 날짜 사이의 간격으로 가격 계산하기
--두 날짜 사이의 간격을 계산하고 그 값을 30분 단위로 측정 (곱하기 48). 거기에 하루 기준값을 48로 나눈 값을 곱한다
select (to_date('2017-05-01 09:00', 'yyyy/mm/dd hh24:mi')-to_date('2017-04-30 09:00', 'yyyy/mm/dd hh24:mi')) * 48 * (500) 
from dual;

--3번 검색 조건(1,2번 결합)
select c.*, (to_date('2017-05-02 09:30', 'yyyy/mm/dd hh24:mi')-to_date('2017-05-01 09:00', 'yyyy/mm/dd hh24:mi')) * CCAR_NORMAL_PRICE
as "priceResult"  
from COMPANYCAROPTION c
where car_code in (
    select car_code from car
    where car_type=5
) 
and ccar_car_id not in (
    select ccar_car_id from RESERVATION
    where reserv_end_date >= to_date('2017-04-29 08:00', 'yyyy/mm/dd hh24:mi')
    and reserv_start_date <= to_date('2017-05-01 09:30', 'yyyy/mm/dd hh24:mi')
)
and comcar_outdate is null;


select * from CAR;
--4번 위 내용에 차정보 조인 2017.04.26
select comc.*, c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img
from (select * from COMPANYCAROPTION
        where car_code in (
        select car_code from car
        where car_type=5
        )
        and ccar_car_id not in (
        select ccar_car_id from RESERVATION
        where reserv_end_date >= to_date('2017-04-29 08:00', 'yyyy/mm/dd hh24:mi')
        and reserv_start_date <= to_date('2017-05-01 09:30', 'yyyy/mm/dd hh24:mi')
        )
        and comcar_outdate is null
    ) comc join car c
on comc.car_code=c.car_code;

--5번 위 내용에 업체 이름정보 조인
select a.*, b.COM_NAME
from (select comc.*, c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img
        from (select c.*, 
        (to_date('2017-05-02 09:30', 'yyyy/mm/dd hh24:mi')-to_date('2017-05-01 09:00', 'yyyy/mm/dd hh24:mi')) * CCAR_NORMAL_PRICE
        as "PRICERESULT"  
        from COMPANYCAROPTION c
        where car_code in (
        select car_code from car
        )
        and ccar_car_id not in (
        select ccar_car_id from RESERVATION
        where reserv_end_date >= to_date('2017-04-29 08:00', 'yyyy/mm/dd hh24:mi')
        and reserv_start_date <= to_date('2017-05-01 09:30', 'yyyy/mm/dd hh24:mi')
        and RESERV_CANCEL is null
        )
        and comcar_outdate is null
    ) comc join car c
    on comc.car_code=c.car_code) a join company b
on a.com_id=b.com_id;

select * from COMPANYCAROPTION 
where ccar_car_id='rentZoa_0001';

select lpad(Reservation_seq.nextval, 8, '0') from dual;

create sequence Reservation_seq2
start with 10
increment by 1
nocache;

select * from RESERVATION where reserv_num='001';

select * from RENT_ADMIN
order by admin_authcode desc;

insert into rent_admin(admin_id, admin_pwd, admin_name, admin_tel1, admin_tel2, admin_tel3, admin_email1, admin_email2, admin_authcode) 
values('adminkim', '1', '킴관리', '010', '1231', '3212', 'gogo', 'naver.com', 3);

update RENT_ADMIN
set admin_tel1='012', admin_tel2='3321', admin_tel3='1111', admin_email1='22q', admin_email2='nate.com', admin_authcode=2  
where admin_id='coun1'

update RENT_ADMIN
set admin_outdate=sysdate
where admin_id='coun1';

rollback;

select * from rent_admin where admin_id='coun4';

select * from event;
insert into event(event_num, event_title, event_content, admin_id, event_start_date, event_end_date,
event_target_grade, event_image1, event_original_image1, event_image2, event_original_image2, event_target_company)
values(event_seq.nextval, '이벤트 제목: 김이벤트', '이벤트 내용: 김내용', 'admin2', '2017-05-01', '2017-05-10', 
'1', 'eimage1.jpg', 'eimage1Original.jpg', '', '', '');

update event
set event_title='수정제목', event_content='수정내용', event_start_date='2017-05-02', event_end_date='2017-05-05',
event_target_grade='1', event_image1='12.jpg', event_image2='2.jpg'
where event_num=11

rollback;

select comcar.*, c.car_name
from COMPANYCAROPTION comcar join car c
on comcar.CAR_CODE = c.CAR_CODE
order by c.car_name;

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

--선택한 차 정보 및 계산된 가격 정보
select a.*, b.COM_NAME, b.COM_TEL1, b.COM_TEL2, b.COM_TEL3 
from (	select comc.*, (to_date('2017-05-02 09:30', 'yyyy/mm/dd hh24:mi')-to_date('2017-05-01 09:00', 'yyyy/mm/dd hh24:mi')) * comc.CCAR_NORMAL_PRICE
        as "priceResult",
        c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img        
        from COMPANYCAROPTION comc join car c
        on comc.car_code=c.car_code) a join company b
on a.com_id=b.com_id
where ccar_car_id='rentZoa_0001';


select * from company

select r.*, p.PAY_CONDITION, p.PAY_REGDATE
from RESERVATION r join payinfo p
on r.RESERV_NUM=p.RESERV_NUM(+)
order by reserv_date desc;


select * from PAYINFO order by pay_regdate desc;

select * from PAYINFO 
where user_tel1='010' and user_tel2='1234' and user_tel3='1234'
order by pay_regdate desc;



--예약정보, 차량넘버, 업체명, 업체 전화번호 ~ 유저아이디로 조회해서 가져오기
select c.*, r.RESERV_NUM, r.RESERV_CANCEL, r.RESERV_DATE, r.RESERV_START_DATE, r.RESERV_END_DATE
from RESERVATION r join (select com.COM_NAME, com.COM_TEL1, com.COM_TEL2, com.COM_TEL3, comcar.CCAR_CAR_ID
                        from company com join COMPANYCAROPTION comcar 
                        on com.COM_ID=comcar.COM_ID) c
on r.CCAR_CAR_ID=c.CCAR_CAR_ID
where r.USER_ID='kim1';
                        
select com.COM_NAME, com.COM_TEL1, com.COM_TEL2, com.COM_TEL3, comcar.CCAR_CAR_ID
from company com join COMPANYCAROPTION comcar 
on com.COM_ID=comcar.COM_ID

--매출 보기 PAYINFO 
select * from PAYINFO;

select to_char(PAY_REGDATE, 'yyyy-MM-dd') as "PAYDATE", sum(PAY_MONEY) as "TOTALPAY" 
from PAYINFO
where extract(year from PAY_REGDATE)='2017'
and extract(month from PAY_REGDATE)='4'
and PAY_CANCELDATE is null
group by to_char(PAY_REGDATE, 'yyyy-MM-dd')
order by PAYDATE;


--정산 입력 관련
select * from Balance_acc;
select * from company;
select * from PAYINFO;
select * from RESERVATION;
select * from COMPANYCAROPTION;

select COM_RATE/100 from company where COM_ID='rentZoa';

--rentZoa의 pay_money 가져오기(pay_canceldate가 null인것만)
select p.PAY_MONEY, p.PAY_REGDATE, c.COM_ID
from COMPANYCAROPTION cc join company c
on cc.COM_ID = c.COM_ID join RESERVATION r
on r.CCAR_CAR_ID=cc.CCAR_CAR_ID join PAYINFO p
on r.RESERV_NUM=p.RESERV_NUM
where p.PAY_CANCELDATE is null
and c.COM_ID='rentGo'
and extract(year from p.PAY_REGDATE)='2017'
and extract(month from p.PAY_REGDATE)='05';

select sum(p.PAY_MONEY)
from COMPANYCAROPTION cc join company c
on cc.COM_ID = c.COM_ID join RESERVATION r
on r.CCAR_CAR_ID=cc.CCAR_CAR_ID join PAYINFO p
on r.RESERV_NUM=p.RESERV_NUM
where p.PAY_CANCELDATE is null
and c.COM_ID='rentGo'
and extract(year from p.PAY_REGDATE)='2017'
and extract(month from p.PAY_REGDATE)='05'

--완성
insert into Balance_acc(bal_num, com_id, BAL_RESERV_CNT, BAL_TARGET_DATE, BAL_SALES, BAL_COMMISSION)
values(Balance_acc_seq.nextval, 'rentGo', nvl((select count(RESERV_NUM) as reserv from company_paymoney
where COM_ID='rentGo'and extract(year from PAY_REGDATE)='2017'and extract(month from PAY_REGDATE)='05'),0), 
'2017-05', nvl((select sum(PAY_MONEY) as sales from company_paymoney
where COM_ID='rentGo'and extract(year from PAY_REGDATE)='2017'and extract(month from PAY_REGDATE)='05'),0), 
nvl((select sum(PAY_MONEY) as sales from company_paymoney where COM_ID='rentGo' and extract(year from PAY_REGDATE)='2017'
and extract(month from PAY_REGDATE)='05'),0)*(select COM_RATE/100 from company where COM_ID='rentGo'));

update Balance_acc
set BAL_DECISION_DATE=null
where BAL_NUM=13;

select * from Balance_acc
where BAL_TARGET_DATE='2017-05';

select * from Balance_acc;
rollback;
commit;
select com_id from COMPANY;

select count(*) from Balance_acc
where com_id='rentGo'
and BAL_TARGET_DATE='2017-05';

delete from Balance_acc;