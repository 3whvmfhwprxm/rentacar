--�׽�Ʈ ������ �غ�

--������ - �ý��� ������: �����ڵ�(1)/ �����: �����ڵ�(2) / ����: �����ڵ�(3)
--�ý��� ������ 3��
delete from rent_admin cascade;
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin1','1','�����','010','0001','0001','admin1','naver.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin2','2','�����2','010','0002','0002','admin2','nate.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin3','3','�����3','010','0003','0003','admin3','gmail.com', sysdate,'1');

--����� ������ 2��
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jang1','1','������1','010','0011','0011','jang1','naver.com', sysdate,'2');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jang2','2','������2','010','0022','0022','jang2','naver.com', sysdate,'2');

--���� ������ 4��
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun1','1','���ȭ1','010','0111','0111','coun11','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun2','2','���ȭ2','010','0222','0222','coun22','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun3','3','���ȭ3','010','0333','0333','coun33','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun4','4','���ȭ4','010','0444','0444','coun44','naver.com', sysdate,'3');

select * from rent_admin;
commit;

--����� rent_user
delete from rent_user;
insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('kim1','kim123','�谡��','kim','naver.com','010','1111','1111','1980-08-08','��⵵','��','1������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('jin1','jin123','������','jim','gmail.com','010','2222','2222','1990-06-02','��û��','��','2������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('lee1','lee123','�̰���','lee','nate.com','010','3333','3333','2000-01-02','������','��','1������', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate, user_outdate)
values('kimout1','kim123','��Ż��','kimout','out.com','010','4444','4444','1970-05-05','����','��','2������', sysdate, sysdate);

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

--�� �� �Է� ������ 2����, ����� 2����, ������ 1����
--���� ���� ����(0), ����(1), ����(2), Ư����(3), Ư����(4)
delete from car;
insert into car
values('hd001', '����ҳ�Ÿ17', '����', '�ֹ߷�', 
        4, '2017-01-01', 'AUTO', sysdate, 1, 'hd00101.jpg', 'hd00102.jpg', 'hd00103.jpg');
insert into car
values('hd002', '����׼�Ʈ17', '����', '����', 
        4, '2017-01-01', 'AUTO', sysdate, 1, 'hd00201.jpg', 'hd00202.jpg', 'hd00203.jpg');
insert into car
values('kia001', '���k5_17', 'KIA', '�ֹ߷�', 
        4, '2017-01-01', 'Trans', sysdate, 1, 'kia00101.jpg', 'kia00102.jpg', 'kia00103.jpg');
        insert into car
values('kia002', '��ƴ����_17', 'KIA', '�ֹ߷�', 
        4, '2017-01-01', 'AUTO', sysdate, 1, 'kia00201.jpg', 'kia00202.jpg', 'kia00203.jpg');
        insert into car
values('lambo001', '���������_���ĭ', 'Lamborghini', '�ֹ߷�', 
        2, '2017-01-01', 'Trans', sysdate, 1, 'lb00101.jpg', 'lb00102.jpg', 'lb00103.jpg');
select * from car;
commit;


--��Ʈ ��ü 2�� ����, 1�� ��ü Ż���ü
--(���¹�ȣ �÷��� ���µ� �Ƹ� �ʿ��Ұ����� �����)
delete from company;
insert into company(com_id, com_name, com_pwd, com_num, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_regdate, com_logo)
values('rentZoa', '��Ʈ����', '1', '100-81-02000', '02', '0100', '0100', '010', '0100', '0100',  '02', '0100', '0101', 
'���ֵ� �Ѷ�� �Ʒ�', '�跻Ʈ', 'rentZoa1', 'rentZoa.com', sysdate, 'rentZoa_logo.png');

insert into company(com_id, com_name, com_pwd, com_num, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_regdate, com_logo)
values('rentGo', '��Ʈ��', '1', '100-81-03000', '02', '0200', '0200', '010', '0200', '0200',  '02', '0200', '0201', 
'���ֵ� �Ѷ�� �Ʒ�', '�̷�Ʈ', 'rentGo1', 'rentGo.com', sysdate, 'rentGo_logo.png');

insert into company(com_id, com_name, com_pwd, com_num, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_regdate, com_logo, com_outdate)
values('rentDie', '��Ʈ����', '1', '100-81-00000', '02', '0300', '0300', '010', '0300', '0300',  '02', '0300', '0301', 
'���ְ��� ��ó', '�ڷ�Ʈ', 'rentDie1', 'rentDie.com', sysdate, 'rentDie_logo.png', sysdate);
select * from company;
commit;



--��ü ��������

--���� ����

--���� ȸ��(ȸ�������ʹ� �ٸ� �����ϴ� �����)
--��) ȸ��(�ڽ�), ������/������ ������ ������(������-����, ������-�ƺ�)������ �ְ�

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

--���� ����

--�̺�Ʈ ����

--ȸ�����

--����ı�




