--�׽�Ʈ ������ �غ�

--������ ���
insert into ad_grade values(1,'�ְ������');
insert into ad_grade values(2,'�ΰ�����');
insert into ad_grade values(3,'�����');
insert into ad_grade values(4,'����');
insert into ad_grade values(5,'��Ÿ');
commit;
select * from ad_grade;


--������ - �ý��� �ְ� ������: �����ڵ�(1)/ �ΰ�����: (2) / �����: �����ڵ�(3) / ����: �����ڵ�(4) / ��Ÿ: �����ڵ�(5)
--�ý��� ������ 3��
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin1','1','�����','010','0001','0001','admin1@naver.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin2','2','�����2','010','0002','0002','admin2@nate.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin3','3','�����3','010','0003','0003','admin3@gmail.com', sysdate,'1');

--����� ������ 2��
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('jang1','1','������1','010','0011','0011','jang1@naver.com', sysdate,'2');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('jang2','2','������2','010','0022','0022','jang2@naver.com', sysdate,'2');

--���� ������ 4��
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun1','1','���ȭ1','010','0111','0111','coun11@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun2','2','���ȭ2','010','0222','0222','coun22@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun3','3','���ȭ3','010','0333','0333','coun33@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun4','4','���ȭ4','010','0444','0444','coun44@naver.com', sysdate,'3');

select * from rent_admin;
commit;

--����� rent_user
delete from rent_user;
insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('kim1','kim123','�谡��','kim@naver.com','010','1111','1111','1980-08-08','��⵵','��','1������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('jin1','jin123','������','jim@gmail.com','010','2222','2222','1990-06-02','��û��','��','2������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('lee1','lee123','�̰���','lee@nate.com','010','3333','3333','2000-01-02','������','��','1������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate, user_outdate)
values('kimout1','kim123','��Ż��','kimout@out.com','010','4444','4444','1970-05-05','����','��','2������', sysdate, sysdate);

select * from rent_user;
commit;

--��㳻��. ȸ�� 2���� ���� 2���� ���� 1���� ����� �� 4��
--��ȸ�� 1���� �� ���� 2���� ���Ǹ� 1���� ����� �� 2��
--counsel_category ���������:'��Ÿ', '����', '����', 'ȯ��', '����Ʈ����', '�̺�Ʈ', '���񽺺Ҹ�'  
delete from counsel;

--ȸ�������� ���
insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(1, 'kim1' ,'010','1111','1111','����','������ ���� Ȯ���ϴ� ����� ���� ����', sysdate,
'Ȩ���������� �α����Ͻð� Ȯ���ϴ� ����� �˷��帲','Y','coun1');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(2, 'kim1' ,'010','1111','1111','����','������ �ʹ� �μ� �ǽɵǼ� ����', sysdate,
'���󰡰��̶�� �亯�帲','Y','coun2');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(3, 'jin1' ,'010','2222','2222','��Ÿ','��ȭ�� ������ ������� ���� ���λ翡 ���� �����Ͻ�', sysdate,
'�������� ��ȭ�� ������ ������ ���ٰ� �亯','N','coun1');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(4, 'jin1' ,'010','2222','2222','��Ÿ','��ȭ�� �弳��', sysdate,
'���ǳ����� ���� ���ӵǴ� �弳�� ��ȭ�� ���̻� �Ұ���','N','coun2');

--��ȸ�������� ���
insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(5,'010','1100','1100','���񽺺Ҹ�','���ͳ��� �ȵǴµ� ���񽺰� �ȵȴٰ� ����', sysdate,
'���ͳ��� ���� ����Ǽž� ����Ҽ� �ִٰ� �亯 �帲','Y','coun1');
insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(6,'010','1100','1100','�̺�Ʈ','�̺�Ʈ ���� ��� �ϴ��� ����', sysdate,
'ȸ���� �����ϱ⿡ ������ �䱸�ȴٰ� �亯�帲','Y','coun1');

--Ż��ȸ���� �������
insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(7, 'kimout1' ,'010','4444','4444','��Ÿ','��ȭ�� �弳��', sysdate,
'�弳�� ��ӵǽø� ��ҵǽ� �� �ִٰ� �亯�帮�� �˼��ϴٰ� �����Ͻ�','Y','coun2');

select * from counsel;
commit;

--���� ����
insert into car_category values(1,'����');
insert into car_category values(2,'����');
insert into car_category values(3,'������');
insert into car_category values(4,'����');
insert into car_category values(5,'���');
insert into car_category values(6,'RV/SUV');
insert into car_category values(7,'����');
commit;
select * from car_category;
select * from car;

select *
from car_category, car
where car_category_num=car_type
and car_category_num=1;

--�� �� �Է� ������ 2����, ����� 2����, ������ 1����
delete from car;

insert into car
values('hd001', '����ҳ�Ÿ17', '����', 4, 'AUTO', sysdate, 4, 'hd00101.jpg');

insert into car
values('hd002', '����׼�Ʈ17', '����', 4, 'AUTO', sysdate, 3, 'hd00201.jpg');

insert into car
values('kia001', '���k5_17', 'KIA', 4, 'Trans', sysdate, 4, 'kia00101.jpg');

insert into car
values('kia002', '��ƴ����_17', 'KIA', 4, 'AUTO', sysdate, 2, 'kia00201.jpg');

insert into car
values('lambo001', '���������_���ĭ', 'Lamborghini', 2, 'Trans', sysdate, 5, 'lb00101.jpg');

select * from car;
commit;


--��Ʈ ��ü 2�� ����, 1�� ��ü Ż���ü
--(���¹�ȣ �÷��� ���µ� �Ƹ� �ʿ��Ұ����� �����) - 17-04-13 ���¹�ȣ �÷� �߰���, logo, regdate �÷� ��ġ ����
delete from company;
insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email, com_logo, com_regdate)
values('rentZoa', '��Ʈ����', '1', '100-81-02000', '����:289333-01-22212', '02', '0100', '0100', '010', '0100', '0100',  '02', '0100', '0101', 
'���ֵ� �Ѷ�� �Ʒ�', '�跻Ʈ', 'rentZoa1@rentZoa.com', 'rentZoa_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email, com_logo, com_regdate)
values('rentGo', '��Ʈ��', '1', '100-81-03000', '����:22222-02-22222', '02', '0200', '0200', '010', '0200', '0200',  '02', '0200', '0201', 
'���ֵ� �Ѷ�� �Ʒ�', '�̷�Ʈ', 'rentGo1@rentGo.com', 'rentGo_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email, com_logo, com_regdate,  com_outdate)
values('rentDie', '��Ʈ����', '1', '100-81-00000', '����:3333-03-33333', '02', '0300', '0300', '010', '0300', '0300',  '02', '0300', '0301', 
'���ְ��� ��ó', '�ڷ�Ʈ', 'rentDie1@rentDie.com', 'rentDie_logo.png', sysdate, sysdate);
select * from company;
commit;


--��ü �������� //�ֹ߷�, ����, LPG, ����, ���̺긮��
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentZoa_0001','hd001', 'rentZoa', 'N', '�ֹ߷�', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 30000, 40000, 60000, 80000, 5000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentZoa_0002','kia002', 'rentZoa', 'N', '�ֹ߷�','Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0001','hd001', 'rentGo', 'N', '�ֹ߷�','N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 25000, 30000, 50000, 70000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0002','kia002', 'rentGo', 'N', '�ֹ߷�', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0003','lambo001', 'rentGo', 'Y', '�ֹ߷�', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 60000, 70000, 80000, 90000, 10000, '2017-01-02');

select * from companycaroption;
commit;


--���� ����
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('001', '011','1111','1111', '2017-05-10', 09, 
'2017-05-13', 13, 'rentGo_0003', '��������', sysdate ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('002', '010','2200','2200', '2017-04-30', 15, 
'2017-05-02', 17, 'rentGo_0002', '��������', sysdate ,'jin1');

select * from RESERVATION;
commit;

--���� ȸ��(ȸ�������ʹ� �ٸ� �����ϴ� �����)
--��) ȸ��(�ڽ�), ������/������ ������ ������(������-����, ������-�ƺ�)������ �ְ�

insert into reserv_user
values('001', '�����', '011', '1111', '1111', 'kim2@naver.com', '��ƺ�', '011', '1112', '1112', '600102', '1������');
insert into reserv_user
values('002', '������', '010', '2200', '2200', 'jin2@naver.com', '����ģ', '011', '2200', '2201', '880102', '2������');

select * from reserv_user;
commit;

--��ü ����
delete from companynotice;
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(1, '��ü�� �����Խ��� ù��° ��!', '��ü�� ������ ����!!', 'admin1', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(2, '��ü�� �����Խ��� �ι�° ��!', '��ü�� ������ ���� 2!!', 'admin2', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(3, '��ü�� �����Խ��� ����° ��!', '��ü�� ������ ���� 3!!', 'admin1', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount, cnotice_deldate)
values(4, '������ ��ü�� �����Խ��� �׹�° ��!', '��ü�� �������� ���� 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from companynotice order by cnotice_no desc;
commit;

--�Ϲ� ����
delete from usernotice;
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(1, '���� �����Խ��� ù��° ��!', '���� ������ ����!!', 'admin1', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(2, '���� �����Խ��� �ι�° ��!', '���� ������ ���� 2!!', 'admin2', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(3, '���� �����Խ��� ����° ��!', '���� ������ ���� 3!!', 'admin1', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount, unotice_deldate)
values(4, '������ ���� �����Խ��� �׹�° ��!', '���� �������� ���� 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from usernotice order by unotice_no desc;
commit;

--���� ����
delete from servicecenternotice;
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(1, '����� �����Խ��� ù��° ��!', '���簡 ������ ����!!', 'admin1', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(2, '����� �����Խ��� �ι�° ��!', '���簡 ������ ���� 2!!', 'admin2', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(3, '����� �����Խ��� ����° ��!', '���簡 ������ ���� 3!!', 'admin1', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount, scnotice_deldate)
values(4, '������ ���� �����Խ��� �׹�° ��!', '���簡 �������� ���� 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from servicecenternotice order by scnotice_no desc;
commit;

--�̺�Ʈ ����
insert into event(event_num, event_title, event_content, admin_id, event_start_date, event_end_date,
event_image1, event_image2)
values(event_seq.nextval, '�̺�Ʈ ����: ���̺�Ʈ', '�̺�Ʈ ����: �賻��', 'admin2', '2017-05-01', '2017-05-10', 
'eimage1.jpg', 'eimage2.jpg');

insert into event(event_num, event_title, event_content, admin_id, event_start_date, event_end_date,
event_image1, event_image2)
values(event_seq.nextval, '�̺�Ʈ ����: �� ���� �̺�Ʈ', '�̺�Ʈ ����: ���Ե鿡�� �������� ...', 'admin1', '2017-05-01', '2017-05-10', 
'eimage11.jpg', 'eimage22.jpg');

select * from event order by event_num desc;
commit;

--����ı�
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2)
values(cmt_seq.nextval, '�̹��� ��ôµ� ���� ���Ҿ��!', 'kim1', 'rentZoa', 4, 4, 5, '�ı�1.jpg', '�ı�2.jpg');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2)
values(cmt_seq.nextval, '�������� ����ϰ� ���� �ʳ׿�...�ʹ� ���������', 'jin1', 'rentGo', 3, 1, 3, '������1.jpg', '������2.jpg');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2)
values(cmt_seq.nextval, '�׳� ���� ������ ����?', 'lee1', 'rentGo', 3, 3, 3, '', '');

select * from COMMENTS;
commit;


--��������
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p00123', '001', '010', '1234', '1234', 'card', 100, 'paid', '2017-04-22');

select * from PAYINFO;
commit;
rollback;


--ȸ�����


select * from user_sequences;