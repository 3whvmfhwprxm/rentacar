/* Car 차모델 */
CREATE TABLE Car (
	car_code VARCHAR2(100) NOT NULL, /* 모델코드 */
	car_name VARCHAR2(100) NOT NULL, /* 모델명 */
	car_inc VARCHAR2(30) NOT NULL, /* 제조사 */
	car_fuel VARCHAR2(30) NOT NULL, /* 연료 */--연료: CompanyCarOption에 컬럼을 이동시키고 삭제
	car_size NUMBER NOT NULL, /* 승차인원 */
	car_year DATE NOT NULL, /* 출시년도 */--출시년도: 모델코드와 모델명에 각각 년도표기가 들어가거나 분류가 되므로 생략
	car_trans VARCHAR2(6) NOT NULL, /* 변속기 */
	car_regdate DATE default sysdate, /* 등록일 */
	car_type VARCHAR2(30) NOT NULL, /* 차량유형 */
	car_img1 VARCHAR2(200) NOT NULL, /* 이미지1 */
	car_img2 VARCHAR2(200) NOT NULL, /* 이미지2 */--차공식 사진 관련 1개만 올리도록 수정 예정
	car_img3 VARCHAR2(200) NOT NULL /* 이미지3 */--차공식 사진 관련 1개만 올리도록 수정 예정
);

ALTER TABLE Car
	ADD
		CONSTRAINT PK_Car
		PRIMARY KEY (
			car_code
		);

/* Company 업체 */
CREATE TABLE Company (
	com_id VARCHAR2(30) NOT NULL, /* 업체아이디 */
	com_name VARCHAR2(30) NOT NULL, /* 업체명 */
	com_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	com_num VARCHAR2(30) NOT NULL, /* 사업자번호 */
	com_accNum VARCHAR2(30) NOT NULL, /* 계좌번호 */
	com_tel1 VARCHAR2(10) NOT NULL, /* 대표번호1 */
	com_tel2 VARCHAR2(10) NOT NULL, /* 대표번호2 */
	com_tel3 VARCHAR2(10) NOT NULL, /* 대표번호3 */
	com_mobile1 VARCHAR2(10) NOT NULL, /* 휴대폰1 */
	com_mobile2 VARCHAR2(10) NOT NULL, /* 휴대폰2 */
	com_mobile3 VARCHAR2(10) NOT NULL, /* 휴대폰3 */
	com_fax1 VARCHAR2(10) NOT NULL, /* 팩스번호1 */
	com_fax2 VARCHAR2(10) NOT NULL, /* 팩스번호2 */
	com_fax3 VARCHAR2(10) NOT NULL, /* 팩스번호3 */
	com_address VARCHAR2(100) NOT NULL, /* 회사주소 */
	com_ceo VARCHAR2(30) NOT NULL, /* 대표자 */
	com_email1 VARCHAR2(50) NOT NULL, /* 대표메일1 */
	com_email2 VARCHAR2(50) NOT NULL, /* 대표메일2 */	
	com_logo VARCHAR2(200), /* 업체로고 */
	com_regdate DATE default sysdate, /* 가입일 */
	com_outdate DATE /* 탈퇴일 */
);

ALTER TABLE Company
	ADD
		CONSTRAINT PK_Company
		PRIMARY KEY (
			com_id
		);

/* rent_user 회원 */
CREATE TABLE rent_user (
	user_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	user_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	user_name VARCHAR2(30) NOT NULL, /* 이름 */
	user_email1 VARCHAR2(50) NOT NULL, /* 이메일1 */
	user_email2 VARCHAR2(50) NOT NULL, /* 이메일2 */
	user_tel1 VARCHAR2(10) NOT NULL, /* 연락처1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* 연락처2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* 연락처3 */
	user_birth VARCHAR2(50) NOT NULL, /* 생년월일 */
	user_address VARCHAR2(100) NOT NULL, /* 주소 */
	user_gender VARCHAR2(6) NOT NULL, /* 성별 */
	user_license VARCHAR2(30) NOT NULL, /* 면허증 */
	user_regdate DATE default sysdate, /* 가입일 */
	user_outdate DATE /* 탈퇴일 */
);

