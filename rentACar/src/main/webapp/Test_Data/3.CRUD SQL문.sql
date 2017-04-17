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

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, user_id)
values(lpad(Reservation_seq.nextval, 8, '0'), '011','2212','2212', '2017-05-15', 15, 
'2017-05-16', 17, 'rentGo_0002', '��������', 'jin1')
RETURNING reserv_num into ;

INSERT INTO SequenceTest_Table (ID, OtherColumn)
VALUES (SequenceTest_Sequence.NEXTVAL, :OtherColumn)
RETURNING ID INTO :ID
