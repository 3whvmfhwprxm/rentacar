select*from reservation;
select*from payinfo;
select*from reserv_user;
select*from COMPANYCAROPTION;

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000016', '010','2157','2630', to_date('2017-02-05 13:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-07 18:30','yyyy/mm/dd hh24:mi'), '01��1234', '��������', '2017-02-01' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201000', 'T2000016', '010', '2157', '2630', 'card', 75000, 'paid', '2017-02-01');

insert into reserv_user
values('T2000016', '����', '010', '5341', '2322', 'kim2@naver.com', '��ƺ�', '011', '4373', '1112', '801103', '2������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000017', '010','1620','5632', to_date('2017-02-09 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-10 11:30','yyyy/mm/dd hh24:mi'), '01��1111', '��������', '2017-02-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201001', 'T2000017', '010', '4621', '2440', 'card', 65000, 'paid', '2017-02-06');

insert into reserv_user
values('T2000017', '�ٵ�', '010', '5641', '2241', 'kim2@naver.com', '��ٵ�', '011', '1112', '1112', '810102', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000018', '010','2675','2485', to_date('2017-02-10 09:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-14 11:30','yyyy/mm/dd hh24:mi'), '03��1235', '��������', '2017-02-09' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201002', 'T2000018', '010', '2675', '2485', 'card', 124500, 'paid', '2017-02-09');

insert into reserv_user
values('T2000018', '����Ŀ', '010', '4466', '5544', 'kim2@naver.com', '�̿���', '011', '5353', '4455', '780114', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000019', '010','4578','3524', to_date('2017-02-18 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-20 16:30','yyyy/mm/dd hh24:mi'), '02��5000', '��������', '2017-02-10' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201003', 'T2000019', '010', '4578', '3524', 'card', 64000, 'paid', '2017-02-10');

insert into reserv_user
values('T2000019', '��ũ��', '010', '4466', '5544', 'kim2@naver.com', '��ũ��', '011', '5353', '4455', '780114', '2������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000020', '010','7822','1358', to_date('2017-02-26 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-28 10:30','yyyy/mm/dd hh24:mi'), '01��2222', '��������', '2017-02-12' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201004', 'T2000020', '010', '7822', '1358', 'card', 26700, 'paid', '2017-02-12');

insert into reserv_user
values('T2000020', '��Ű��', '010', '4416', '4444', 'kim2@naver.com', '��Ű��', '010', '5553', '1155', '930614', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000021', '010','4562','7222', to_date('2017-02-17 17:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-18 10:30','yyyy/mm/dd hh24:mi'), '01��3333', '��������', '2017-02-10' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201005', 'T2000021', '010', '4562', '7222', 'card', 78000, 'paid', '2017-02-10');

insert into reserv_user
values('T2000021', 'ȫ��Ű', '010', '2451', '6353', 'kim2@naver.com', '�ڹ�Ű', '010', '3553', '5435', '820911', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000022', '010','6436','6364', to_date('2017-02-19 15:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-22 13:30','yyyy/mm/dd hh24:mi'), '01��4444', '��������', '2017-02-14' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201006', 'T2000022', '010', '6436', '6364', 'card', 57800, 'paid', '2017-02-14');

insert into reserv_user
values('T2000022', '��ȣ��', '010', '3522', '2323', 'kim2@naver.com', '��ȣ��', '010', '5533', '7754', '870911', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000023', '010','6361','1423', to_date('2017-02-23 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-24 10:30','yyyy/mm/dd hh24:mi'), '02��4000', '��������', '2017-02-15' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201007', 'T2000023', '010', '6361', '1423', 'card', 87000, 'paid', '2017-02-15');

insert into reserv_user
values('T2000023', '���Һ�', '010', '3543', '7723', 'kim2@naver.com', '���Һ�', '010', '3333', '7554', '710802', '2������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000024', '010','4321','6646', to_date('2017-02-26 08:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-27 10:30','yyyy/mm/dd hh24:mi'), '01��6666', '��������', '2017-02-11' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201008', 'T2000024', '010', '4321', '6646', 'card', 87000, 'paid', '2017-02-11');

insert into reserv_user
values('T2000024', '¡ũ��', '010', '3543', '7723', 'kim2@naver.com', '����', '010', '3333', '7554', '710802', '2������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000025', '010','5423','4782', to_date('2017-02-12 10:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-16 10:30','yyyy/mm/dd hh24:mi'), '01��6666', '��������', '2017-02-08' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201009', 'T2000025', '010', '5423', '4782', 'card', 157000, 'paid', '2017-02-08');

insert into reserv_user
values('T2000025', '�䷹Ÿ', '010', '3322', '6744', 'kim2@naver.com', '����Ÿ', '010', '3322', '6744', '710802', '1������');
--
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T2000026', '010','6478','3456', to_date('2017-02-11 11:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-02-14 10:30','yyyy/mm/dd hh24:mi'), '01��2222', '��������', '2017-02-06' ,'kim1');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p201010', 'T2000026', '010', '6478', '3456', 'card', 47000, 'paid', '2017-02-06');

insert into reserv_user
values('T2000026', '����ö', '010', '8456', '5444', 'kim2@naver.com', '����ö', '010', '8456', '5444', '830802', '1������');

commit;





