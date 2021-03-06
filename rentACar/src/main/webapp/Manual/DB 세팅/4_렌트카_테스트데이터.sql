--테스트 데이터 준비

--관리자 등급
insert into ad_grade values(1,'최고관리자');
insert into ad_grade values(2,'부관리자');
insert into ad_grade values(3,'상담장');
insert into ad_grade values(4,'상담사');
insert into ad_grade values(5,'기타');
commit;
select * from ad_grade;


--관리자 - 시스템 최고 관리자: 권한코드(1)/ 부관리자: (2) / 상담장: 권한코드(3) / 상담사: 권한코드(4) / 기타: 권한코드(5)
--시스템 관리자 3명
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin1','1','김관리','010','0001','0001','admin1@naver.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin2','2','김관리2','010','0002','0002','admin2@nate.com', sysdate,'1');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('admin3','3','김관리3','010','0003','0003','admin3@gmail.com', sysdate,'1');

--상담장 관리자 2명
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('jang1','1','김상담장1','010','0011','0011','jang1@naver.com', sysdate,'2');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('jang2','2','김상담장2','010','0022','0022','jang2@naver.com', sysdate,'2');

--상담사 관리자 4명
insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun1','1','김대화1','010','0111','0111','coun11@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun2','2','김대화2','010','0222','0222','coun22@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun3','3','김대화3','010','0333','0333','coun33@naver.com', sysdate,'3');

insert into rent_admin(admin_id,admin_pwd,admin_name,admin_tel1,admin_tel2,admin_tel3,
        admin_email,admin_regdate,admin_authcode)
values('coun4','4','김대화4','010','0444','0444','coun44@naver.com', sysdate,'3');

select * from rent_admin;
commit;

