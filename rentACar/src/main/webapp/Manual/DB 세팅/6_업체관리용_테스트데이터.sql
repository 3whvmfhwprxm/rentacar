select * from reservation;
select * from payinfo;
select * from reserv_user;
select * from companycaroption where com_id = 'rentGo';

/*
delete from payinfo
where pay_condition='paid';

delete from reserv_user
where res_drv_tel1='010';
delete from reserv_user
where res_drv_tel1='011';

delete from reservation
where reserv_insurance='자차보험';*/


insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000001', '011','1111','1111', to_date('2017-05-12 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 13:30','yyyy/mm/dd hh24:mi'),'01허1234', '자차보험', '2017-04-01' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000002', '011','1111','1111', to_date('2017-05-11 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-15 18:30','yyyy/mm/dd hh24:mi'),'01허1111', '자차보험', '2017-04-08' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000003', '010','2200','2200', to_date('2017-05-12 19:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000004', '010','2200','2200', to_date('2017-05-12 18:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 18:23','yyyy/mm/dd hh24:mi'), '01허3333', '자차보험', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000005', '010','2200','2200', to_date('2017-05-12 17:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), '01허5555', '자차보험', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000006', '010','2200','2200', to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 18:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-05-01' ,'jin1');




insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001234', 'T5000001', '010', '1234', '1234', 'card', 59000, 'paid', '2017-05-12');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p002234', 'T5000002', '010', '1234', '1234', 'card', 62000, 'paid', '2017-05-12');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p100000', 'T5000003', '010', '1234', '1234', 'card', 55000, 'paid', '2017-05-12');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p200000', 'T5000004', '010', '1234', '1234', 'card', 10000, 'paid', '2017-05-12');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p300000', 'T5000005', '010', '1234', '1234', 'card', 20000, 'paid', '2017-05-12');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p003234', 'T5000006', '010', '1234', '1234', 'card', 30000, 'paid', '2017-05-12');


insert into reserv_user
values('T5000001', '김엄마', '011', '1111', '1111', 'kim2@naver.com', '김아빠', '011', '1112', '1112', '600102', '1종보통');
insert into reserv_user
values('T5000002', '김엄마', '011', '1111', '1111', 'kim2@naver.com', '최아빠', '011', '1112', '1112', '600102', '1종보통');
insert into reserv_user
values('T5000003', '진누나', '010', '2200', '2200', 'jin2@naver.com', '진남친', '011', '2200', '2201', '880106', '2종보통');
insert into reserv_user
values('T5000004', '진누나', '010', '2200', '2200', 'jin2@naver.com', '최오빠', '011', '2200', '2202', '880103', '2종보통');
insert into reserv_user
values('T5000005', '진누나', '010', '2200', '2200', 'jin2@naver.com', '최동생', '011', '2200', '2203', '880104', '2종보통');
insert into reserv_user
values('T5000006', '진누나', '010', '2200', '2200', 'jin2@naver.com', '최친구', '011', '2200', '2204', '880105', '2종보통');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000007', '010','4525','7444', to_date('2017-05-26 13:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-28 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-05-11' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p501001', 'T5000007', '010', '4525', '7444', 'card', 95000, 'paid', '2017-02-12');

insert into reserv_user
values('T5000007', '이희준', '010', '3543', '7723', 'kim2@naver.com', '이럭스', '010', '3333', '7554', '710802', '2종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000008', '010','5423','4782', to_date('2017-05-22 10:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-28 10:30','yyyy/mm/dd hh24:mi'), '01허6666', '자차보험', '2017-05-01' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p501002', 'T5000008', '010', '5423', '4782', 'card', 157000, 'paid', '2017-05-08');

insert into reserv_user
values('T5000008', '고한국', '010', '3322', '6744', 'kim2@naver.com', '이코카', '010', '3322', '6744', '710802', '1종보통');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000009', '010','5785','1278', to_date('2017-05-28 20:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-30 10:30','yyyy/mm/dd hh24:mi'), '01허2222', '자차보험', '2017-05-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p501003', 'T5000009', '010', '6478', '3456', 'card', 47000, 'paid', '2017-05-06');

insert into reserv_user
values('T5000009', '김희철', '010', '8456', '5444', 'kim2@naver.com', '김희철', '010', '8456', '5444', '830802', '1종보통');


insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000010', '010','5785','1278', to_date('2017-05-10 20:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-13 10:30','yyyy/mm/dd hh24:mi'), '02허2000', '자차보험', '2017-05-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p501004', 'T5000010', '010', '6478', '3456', 'card', 47000, 'paid', '2017-05-06');

insert into reserv_user
values('T5000010', '김희철', '010', '8456', '5444', 'kim2@naver.com', '김희철', '010', '8456', '5444', '830802', '1종보통');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000012', '010','1244','8044', to_date('2017-05-10 20:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-15 10:30','yyyy/mm/dd hh24:mi'), '02허3000', '자차보험', '2017-05-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p504005', 'T5000012', '010', '6478', '3456', 'card', 47000, 'paid', '2017-05-06');

insert into reserv_user
values('T5000012', '이희준', '010', '8456', '5444', 'kim2@naver.com', '이희준', '010', '1244', '8044', '830802', '1종보통');

commit;



select *from com_reservView;
/*
update companycaroption
set ccar_status = 'HOLD'
where ccar_Car_id='rentGo_0003' and com_id='rentGo';

update companycaroption
set ccar_status = 'HOLD'
where com_id='rentGo';
*/
update companycaroption
set ccar_status = 'HOLD'
where ccar_REntalcount = 1;

update companycaroption
set ccar_status = 'RENT'
where ccar_car_id= '02허2000';

update companycaroption
set ccar_status = 'RENT'
where ccar_car_id= '02허3000';

update companycaroption
set ccar_status = 'RENT'
where ccar_car_id= '01허1111';

select * from companycaroption;
select * from com_reservView;



desc com_reservview;

commit;