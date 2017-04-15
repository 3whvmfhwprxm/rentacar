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

--2�� �˻� ����
select ccar_car_id from RESERVATION
where reserv_end_date >= '17-04-29' and reserv_start_date <= '17-05-01';

--1�� �˻� ����
select car_code from car
where car_type=1;

--3�� �˻� ����
select * from COMPANYCAROPTION
where car_code in (
select car_code from car
where car_type=1
) 
and ccar_car_id not in (
select ccar_car_id from RESERVATION
where reserv_end_date >= '17-04-29' and reserv_start_date <= '17-05-01'
);