ALTER TABLE rent_user
	ADD
		CONSTRAINT PK_rent_user
		PRIMARY KEY (
			user_id
		);

/* Reservation 예약정보 */
CREATE TABLE Reservation (
	reserv_num VARCHAR2(20) NOT NULL, /* 예약번호 */
	user_tel1 VARCHAR2(10) NOT NULL, /* 회원전화번호1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* 회원전화번호2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* 회원전화번호3 */
	reserv_start_date DATE NOT NULL, /* 대여시작일 */
	reserv_start_time VARCHAR2(10) NOT NULL, /* 대여시작시간 */
	reserv_end_date DATE NOT NULL, /* 반납일 */
	reserv_end_time VARCHAR2(10) NOT NULL, /* 반납시간 */
	ccar_car_id VARCHAR2(50) NOT NULL, /* 업체보유차량 */
	reserv_insurance VARCHAR2(20) NOT NULL, /* 보험여부 */
	reserv_date DATE default sysdate, /* 예약일시 */
	reserv_cancel DATE, /* 예약취소일시 */
	reserv_cancel_why CLOB, /* 예약취소사유 */
	user_id VARCHAR2(30) /* 회원아이디 */
);

ALTER TABLE Reservation
	ADD
		CONSTRAINT PK_Reservation
		PRIMARY KEY (
			reserv_num
		);

/* UserNotice 일반회원공지사항 */
CREATE TABLE UserNotice (
	unotice_no NUMBER NOT NULL, /* 글번호 */
	unotice_title VARCHAR2(50) NOT NULL, /* 글제목 */
	unotice_content CLOB NOT NULL, /* 글내용 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	unotice_regdate DATE default sysdate, /* 작성시간 */
	unotice_visible VARCHAR2(6) default 'N', /* 글노출 */
	unotice_readcount NUMBER default 0, /* 조회수 */
	unotice_deldate DATE /* 삭제일 */
);

ALTER TABLE UserNotice
	ADD
		CONSTRAINT PK_UserNotice
		PRIMARY KEY (
			unotice_no
		);

/* ServiceCenterNotice 상담사공지사항 */
CREATE TABLE ServiceCenterNotice (
	scnotice_no NUMBER NOT NULL, /* 글번호 */
	scnotice_title VARCHAR2(50) NOT NULL, /* 글제목 */
	scnotice_content CLOB NOT NULL, /* 글내용 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	scnotice_regdate DATE default sysdate, /* 작성시간 */
	scnotice_visible VARCHAR2(6) default 'N', /* 글노출 */
	scnotice_readcount NUMBER default 0, /* 조회수 */
	scnotice_deldate DATE /* 삭제일 */
);

ALTER TABLE ServiceCenterNotice
	ADD
		CONSTRAINT PK_ServiceCenterNotice
		PRIMARY KEY (
			scnotice_no
		);

/* CompanyNotice 업체회원공지사항 */
CREATE TABLE CompanyNotice (
	cnotice_no NUMBER NOT NULL, /* 글번호 */
	cnotice_title VARCHAR2(50) NOT NULL, /* 글제목 */
	cnotice_content CLOB NOT NULL, /* 글내용 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	cnotice_regdate DATE default sysdate, /* 작성시간 */
	cnotice_visible VARCHAR2(6) default 'N', /* 글노출 */
	cnotice_readcount NUMBER default 0, /* 조회수 */
	cnotice_deldate DATE /* 삭제일 */
);

ALTER TABLE CompanyNotice
	ADD
		CONSTRAINT PK_CompanyNotice
		PRIMARY KEY (
			cnotice_no
		);

/* Counsel - 상담내역 */
CREATE TABLE Counsel (
	counsel_id NUMBER NOT NULL, /* 상담번호 */
	user_id VARCHAR2(30), /* 회원아이디 */
	user_tel1 VARCHAR2(10) NOT NULL, /* 전화번호1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* 전화번호2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* 전화번호3 */
	counsel_category VARCHAR2(30) NOT NULL, /* 상담종류 */
	counsel_content CLOB NOT NULL, /* 상담내용 */
	counsel_regdate DATE default sysdate, /* 상담시간 */
	counsel_result CLOB NOT NULL, /* 처리내용 */
	counsel_result_flag VARCHAR2(10) NOT NULL, /* 처리결과 */
	admin_id VARCHAR2(30) NOT NULL /* 관리자아이디 */
);

ALTER TABLE Counsel
	ADD
		CONSTRAINT PK_Counsel
		PRIMARY KEY (
			counsel_id
		);

/* comments - 회원코멘트 */
CREATE TABLE comments (
	cmt_no NUMBER NOT NULL, /* 코멘트번호 */
	cmt_content CLOB NOT NULL, /* 코멘트내용 */
	user_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	com_id VARCHAR2(30) NOT NULL, /* 업체아이디 */
	cmt_kind_score NUMBER NOT NULL, /* 친절도 */
	cmt_clean_score NUMBER NOT NULL, /* 청결도 */
	cmt_conv_score NUMBER NOT NULL, /* 편의성 */
	cmt_img1 VARCHAR2(200) NOT NULL, /* 후기이미지1 */
	cmt_img2 VARCHAR2(200) NOT NULL, /* 후기이미지2 */
	cmt_regdate DATE default sysdate, /* 기록일 */
	cmt_deldate DATE, /* 삭제일 */
	admin_id VARCHAR2(30) /* 관리자아이디 */
);

ALTER TABLE comments
	ADD
		CONSTRAINT PK_comments
		PRIMARY KEY (
			cmt_no
		);

/* PayInfo - 결제정보 */
CREATE TABLE PayInfo (
	pay_no NUMBER NOT NULL, /* 결제번호 */
	reserv_num VARCHAR2(20) NOT NULL, /* 예약번호 */
	user_tel1 VARCHAR2(10) NOT NULL, /* 회원전화번호1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* 회원전화번호2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* 회원전화번호3 */
	pay_method VARCHAR2(30) NOT NULL, /* 결제방법 */
	pay_money NUMBER NOT NULL, /* 결제금액 */
	pay_discount NUMBER, /* 할인금액 */
	pay_regdate DATE default sysdate, /* 결제일시 */
	pay_condition VARCHAR2(20) NOT NULL /* 진행상태 */
);

ALTER TABLE PayInfo
	ADD
		CONSTRAINT PK_PayInfo
		PRIMARY KEY (
			pay_no
		);

/* Event 이벤트 */
CREATE TABLE Event (
	event_num NUMBER NOT NULL, /* 이벤트번호 */
	event_title VARCHAR2(255) NOT NULL, /* 이벤트제목 */
	event_content CLOB NOT NULL, /* 이벤트내용 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */	
	event_start_date DATE NOT NULL, /* 이벤트시작일 */
	event_end_date DATE NOT NULL, /* 이벤트종료일 */
	--event_target_grade VARCHAR2(10) NOT NULL, /* 적용회원등급 */
	event_image1 VARCHAR2(200) NOT NULL, /* 이벤트이미지1 */
	--event_original_image1 VARCHAR2(200) NOT NULL, /* 이미지1 오리진 */
	event_image2 VARCHAR2(200), /* 이벤트이미지2 */
	--event_original_image2 VARCHAR2(200), /* 이미지2 오리진 */
	--event_target_company VARCHAR2(200), /* 적용업체 */
	event_regdate DATE default sysdate, /* 작성시간 */
	event_editdate DATE  /* 수정시간 */
);

ALTER TABLE Event
	ADD
		CONSTRAINT PK_Event
		PRIMARY KEY (
			event_num
		);

/* CompanyCarOption 업체 보유 차량 */
CREATE TABLE CompanyCarOption (
	ccar_car_id VARCHAR2(50) NOT NULL, /* 업체보유차량 */
	car_code VARCHAR2(100) NOT NULL, /* 모델코드 */
	com_id VARCHAR2(30) NOT NULL, /* 업체아이디 */
	ccar_use_yn VARCHAR2(6) default 'N', /* 차량사용가능여부 */
	--car_fuel VARCHAR2(30) NOT NULL, /* 연료 */--연료: Car에 있던 컬럼 이동
	ccar_blackbox_yn VARCHAR2(6) default 'N', /* 블랙박스유무 */
	ccar_smoke_yn VARCHAR2(6) default 'N', /* 금연차량 */
	ccar_rear_camera_yn VARCHAR2(6) default 'N', /* 후방카메라 */
	ccar_rear_sence_yn VARCHAR2(6) default 'N', /* 후방센서 */
	ccar_navi_yn VARCHAR2(6) default 'N', /* 네비게이션 */
	ccar_sun_roof_yn VARCHAR2(6) default 'N', /* 썬루프 */
	ccar_bluetooth_yn VARCHAR2(6) default 'N', /* 블루투스 */
	ccar_aux_yn VARCHAR2(6) default 'N', /* AUX */
	ccar_smartkey_yn VARCHAR2(6) default 'N', /* 스마트키 */
	ccar_rentalcount NUMBER default 0, /* 차량대여횟수 */
	ccar_normal_price NUMBER NOT NULL, /* 평일예약가격 */
	ccar_weekend_price NUMBER NOT NULL, /* 주말예약가격 */
	ccar_peak_price NUMBER NOT NULL, /* 성수기예약가격 */
	ccar_s_peak_price NUMBER NOT NULL, /* 극성수기예약가격 */
	ccar_arrear NUMBER NOT NULL, /* 연체료(표기용) */
	comcar_regdate DATE default sysdate, /* 차량등록일 */
	comcar_outdate DATE /* 차량삭제일 */
);

ALTER TABLE CompanyCarOption
	ADD
		CONSTRAINT PK_CompanyCarOption
		PRIMARY KEY (
			ccar_car_id
		);

/* rent_admin 관리자 */
CREATE TABLE rent_admin (
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	admin_pwd VARCHAR2(30) NOT NULL, /* 패스워드 */
	admin_name VARCHAR2(30) NOT NULL, /* 이름 */
	admin_tel1 VARCHAR2(10) NOT NULL, /* 전화번호1 */
	admin_tel2 VARCHAR2(10) NOT NULL, /* 전화번호2 */
	admin_tel3 VARCHAR2(10) NOT NULL, /* 전화번호3 */
	admin_email1 VARCHAR2(50) NOT NULL, /* 이메일1 */
	admin_email2 VARCHAR2(50) NOT NULL, /* 이메일2 */
	admin_regdate DATE default sysdate, /* 등록일 */
	admin_authcode VARCHAR2(10) NOT NULL, /* 권한 */
	admin_outdate DATE /* 탈퇴일 */
);

ALTER TABLE rent_admin
	ADD
		CONSTRAINT PK_rent_admin
		PRIMARY KEY (
			admin_id
		);

/* Member_grade 회원등급 */
CREATE TABLE Member_grade (
	mem_gra_no NUMBER NOT NULL, /* 대상회원번호 */
	mem_gra_tel1 VARCHAR2(10) NOT NULL, /* 대상전화번호1 */
	mem_gra_tel2 VARCHAR2(10) NOT NULL, /* 대상전화번호2 */
	mem_gra_tel3 VARCHAR2(10) NOT NULL, /* 대상전화번호3 */
	user_id VARCHAR2(30), /* 회원아이디 */
	mem_grade VARCHAR2(30) NOT NULL, /* 등급 */
	mem_gra_regdate DATE default sysdate, /* 등급결정일 */
	mem_gra_reason VARCHAR2(1000) NOT NULL, /* 결정사유 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	mem_gra_deldate DATE /* 등급삭제일 */
);

ALTER TABLE Member_grade
	ADD
		CONSTRAINT PK_Member_grade
		PRIMARY KEY (
			mem_gra_no
		);



