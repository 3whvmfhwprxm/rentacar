select * from usernotice order by unotice_no desc;

--���� ���� ���� �˻� ���
/*
ex)�˻�����. �Ⱓ:17.04.28~17.05.02  ����:���� 
1. Car���̺� -> �������� ��� �ҷ�����
        -> ex)���ڵ�-hd001(����ҳ�Ÿ17), hd002(����׼�Ʈ17), hd003(���k5_17)

2. Reservation���̺� -> �Ⱓ���� ������ �ִ� ȸ���� ccar_car_id ��� �ҷ�����
        -> ex) ccar_car_id - rentGo_0002
        
3. COMPANYCAROPTION ���̺� -> �� 1���ǿ� �ش��ϸ鼭 2���ǿ��� �ش����� �ʴ� ȸ������ ��� �ҷ�����
    +Company���̺�� join�ؼ� Company�� com_name ��ü�� ��������
*/
--1�� �˻� ����
select car_code from car
where car_type=1;

--2�� �˻� ����
select ccar_car_id from RESERVATION
where reserv_end_date >= '17-04-29' and reserv_start_date <= '17-05-01';

--3�� �˻� ����(1,2�� ����)
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

select * from RENT_ADMIN
order by admin_authcode desc;

insert into rent_admin(admin_id, admin_pwd, admin_name, admin_tel1, admin_tel2, admin_tel3, admin_email1, admin_email2, admin_authcode) 
values('adminkim', '1', 'Ŵ����', '010', '1231', '3212', 'gogo', 'naver.com', 3);

update RENT_ADMIN
set admin_tel1='012', admin_tel2='3321', admin_tel3='1111', admin_email1='22q', admin_email2='nate.com', admin_authcode=2  
where admin_id='coun1'

update RENT_ADMIN
set admin_outdate=sysdate
where admin_id='coun1';

rollback;

select * from rent_admin where admin_id='coun4';