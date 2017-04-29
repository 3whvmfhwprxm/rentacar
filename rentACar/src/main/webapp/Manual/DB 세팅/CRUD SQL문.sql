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

--3번 검색 조건(1,2번 결합)
select * from COMPANYCAROPTION
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

--
select a.*, b.COM_NAME, b.COM_TEL1, b.COM_TEL2, b.COM_TEL3 
from (	select comc.*, c.car_name, c.car_inc, c.car_size, c.car_trans, car_type, car_img
        from COMPANYCAROPTION comc join car c
        on comc.car_code=c.car_code) a join company b
on a.com_id=b.com_id
where ccar_car_id='rentZoa_0001';


select * from company