/* Reserv_User 예약회원정보 */
CREATE TABLE Reserv_User (
	reserv_num VARCHAR2(20) NOT NULL, /* 예약번호 */
	res_u_name VARCHAR2(30) NOT NULL, /* 예약자이름 */
	res_u_tel1 VARCHAR2(10) NOT NULL, /* 예약자전화1 */
	res_u_tel2 VARCHAR2(10) NOT NULL, /* 예약자전화2 */
	res_u_tel3 VARCHAR2(10) NOT NULL, /* 예약자전화3 */
	res_u_mail1 VARCHAR2(50) NOT NULL, /* 예약자이메일1 */
	res_u_mail2 VARCHAR2(50) NOT NULL, /* 예약자이메일2 */
	res_drv_name VARCHAR2(30) NOT NULL, /* 운전자이름 */
	res_drv_tel1 VARCHAR2(10) NOT NULL, /* 운전자전화1 */
	res_drv_tel2 VARCHAR2(10) NOT NULL, /* 운전자전화2 */
	res_drv_tel3 VARCHAR2(10) NOT NULL, /* 운전자전화3 */
	res_drv_birth VARCHAR2(10) NOT NULL, /* 생년월일 */
	res_drv_category VARCHAR2(10) NOT NULL /* 면허종류 */
);

CREATE UNIQUE INDEX PK_Reserv_User
	ON Reserv_User (
		reserv_num ASC
	);

ALTER TABLE Reserv_User
	ADD
		CONSTRAINT PK_Reserv_User
		PRIMARY KEY (
			reserv_num
		);

ALTER TABLE Reservation
	ADD
		CONSTRAINT FK_ComCarOpt_TO_Res
		FOREIGN KEY (
			ccar_car_id
		)
		REFERENCES CompanyCarOption (
			ccar_car_id
		);

ALTER TABLE Reservation
	ADD
		CONSTRAINT FK_Rent_User_TO_Res
		FOREIGN KEY (
			user_id
		)
		REFERENCES rent_user (
			user_id
		);

ALTER TABLE UserNotice
	ADD
		CONSTRAINT FK_rent_admin_TO_UNotice
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE ServiceCenterNotice
	ADD
		CONSTRAINT FK_rent_admin_TO_SCNotice
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE CompanyNotice
	ADD
		CONSTRAINT FK_rent_admin_TO_ComNotice
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE Counsel
	ADD
		CONSTRAINT FK_rent_user_TO_Counsel
		FOREIGN KEY (
			user_id
		)
		REFERENCES rent_user (
			user_id
		);

ALTER TABLE Counsel
	ADD
		CONSTRAINT FK_rent_admin_TO_Counsel
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_rent_user_TO_comments
		FOREIGN KEY (
			user_id
		)
		REFERENCES rent_user (
			user_id
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_Company_TO_comments
		FOREIGN KEY (
			com_id
		)
		REFERENCES Company (
			com_id
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_rent_admin_TO_comments
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE PayInfo
	ADD
		CONSTRAINT FK_Reservation_TO_PayInfo
		FOREIGN KEY (
			reserv_num
		)
		REFERENCES Reservation (
			reserv_num
		);

ALTER TABLE Event
	ADD
		CONSTRAINT FK_rent_admin_TO_Event
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE CompanyCarOption
	ADD
		CONSTRAINT FK_Car_TO_ComCarOpt
		FOREIGN KEY (
			car_code
		)
		REFERENCES Car (
			car_code
		);

ALTER TABLE CompanyCarOption
	ADD
		CONSTRAINT FK_Com_TO_ComCarOpt
		FOREIGN KEY (
			com_id
		)
		REFERENCES Company (
			com_id
		);

ALTER TABLE Member_grade
	ADD
		CONSTRAINT FK_rent_Mem_grade
		FOREIGN KEY (
			user_id
		)
		REFERENCES rent_user (
			user_id
		);

ALTER TABLE Member_grade
	ADD
		CONSTRAINT FK_rent_ad_TO_Mem_grade
		FOREIGN KEY (
			admin_id
		)
		REFERENCES rent_admin (
			admin_id
		);

ALTER TABLE Reserv_User
	ADD
		CONSTRAINT FK_reserv_num_TO_Res_User
		FOREIGN KEY (
			reserv_num
		)
		REFERENCES Reservation (
			reserv_num
		);