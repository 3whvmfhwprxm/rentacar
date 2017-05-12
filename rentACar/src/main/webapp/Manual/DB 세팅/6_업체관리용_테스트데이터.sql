select * from reservation;
select * from payinfo;
select * from reserv_user;

/*
delete from payinfo
where pay_condition='paid';

delete from reserv_user
where res_drv_tel1='010';
delete from reserv_user
where res_drv_tel1='011';

delete from reservation
where reserv_insurance='��������';*/


insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000001', '011','1111','1111', to_date('2017-05-12 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 13:30','yyyy/mm/dd hh24:mi'),'01��1234', '��������', '2017-04-01' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000002', '011','1111','1111', to_date('2017-05-11 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-15 18:30','yyyy/mm/dd hh24:mi'),'01��1111', '��������', '2017-04-08' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000003', '010','2200','2200', to_date('2017-05-12 19:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), '01��2222', '��������', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000004', '010','2200','2200', to_date('2017-05-12 18:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 18:23','yyyy/mm/dd hh24:mi'), '01��3333', '��������', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000005', '010','2200','2200', to_date('2017-05-12 17:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), '������5555', '��������', '2017-05-01' ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('T5000006', '010','2200','2200', to_date('2017-05-12 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-12 18:30','yyyy/mm/dd hh24:mi'), '01��6666', '��������', '2017-05-01' ,'jin1');




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
values('T5000001', '�����', '011', '1111', '1111', 'kim2@naver.com', '��ƺ�', '011', '1112', '1112', '600102', '1������');
insert into reserv_user
values('T5000002', '�����', '011', '1111', '1111', 'kim2@naver.com', '�־ƺ�', '011', '1112', '1112', '600102', '1������');
insert into reserv_user
values('T5000003', '������', '010', '2200', '2200', 'jin2@naver.com', '����ģ', '011', '2200', '2201', '880106', '2������');
insert into reserv_user
values('T5000004', '������', '010', '2200', '2200', 'jin2@naver.com', '�ֿ���', '011', '2200', '2202', '880103', '2������');
insert into reserv_user
values('T5000005', '������', '010', '2200', '2200', 'jin2@naver.com', '�ֵ���', '011', '2200', '2203', '880104', '2������');
insert into reserv_user
values('T5000006', '������', '010', '2200', '2200', 'jin2@naver.com', '��ģ��', '011', '2200', '2204', '880105', '2������');



select *from com_reservView;
/*
update companycaroption
set ccar_status = 'HOLD'
where ccar_Car_id='rentGo_0003' and com_id='rentGo';

update companycaroption
set ccar_status = 'HOLD'
where com_id='rentGo';
*/
select * from companycaroption;

desc com_reservview;

commit;