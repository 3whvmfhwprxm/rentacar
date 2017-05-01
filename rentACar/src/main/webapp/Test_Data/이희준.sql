insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('001', '011','1111','1111', to_date('2017-05-10 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-13 13:30','yyyy/mm/dd hh24:mi'),'rentGo_0003', '자차보험', sysdate ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('002', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 14:30','yyyy/mm/dd hh24:mi'), 'rentGo_0002', '자차보험', sysdate ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('003', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 14:30','yyyy/mm/dd hh24:mi'), 'rentGo_0002', '자차보험', sysdate ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('004', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 14:30','yyyy/mm/dd hh24:mi'), 'rentGo_0002', '자차보험', sysdate ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('005', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 14:30','yyyy/mm/dd hh24:mi'), 'rentGo_0002', '자차보험', sysdate ,'jin1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('006', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 14:30','yyyy/mm/dd hh24:mi'), 'rentGo_0002', '자차보험', sysdate ,'jin1');


insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p00123', '001', '010', '1234', '1234', 'card', 100, 'paid', '2017-04-22');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_discount, pay_condition, pay_regdate)
values('p00128', '002', '010', '1234', '1234', 'card', 100, 20, 'paid', '2017-04-22');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_discount, pay_condition, pay_regdate)
values('p00124', '003', '010', '1234', '1234', 'card', 100, 0, 'paid', '2017-04-22');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_discount, pay_condition, pay_regdate)
values('p00125', '004', '010', '1234', '1234', 'card', 100, 0, 'paid', '2017-04-22');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_discount, pay_condition, pay_regdate)
values('p00126', '005', '010', '1234', '1234', 'card', 100, 0, 'paid', '2017-04-22');

insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_discount, pay_condition, pay_regdate)
values('p00127', '006', '010', '1234', '1234', 'card', 100, 0, 'paid', '2017-04-22');