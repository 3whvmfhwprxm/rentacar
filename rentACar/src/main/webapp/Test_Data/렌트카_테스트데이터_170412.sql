--테스트 데이터 준비

--관리자 - 시스템 관리자: 권한코드(1)/ 상담장: 권한코드(2) / 상담사: 권한코드(3)
--시스템 관리자 3명
delete from rent_admin cascade;
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin1','1','김관리','010','0001','0001','admin1','naver.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin2','2','김관리2','010','0002','0002','admin2','nate.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('admin3','3','김관리3','010','0003','0003','admin3','gmail.com', sysdate,'1');

--상담장 관리자 2명
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jang1','1','김상담장1','010','0011','0011','jang1','naver.com', sysdate,'2');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('jang2','2','김상담장2','010','0022','0022','jang2','naver.com', sysdate,'2');

--상담사 관리자 4명
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun1','1','김대화1','010','0111','0111','coun11','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun2','2','김대화2','010','0222','0222','coun22','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun3','3','김대화3','010','0333','0333','coun33','naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email1,admin_email2,admin_regdate,admin_authcode)
values('coun4','4','김대화4','010','0444','0444','coun44','naver.com', sysdate,'3');

select * from rent_admin;
commit;

--사용자 rent_user
delete from rent_user;
insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('kim1','kim123','김가입','kim','naver.com','010','1111','1111','1980-08-08','경기도','남','1종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('jin1','jin123','진가입','jim','gmail.com','010','2222','2222','1990-06-02','충청도','남','2종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('lee1','lee123','이가입','lee','nate.com','010','3333','3333','2000-01-02','강원도','여','1종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email1,user_email2,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate, user_outdate)
values('kimout1','kim123','김탈퇴','kimout','out.com','010','4444','4444','1970-05-05','서울','남','2종보통', sysdate, sysdate);

select * from rent_user;
commit;

--상담내용. 회원 2명이 상담사 2명에게 각각 1번씩 상담함 총 4개
--비회원 1명이 각 상담사 2명에게 문의를 1번씩 상담함 총 2개
--counsel_category 상담종류는:'기타', '예약', '가격', '환불', '사이트사용법', '이벤트', '서비스불만'  
delete from counsel;

--회원유저의 상담
insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(1, 'kim1' ,'010','1111','1111','예약','예약한 내용 확인하는 방법에 대해 문의', sysdate,
'홈페이지에서 로그인하시고 확인하는 방법을 알려드림','Y','coun1');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(2, 'kim1' ,'010','1111','1111','가격','가격이 너무 싸서 의심되서 문의', sysdate,
'정상가격이라고 답변드림','Y','coun2');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(3, 'jin1' ,'010','2222','2222','기타','전화로 업무와 상관없는 상담사 개인사에 대해 문의하심', sysdate,
'지속적인 전화로 업무와 관련이 없다고 답변','N','coun1');

insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(4, 'jin1' ,'010','2222','2222','기타','전화로 욕설함', sysdate,
'문의내용이 없이 지속되는 욕설로 통화가 더이상 불가능','N','coun2');

--비회원유저의 상담
insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(5,'010','1100','1100','서비스불만','인터넷이 안되는데 서비스가 안된다고 문의', sysdate,
'인터넷이 먼저 연결되셔야 사용할수 있다고 답변 드림','Y','coun1');
insert into Counsel(counsel_id, user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(6,'010','1100','1100','이벤트','이벤트 적용 어떻게 하는지 문의', sysdate,
'회원만 가능하기에 가입이 요구된다고 답변드림','Y','coun1');

--탈퇴회원의 예전상담
insert into Counsel(counsel_id, user_id,user_tel1 ,user_tel2 ,user_tel3 ,counsel_category, 
	counsel_content ,counsel_regdate ,counsel_result ,counsel_result_flag,admin_id)
values(7, 'kimout1' ,'010','4444','4444','기타','전화로 욕설함', sysdate,
'욕설이 계속되시면 고소되실 수 있다고 답변드리니 죄송하다고 말씀하심','Y','coun2');

select * from counsel;
commit;

--차 모델 입력 현대차 2종류, 기아차 2종류, 외제차 1종류
--차량 유형 소형(0), 중형(1), 대형(2), 특대형(3), 특수차(4), 고급(5)
delete from car;
insert into car
values('hd001', '현대소나타17', '현대', '휘발류', 
        4, '2017-01-01', 'AUTO', sysdate, 1, 'hd00101.jpg', 'hd00102.jpg', 'hd00103.jpg');
insert into car
values('hd002', '현대액센트17', '현대', '디젤', 
        4, '2017-01-01', 'AUTO', sysdate, 1, 'hd00201.jpg', 'hd00202.jpg', 'hd00203.jpg');
insert into car
values('kia001', '기아k5_17', 'KIA', '휘발류', 
        4, '2017-01-01', 'Trans', sysdate, 1, 'kia00101.jpg', 'kia00102.jpg', 'kia00103.jpg');
        insert into car
values('kia002', '기아뉴모닝_17', 'KIA', '휘발류', 
        4, '2017-01-01', 'AUTO', sysdate, 0, 'kia00201.jpg', 'kia00202.jpg', 'kia00203.jpg');
        insert into car
values('lambo001', '람보르기니_우라칸', 'Lamborghini', '휘발류', 
        2, '2017-01-01', 'Trans', sysdate, 5, 'lb00101.jpg', 'lb00102.jpg', 'lb00103.jpg');
select * from car;
commit;


--렌트 업체 2개 정상운영, 1개 업체 탈퇴업체
--(계좌번호 컬럼이 없는데 아마 필요할것으로 예상됨) - 17-04-13 계좌번호 컬럼 추가됨, logo, regdate 컬럼 위치 수정
delete from company;
insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_logo, com_regdate)
values('rentZoa', '렌트조아', '1', '100-81-02000', '국민:289333-01-22212', '02', '0100', '0100', '010', '0100', '0100',  '02', '0100', '0101', 
'제주도 한라산 아래', '김렌트', 'rentZoa1', 'rentZoa.com', 'rentZoa_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_logo, com_regdate)
values('rentGo', '렌트고', '1', '100-81-03000', '농협:22222-02-22222', '02', '0200', '0200', '010', '0200', '0200',  '02', '0200', '0201', 
'제주도 한라산 아래', '이렌트', 'rentGo1', 'rentGo.com', 'rentGo_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_ceo, com_email1, com_email2, com_logo, com_regdate,  com_outdate)
values('rentDie', '렌트죽음', '1', '100-81-00000', '신한:3333-03-33333', '02', '0300', '0300', '010', '0300', '0300',  '02', '0300', '0301', 
'제주공항 근처', '박렌트', 'rentDie1', 'rentDie.com', 'rentDie_logo.png', sysdate, sysdate);
select * from company;
commit;

--예약 회원(회원정보와는 다른 예약하는 당사자)
--예) 회원(자식), 예약자/운전자 정보를 받을때(예약자-엄마, 운전자-아빠)받을수 있게

insert into reserv_user
values('kim1', '김엄마', '011', '1111', '1111', 'kim2', 'naver.com', '김아빠', '011', '1112', '1112', '600102', '1종보통', sysdate);
insert into reserv_user
values('jin1', '진누나', '010', '2200', '2200', 'jin2', 'naver.com', '진남친', '011', '2200', '2201', '880102', '2종보통', sysdate);
insert into reserv_user
values('lee1', '이친구1', '017', '3300', '3300', 'lee2', 'naver.com', '이친구2', '011', '3300', '3301', '900102', '1종보통', sysdate);

select * from reserv_user;
commit;

--업체 차량정보
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentZoa_0001','hd001', 'rentZoa', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 30000, 40000, 60000, 80000, 5000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentZoa_0002','kia002', 'rentZoa', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0001','hd001', 'rentGo', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 25000, 30000, 50000, 70000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0002','kia002', 'rentGo', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('rentGo_0003','lambo001', 'rentGo', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 1, 60000, 70000, 80000, 90000, 10000, '2017-01-02');

select * from companycaroption;
commit;


--예약 정보
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('001', '011','1111','1111', '2017-05-10', 09, 
'2017-05-13', 13, 'rentGo_0003', '자차보험', sysdate ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, 
reserv_start_date, reserv_start_time, reserv_end_date, reserv_end_time, 
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('002', '010','2200','2200', '2017-04-30', 15, 
'2017-05-02', 17, 'rentGo_0002', '자차보험', sysdate ,'jin1');

select * from RESERVATION;
commit;

--업체 공지
delete from companynotice;
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(1, '업체용 공지게시판 첫번째 글!', '업체가 봐야할 내용!!', 'admin1', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(2, '업체용 공지게시판 두번째 글!', '업체가 봐야할 내용 2!!', 'admin2', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount)
values(3, '업체용 공지게시판 세번째 글!', '업체가 봐야할 내용 3!!', 'admin1', sysdate, 'Y', 0);
insert into companynotice(cnotice_no, cnotice_title, cnotice_content, admin_id, cnotice_regdate, cnotice_visible, cnotice_readcount, cnotice_deldate)
values(4, '삭제된 업체용 공지게시판 네번째 글!', '업체가 볼수없는 내용 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from companynotice order by cnotice_no desc;
commit;

--일반 공지
delete from usernotice;
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(1, '고객용 공지게시판 첫번째 글!', '고객이 봐야할 내용!!', 'admin1', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(2, '고객용 공지게시판 두번째 글!', '고객이 봐야할 내용 2!!', 'admin2', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount)
values(3, '고객용 공지게시판 세번째 글!', '고객이 봐야할 내용 3!!', 'admin1', sysdate, 'Y', 0);
insert into usernotice(unotice_no, unotice_title, unotice_content, admin_id, unotice_regdate, unotice_visible, unotice_readcount, unotice_deldate)
values(4, '삭제된 고객용 공지게시판 네번째 글!', '고객이 볼수없는 내용 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from usernotice order by unotice_no desc;
commit;

--상담사 공지
delete from servicecenternotice;
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(1, '상담사용 공지게시판 첫번째 글!', '상담사가 봐야할 내용!!', 'admin1', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(2, '상담사용 공지게시판 두번째 글!', '상담사가 봐야할 내용 2!!', 'admin2', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount)
values(3, '상담사용 공지게시판 세번째 글!', '상담사가 봐야할 내용 3!!', 'admin1', sysdate, 'Y', 0);
insert into servicecenternotice(scnotice_no, scnotice_title, scnotice_content, admin_id, scnotice_regdate, scnotice_visible, scnotice_readcount, scnotice_deldate)
values(4, '삭제된 상담사 공지게시판 네번째 글!', '상담사가 볼수없는 내용 4!!', 'admin1', sysdate, 'N', 0, sysdate);

select * from servicecenternotice order by scnotice_no desc;
commit;

--결제 정보

--이벤트 정보

--회원등급

--사용후기




