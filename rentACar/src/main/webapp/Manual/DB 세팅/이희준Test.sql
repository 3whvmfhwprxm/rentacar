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
values('p201000', 'T2000016', '010', '2157', '2630', 'card', 75000, 'paid', '2017-02-01');

insert into reserv_user
values('T2000016', '김진', '010', '5341', '2322', 'kim2@naver.com', '김아빠', '011', '4373', '1112', '801103', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000017', '010','1620','5632', to_date('2017-02-09 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-10 11:30','yyyy/mm/dd hh24:mi'), '01허1111', '자차보험', '2017-02-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201001', 'T2000017', '010', '4621', '2440', 'card', 65000, 'paid', '2017-02-06');

insert into reserv_user
values('T2000017', '다데', '010', '5641', '2241', 'kim2@naver.com', '김다데', '011', '1112', '1112', '810102', '1종대형');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000018', '010','2675','2485', to_date('2017-02-10 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-14 11:30','yyyy/mm/dd hh24:mi'), '03허1235', '자차보험', '2017-02-09' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201002', 'T2000018', '010', '2675', '2485', 'card', 124500, 'paid', '2017-02-09');

insert into reserv_user
values('T2000018', '강빠커', '010', '4466', '5544', 'kim2@naver.com', '이예약', '011', '5353', '4455', '780114', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000019', '010','4578','3524', to_date('2017-02-18 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-20 16:30','yyyy/mm/dd hh24:mi'), '02허5000', '자차보험', '2017-02-10' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201003', 'T2000019', '010', '4578', '3524', 'card', 64000, 'paid', '2017-02-10');

insert into reserv_user
values('T2000019', '김크레', '010', '4466', '5544', 'kim2@naver.com', '임크레', '011', '5353', '4455', '780114', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000020', '010','7822','1358', to_date('2017-02-26 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-28 10:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-02-12' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201004', 'T2000020', '010', '7822', '1358', 'card', 26700, 'paid', '2017-02-12');

insert into reserv_user
values('T2000020', '박키스', '010', '4416', '4444', 'kim2@naver.com', '최키스', '010', '5553', '1155', '930614', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000021', '010','4562','7222', to_date('2017-02-17 17:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-18 10:30','yyyy/mm/dd hh24:mi'), '01허3333', '자차보험', '2017-02-10' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201005', 'T2000021', '010', '4562', '7222', 'card', 78000, 'paid', '2017-02-10');

insert into reserv_user
values('T2000021', '홍미키', '010', '2451', '6353', 'kim2@naver.com', '박미키', '010', '3553', '5435', '820911', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000022', '010','6436','6364', to_date('2017-02-19 15:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-22 13:30','yyyy/mm/dd hh24:mi'), '01허4444', '자차보험', '2017-02-14' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201006', 'T2000022', '010', '6436', '6364', 'card', 57800, 'paid', '2017-02-14');

insert into reserv_user
values('T2000022', '김호구', '010', '3522', '2323', 'kim2@naver.com', '박호구', '010', '5533', '7754', '870911', '1종대형');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000023', '010','6361','1423', to_date('2017-02-23 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-24 10:30','yyyy/mm/dd hh24:mi'), '02허4000', '자차보험', '2017-02-15' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201007', 'T2000023', '010', '6361', '1423', 'card', 87000, 'paid', '2017-02-15');

insert into reserv_user
values('T2000023', '최텀블', '010', '3543', '7723', 'kim2@naver.com', '박텀블', '010', '3333', '7554', '710802', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000024', '010','4321','6646', to_date('2017-02-26 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-27 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-02-11' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201008', 'T2000024', '010', '4321', '6646', 'card', 87000, 'paid', '2017-02-11');

insert into reserv_user
values('T2000024', '징크스', '010', '3543', '7723', 'kim2@naver.com', '럭스', '010', '3333', '7554', '710802', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000025', '010','5423','4782', to_date('2017-02-12 10:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-16 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-02-08' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201009', 'T2000025', '010', '5423', '4782', 'card', 157000, 'paid', '2017-02-08');

insert into reserv_user
values('T2000025', '토레타', '010', '3322', '6744', 'kim2@naver.com', '이토타', '010', '3322', '6744', '710802', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000026', '010','6478','3456', to_date('2017-02-11 11:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-14 10:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-02-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201010', 'T2000026', '010', '6478', '3456', 'card', 47000, 'paid', '2017-02-06');

insert into reserv_user
values('T2000026', '김희철', '010', '8456', '5444', 'kim2@naver.com', '김희철', '010', '8456', '5444', '830802', '1종보통');

commit;





