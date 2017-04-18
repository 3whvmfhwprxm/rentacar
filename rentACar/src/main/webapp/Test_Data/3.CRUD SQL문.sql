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
where car_type=1
) 
and ccar_car_id not in (
select ccar_car_id from RESERVATION
where reserv_end_date >= '17-04-29' and reserv_start_date <= '17-05-01'
);

select * from COMPANYCAROPTION 
where ccar_car_id='rentZoa_0001';




select lpad(Reservation_seq.nextval, 8, '0') from dual;

create sequence Reservation_seq2
start with 10
increment by 1
nocache;

select * from RESERVATION where reserv_num='001';

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, user_id)
values(lpad(Reservation_seq.nextval, 8, '0'), '011','2212','2212', '2017-05-15', 15, 
'2017-05-16', 17, 'rentGo_0002', '자차보험', 'jin1')
RETURNING reserv_num into ;

INSERT INTO SequenceTest_Table (ID, OtherColumn)
VALUES (SequenceTest_Sequence.NEXTVAL, :OtherColumn)
RETURNING ID INTO :ID