--사용자 rent_user
delete from rent_user;
insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('kim1','kim123','김가입','kim@naver.com','010','1111','1111','1980-08-08','경기도','남','1종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('jin1','jin123','진가입','jim@gmail.com','010','2222','2222','1990-06-02','충청도','남','2종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('lee1','lee123','이가입','lee@nate.com','010','3333','3333','1975-01-02','강원도','여','1종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate, user_outdate)
values('kimout1','kim123','김탈퇴','kimout@out.com','010','4444','4444','1970-05-05','서울','남','2종보통', sysdate, sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('hong','1234','홍길동','hong@naver.com','010','5001','1454','1982-01-08','경기도','여','2종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('park','1234','박찬호','park@naver.com','010','1140','9811','1978-12-24','경기도','남','2종보통', sysdate);

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license, user_regdate)
values('choi','1234','최고맨','choi@naver.com','010','4560','7887','1987-05-18','경기도','여','1종보통', sysdate);

--이희준 사용자 테스트데이터 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('marco','marco123','이희준','marco@naver.com','010','1234','5678','1980-08-08','경기도','남','1종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('highnoon','highnoon123','하이눈','highnoon@gmail.com','010','4321','8765','1990-06-02','충청도','남','2종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('jinx','jinx123','징크스','jinx@nate.com','010','2345','6789','1998-01-02','강원도','여','1종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('jin','jin123','진','jin@gmail.com','010','5432','9876','1970-05-05','서울','남','2종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('faker','faker123','페이커','faker@naver.com','010','3456','6543','1982-01-08','경기도','여','2종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('dade','dade123','다데','dade@daum.net','010','6789','1234','1978-12-24','경기도','남','2종보통');

insert into rent_user(user_id,user_pwd,user_name,user_email,
user_tel1,user_tel2,user_tel3,user_birth,user_address,user_gender,user_license)
values('wraith','wraith123','레이스','wraith@naver.com','010','3412','5674','1987-05-18','경기도','여','1종보통');


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

--차량 유형
insert into car_category values(1,'경형');
insert into car_category values(2,'소형');
insert into car_category values(3,'준중형');
insert into car_category values(4,'중형');
insert into car_category values(5,'고급');
insert into car_category values(6,'RV/SUV');
insert into car_category values(7,'승합');
commit;
select * from car_category;
select * from car;

select *
from car_category, car
where car_category_num=car_type
and car_category_num=1;

--차 모델 입력 현대차 2종류, 기아차 2종류, 외제차 1종류
delete from car;

insert into car(CAR_CODE, CAR_NAME, CAR_INC, CAR_SIZE, CAR_TRANS, CAR_REGDATE, CAR_TYPE, CAR_IMG)
values('hd001', '현대소나타17', '현대', 4, 'AUTO', sysdate, 4, 'hd00101.jpg');

insert into car(CAR_CODE, CAR_NAME, CAR_INC, CAR_SIZE, CAR_TRANS, CAR_REGDATE, CAR_TYPE, CAR_IMG)
values('hd002', '현대아반떼17', '현대', 4, 'AUTO', sysdate, 3, 'hd00201.jpg');

insert into car(CAR_CODE, CAR_NAME, CAR_INC, CAR_SIZE, CAR_TRANS, CAR_REGDATE, CAR_TYPE, CAR_IMG)
values('kia001', '기아k5_17', 'KIA', 4, 'Trans', sysdate, 4, 'kia00101.jpg');

insert into car(CAR_CODE, CAR_NAME, CAR_INC, CAR_SIZE, CAR_TRANS, CAR_REGDATE, CAR_TYPE, CAR_IMG)
values('kia002', '기아뉴모닝_17', 'KIA', 4, 'AUTO', sysdate, 2, 'kia00201.jpg');

insert into car(CAR_CODE, CAR_NAME, CAR_INC, CAR_SIZE, CAR_TRANS, CAR_REGDATE, CAR_TYPE, CAR_IMG)
values('lambo001', '람보르기니_센테나리오', 'Lamborghini', 2, 'Trans', sysdate, 5, 'lb00101.jpg');

select * from car;
commit;


--렌트 업체 2개 정상운영, 1개 업체 탈퇴업체
--(계좌번호 컬럼이 없는데 아마 필요할것으로 예상됨) - 17-04-13 계좌번호 컬럼 추가됨, logo, regdate 컬럼 위치 수정
delete from company;
insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo, com_regdate)
values('rentZoa', '렌트조아', '1', '100-81-02000', '국민:289333-01-22212', '02', '0100', '0100', '010', '0100', '0100',  '02', '0100', '0101', 
'제주도 한라산 아래', '제주특별자치도 제주시 용문로 20', '김렌트', 'rentZoa1@rentZoa.com', 'rentZoa_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo, com_regdate)
values('rentGo', '렌트고', '1', '100-81-03000', '농협:22222-02-22222', '02', '0200', '0200', '010', '0200', '0200',  '02', '0200', '0201', 
'제주도 한라산 아래', '제주특별자치도 제주시 다호북길 13', '이렌트', 'rentGo1@rentGo.com', 'rentGo_logo.png', sysdate);

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo, com_regdate,  com_outdate)
values('rentDie', '렌트죽음', '1', '100-81-00000', '신한:3333-03-33333', '02', '0300', '0300', '010', '0300', '0300',  '02', '0300', '0301', 
'제주공항 근처', '서울 영등포구 당산로47길 3 신다옥빌딩', '박렌트', 'rentDie1@rentDie.com', 'rentDie_logo.png', sysdate, sysdate);

--이희준 테스트 데이터 업체 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo)
values('rentJava', '렌트자바', '1', '100-80-01000', '하나:356-0468-22212', '02', '2443', '5456', '010', '2361', '8960',  '02', '2443', '5456', 
'제주도 한라산 아래', '서울 영등포구 당산로47길 3 신다옥빌딩', '김자바', 'rentJava@naver.com', 'rentJava_logo.png');

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo)
values('rentJsp', '렌트제이에스피', '1', '100-80-02000', '농협:352-1265-02-22222', '02', '6484', '4732', '010', '7578', '3158',  '02', '6484', '4732', 
'제주도 한라산 아래', '서울 영등포구 당산로 221', '이렌트', 'rentJsp@nate.com', 'rentJsp_logo.png');

insert into company(com_id, com_name, com_pwd, com_num, com_accNum, com_tel1, com_tel2, com_tel3, com_mobile1, com_mobile2, com_mobile3,
com_fax1, com_fax2, com_fax3, com_address, com_return_place, com_ceo, com_email, com_logo)
values('rentSpring', '렌트스프링', '1', '100-80-03000', '신한:456-2741-2374-333', '02', '9458', '3488', '010', '5735', '9759',  '02', '9458', '3488', 
'제주공항 근처', '서울 영등포구 당산로 221', '박렌트', 'rentSpring@daum.net', 'rentSpring_logo.png');

select * from company;
commit;


--업체 차량정보 //휘발유, 경유, LPG, 전기, 하이브리드
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허1234','hd001', 'rentZoa', 'Y', '휘발유', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'N', 'N', 1, 30000, 40000, 60000, 80000, 5000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허1235','kia002', 'rentZoa', 'Y', '휘발유','Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허1236','kia001', 'rentZoa', 'Y', '휘발유','Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'Y', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허1237','hd001', 'rentGo', 'Y', '휘발유','N', 'N', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 1, 25000, 30000, 50000, 70000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허2222','kia002', 'rentGo', 'Y', '휘발유', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'N', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허3333','lambo001', 'rentGo', 'Y', '휘발유', 'Y', 'Y', 'N', 'Y', 'N', 'Y', 'N', 'Y', 'N', 1, 60000, 70000, 80000, 90000, 10000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허4444','hd001', 'rentGo', 'Y', '휘발유','N', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 1, 25000, 30000, 50000, 70000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('03허5555','kia001', 'rentGo', 'Y', '휘발유','Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 1, 15000, 20000, 40000, 60000, 3000, '2017-01-02');

insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('49허1232','hd002', 'rentZoa', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-05-02');


-------------------------------------------------------------------------------------------------------------------
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허1234','hd002', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-05-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허1111','hd001', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-03-21');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허2222','hd001', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-03-22');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허3333','hd002', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-04-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허4444','lambo001', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-05-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허5555','kia002', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-05-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('01허6666','kia001', 'rentGo', 'Y', '디젤','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-05-02');


insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허1000','hd002', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-05-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허2000','hd001', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-04-11');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허3000','hd001', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-04-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허4000','hd002', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2016-03-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허5000','lambo001', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 1, 17000, 22000, 42000, 63000, 4000, '2016-06-18');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허6000','kia002', 'rentGo', 'Y', '휘발유','Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-01-02');
insert into companycaroption
(ccar_car_id, car_code, com_id, ccar_use_yn, car_fuel, ccar_blackbox_yn, ccar_smoke_yn, ccar_rear_camera_yn, ccar_rear_sence_yn, ccar_navi_yn, 
ccar_sun_roof_yn, ccar_bluetooth_yn, ccar_aux_yn, ccar_smartkey_yn, ccar_rentalcount, ccar_normal_price, ccar_weekend_price, 
ccar_peak_price, ccar_s_peak_price, ccar_arrear, comcar_regdate)
values('02허7000','kia001', 'rentGo', 'Y', '휘발유','Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 1, 17000, 22000, 42000, 63000, 4000, '2017-04-02');




select * from companycaroption;
commit;


--예약 정보
/*
insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('00000001', '011','1111','1111', to_date('2017-04-01 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-02 13:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-01' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('00000002', '011','1111','1111', to_date('2017-04-8 09:30','yyyy/mm/dd hh24:mi'), 
to_date('2017-04-09 13:30','yyyy/mm/dd hh24:mi'),'03허3333', '자차보험', '2017-04-08' ,'kim1');

insert into RESERVATION(
reserv_num, user_tel1, user_tel2, user_tel3, reserv_start_date, reserv_end_date,
ccar_car_id, reserv_insurance, reserv_date, user_id)
values('00000003', '010','2200','2200', to_date('2017-04-30 11:00','yyyy/mm/dd hh24:mi'), 
to_date('2017-05-02 11:00','yyyy/mm/dd hh24:mi'), '03허2222', '자차보험', '2017-05-01' ,'jin1');
*/
select * from RESERVATION order by reserv_date desc;
commit;
rollback;

--예약 회원(회원정보와는 다른 예약하는 당사자)
--예) 회원(자식), 예약자/운전자 정보를 받을때(예약자-엄마, 운전자-아빠)받을수 있게

/*
insert into reserv_user
values('00000001', '김엄마', '011', '1111', '1111', 'kim2@naver.com', '김아빠', '011', '1112', '1112', '600102', '1종보통');
insert into reserv_user
values('00000002', '김엄마', '011', '1111', '1111', 'kim2@naver.com', '김아빠', '011', '1112', '1112', '600102', '1종보통');
insert into reserv_user
values('00000003', '진누나', '010', '2200', '2200', 'jin2@naver.com', '진남친', '011', '2200', '2201', '880102', '2종보통');
*/
select * from reserv_user;
commit;

--결제정보
/*
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p001234', '00000001', '010', '1234', '1234', 'card', 59000, 'paid', '2017-04-01');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p002234', '00000002', '010', '1234', '1234', 'card', 62000, 'paid', '2017-04-08');
insert into PAYINFO(pay_no, reserv_num, user_tel1, user_tel2, 
user_tel3, pay_method, pay_money, pay_condition, pay_regdate)
values('p003234', '00000003', '010', '1234', '1234', 'card', 55000, 'paid', '2017-05-01');
*/
select * from PAYINFO order by pay_regdate desc;
commit;
rollback;

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

--이벤트 정보
insert into event(event_num, event_title, event_content, admin_id, event_start_date, event_end_date,
event_image1, event_image2)
values(event_seq.nextval, '이벤트 제목: 김이벤트', '이벤트 내용: 김내용', 'admin2', '2017-05-01', '2017-05-10', 
'eimage1.jpg', 'eimage2.jpg');

insert into event(event_num, event_title, event_content, admin_id, event_start_date, event_end_date,
event_image1, event_image2)
values(event_seq.nextval, '이벤트 제목: 고객 감사 이벤트', '이벤트 내용: 고객님들에게 감사함을 ...', 'admin1', '2017-05-01', '2017-05-10', 
'eimage11.jpg', 'eimage22.jpg');

select * from event order by event_num desc;
commit;

--사용후기
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '이번에 써봤는데 정말 좋았어요!', 'kim1', 'rentZoa', 4, 4, 5, 'bad1.jpg', '후기2.jpg','');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '다음에는 사용하고 싶지 않네요...너무 더러웠어요', 'jin1', 'rentGo', 3, 1, 3, 'hahaha1.jpg', '더러워2.jpg','');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '그냥 보통 쓸만한 정도?', 'lee1', 'rentGo', 3, 4, 3, 'good2.jpg', '','');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '깔끔하고 또 다시 빌릴거 같네요 ㅎㅎㅎ', 'hong', 'rentGo', 1, 5, 2, 'good1.jpg', '','');
insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '차 상태도 깔끔하고 저렴하게 타기 좋은거같습니다', 'park', 'rentGo', 1, 5, 2, 'good3.jpg', '','');

insert into COMMENTS(cmt_no, cmt_content, user_id, com_id, cmt_kind_score, cmt_clean_score, cmt_conv_score, 
cmt_img1, cmt_img2, cmt_img3)
values(cmt_seq.nextval, '연비도 괜찬고 딱 가격값정도만 합니다', 'choi', 'rentGo', 1, 5, 2, 'good4.jpg', '','');

select*from comments;
commit;

--회원등급
select * from user_sequences;
