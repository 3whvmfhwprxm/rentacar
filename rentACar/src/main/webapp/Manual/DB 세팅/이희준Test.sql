select*from reservation;
select*from payinfo;
select*from reserv_user;
select*from COMPANYCAROPTION;

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000016', '010','2157','2630', to_date('2017-02-05 13:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-07 18:30','yyyy/mm/dd hh24:mi'), '01허1234', '자차보험', '2017-02-01' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201000', 'T2000016', '010', '2157', '2630', 'card', 75000, 'paid', '2017-02-02');

insert into reserv_user
values('T2000016', '김진', '010', '5341', '2322', 'kim2@naver.com', '김아빠', '011', '4373', '1112', '801103', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000017', '010','1620','5632', to_date('2017-03-05 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-06 11:30','yyyy/mm/dd hh24:mi'), '01허1111', '자차보험', '2017-03-02' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001001', 'T3000017', '010', '4621', '2440', 'card', 46000, 'paid', '2017-03-02');

insert into reserv_user
values('T3000017', '홍길동', '010', '5641', '2241', 'kim2@naver.com', '김재동', '011', '1112', '1112', '810102', '1종대형');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000018', '010','5630','0032', to_date('2017-03-08 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-09 11:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-03-04' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001002', 'T3000018', '010', '2400', '5366', 'card', 32000, 'paid', '2017-03-04');

insert into reserv_user
values('T3000018', '강호동', '010', '4466', '5544', 'kim2@naver.com', '이철수', '011', '5353', '4455', '780114', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000019', '010','5630','0032', to_date('2017-03-11 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-13 14:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-03-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001003', 'T3000019', '010', '5500', '6466', 'card', 56000, 'paid', '2017-03-06');

insert into reserv_user
values('T3000019', '김진동', '010', '4466', '5544', 'kim2@naver.com', '임재범', '011', '5353', '4455', '780114', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000020', '010','5630','0032', to_date('2017-03-15 13:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-16 10:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-03-10' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001004', 'T3000020', '010', '5240', '5566', 'card', 56000, 'paid', '2017-03-10');

insert into reserv_user
values('T3000020', '박가입', '010', '4416', '4444', 'kim2@naver.com', '최승철', '010', '5553', '1155', '930614', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000021', '010','1130','4232', to_date('2017-03-17 13:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-18 10:30','yyyy/mm/dd hh24:mi'), '01허3333', '자차보험', '2017-03-08' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001005', 'T3000021', '010', '5340', '5336', 'card', 56000, 'paid', '2017-03-10');

insert into reserv_user
values('T3000021', '박철수', '010', '5516', '4234', 'kim2@naver.com', '박철근', '010', '3553', '5435', '820911', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000022', '010','1130','4232', to_date('2017-03-19 15:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-20 12:30','yyyy/mm/dd hh24:mi'), '01허4444', '자차보험', '2017-03-14' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001006', 'T3000022', '010', '5544', '2236', 'card', 26000, 'paid', '2017-03-14');

insert into reserv_user
values('T3000022', '김승재', '010', '3522', '2323', 'kim2@naver.com', '박호구', '010', '5533', '7754', '870911', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000023', '010','1130','4232', to_date('2017-03-23 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-24 10:30','yyyy/mm/dd hh24:mi'), '01허5555', '자차보험', '2017-03-15' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001007', 'T3000023', '010', '5544', '2236', 'card', 26000, 'paid', '2017-03-15');

insert into reserv_user
values('T3000023', '최승희', '010', '3543', '7723', 'kim2@naver.com', '박정희', '010', '3333', '7554', '710802', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000024', '010','1130','4232', to_date('2017-03-26 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-27 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-03-15' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001008', 'T3000024', '010', '3361', '5433', 'card', 57000, 'paid', '2017-03-15');

insert into reserv_user
values('T3000024', '김영철', '010', '3543', '7723', 'kim2@naver.com', '박희준', '010', '3333', '7554', '710802', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000025', '010','1130','4232', to_date('2017-03-27 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-28 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-03-19' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001009', 'T3000025', '010', '3361', '5433', 'card', 63000, 'paid', '2017-03-19');

insert into reserv_user
values('T3000025', '이상민', '010', '3322', '6744', 'kim2@naver.com', '이상민', '010', '3322', '6744', '710802', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T3000026', '010','1130','4232', to_date('2017-03-29 11:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-03-30 10:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-03-24' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001010', 'T3000026', '010', '3361', '5433', 'card', 47000, 'paid', '2017-03-24');

insert into reserv_user
values('T3000026', '김희철', '010', '8456', '5444', 'kim2@naver.com', '김희철', '010', '8456', '5444', '830802', '1종보통');
--

commit;





