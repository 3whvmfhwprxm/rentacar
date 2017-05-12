
--4월 예약/결제/예약자 테스트정보

--4월 1일
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000001', '011','1111','1111', to_date('2017-04-02 10:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-03 15:30','yyyy/mm/dd hh24:mi'),'03허5555', '자차보험', '2017-04-01' ,'wraith');

insert into reserv_user
values('T4000001', '김엄마', '011', '1111', '1111', 'ww1@naver.com', '김아빠', '011', '1112', '1112', '750502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t401p01', 'T4000001', '011', '1111', '1111', 'card', 36500, 'paid', '2017-04-01');

--4월 3일
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000002', '010','2222','2222', to_date('2017-04-04 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-05 12:30','yyyy/mm/dd hh24:mi'),'03허4444', '자차보험', '2017-04-03' ,'highnoon');

insert into reserv_user
values('T4000002', '하오빠', '010', '2222', '2222', 'ww1@naver.com', '하친구', '010', '2223', '2223', '850502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t403p01', 'T4000002', '010', '2222', '2222', 'card', 46500, 'paid', '2017-04-03');

--4월 4일 --1
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000004', '010','2222','2222', to_date('2017-04-06 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-08 12:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-04' ,'dade');

insert into reserv_user
values('T4000004', '다엄마', '010', '2222', '2222', 'wwdd1@naver.com', '다엄친', '010', '2223', '2223', '810502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t404p01', 'T4000004', '010', '2222', '2222', 'card', 46500, 'paid', '2017-04-04');

--4월 4일 --2
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000005', '010','8888','8888', to_date('2017-04-05 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-06 08:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-04' ,'jin1');

insert into reserv_user
values('T4000005', '진길동', '010', '8888', '8888', 'wwjin1@naver.com', '진길동', '010', '8888', '8888', '880502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t404p02', 'T4000005', '010', '8888', '8888', 'card', 22500, 'paid', '2017-04-04');

--4월 6일 --1
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000051', '010','8888','8888', to_date('2017-04-05 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-06 08:30','yyyy/mm/dd hh24:mi'),'03허1236', '자차보험', '2017-04-06' ,'jin1');

insert into reserv_user
values('T4000051', '진길동', '010', '8888', '8888', 'wwjin1@naver.com', '진길동', '010', '8888', '8888', '880502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t406p01', 'T4000051', '010', '8888', '8888', 'card', 22500, 'paid', '2017-04-06');

--4월 6일 --2
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000006', '010','1234','1234', to_date('2017-04-08 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-09 12:30','yyyy/mm/dd hh24:mi'),'02허5000', '자차보험', '2017-04-06' ,'kim1');

insert into reserv_user
values('T4000006', '김길동', '010', '1234', '1234', 'kim1@naver.com', '김길동', '010', '1234', '1234', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t406p02', 'T4000006', '010', '1234', '1234', 'card', 72500, 'paid', '2017-04-06');

--4월 12일
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000012', '010','1234','1234', to_date('2017-04-14 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-16 12:30','yyyy/mm/dd hh24:mi'),'03허1235', '자차보험', '2017-04-12' ,'kim1');

insert into reserv_user
values('T4000012', '김길동', '010', '1234', '1234', 'kim1@naver.com', '김길동', '010', '1234', '1234', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t412p01', 'T4000012', '010', '1234', '1234', 'card', 32500, 'paid', '2017-04-12');

--4월 16일
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000016', '010','1235','1235', to_date('2017-04-18 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-19 12:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-16' ,'jin');

insert into reserv_user
values('T4000016', '진아빠', '010', '1235', '1235', 'jim1@naver.com', '진아빠', '010', '1235', '1235', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t416p01', 'T4000016', '010', '1234', '1234', 'card', 74500, 'paid', '2017-04-16');

--4월 23일--1
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000023', '010','1235','1235', to_date('2017-04-24 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-25 08:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-23' ,'jin');

insert into reserv_user
values('T4000023', '진아빠', '010', '1235', '1235', 'jim1@naver.com', '진아빠', '010', '1235', '1235', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t423p01', 'T4000023', '010', '1234', '1234', 'card', 62500, 'paid', '2017-04-23');

--2
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000024', '010','1236','1236', to_date('2017-04-24 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-25 08:30','yyyy/mm/dd hh24:mi'),'02허1000', '자차보험', '2017-04-23' ,'lee1');

insert into reserv_user
values('T4000024', '이아빠', '010', '1236', '1236', 'lee1@naver.com', '이아빠', '010', '1236', '1236', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t423p02', 'T4000024', '010', '1236', '1236', 'card', 22500, 'paid', '2017-04-23');

--4월 27일
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T4000027', '010','1236','1236', to_date('2017-04-28 08:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-30 08:30','yyyy/mm/dd hh24:mi'),'03허1235', '자차보험', '2017-04-27' ,'lee1');

insert into reserv_user
values('T4000027', '이아빠', '010', '1236', '1236', 'lee1@naver.com', '이아빠', '010', '1236', '1236', '660502', '1종보통');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('t427p01', 'T4000027', '010', '1236', '1236', 'card', 42500, 'paid', '2017-04-27');

commit;
select * from RENT_USER;
select * from COMPANYCAROPTION;
select * from RESERVATION order by reserv_date;

select * from BALANCE_ACC;
--delete from BALANCE_ACC; commit;
