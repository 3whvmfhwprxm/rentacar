/* Car ���� */
CREATE TABLE Car (
	car_code VARCHAR2(100) NOT NULL, /* ���ڵ� */
	car_name VARCHAR2(100) NOT NULL, /* �𵨸� */
	car_inc VARCHAR2(30) NOT NULL, /* ������ */
	car_fuel VARCHAR2(30) NOT NULL, /* ���� */
	car_size NUMBER NOT NULL, /* �����ο� */
	car_year DATE NOT NULL, /* ��ó⵵ */
	car_trans CHAR(6) NOT NULL, /* ���ӱ� */
	car_regdate DATE NOT NULL, /* ����� */
	car_type VARCHAR2(30) NOT NULL, /* �������� */
	car_img1 VARCHAR2(200) NOT NULL, /* �̹���1 */
	car_img2 VARCHAR2(200) NOT NULL, /* �̹���2 */
	car_img3 VARCHAR2(200) NOT NULL /* �̹���3 */
);

ALTER TABLE Car
	ADD
		CONSTRAINT PK_Car
		PRIMARY KEY (
			car_code
		);

/* Company ��ü */
CREATE TABLE Company (
	com_id VARCHAR2(30) NOT NULL, /* ��ü���̵� */
	com_name VARCHAR2(30) NOT NULL, /* ��ü�� */
	com_pwd VARCHAR2(30) NOT NULL, /* �н����� */
	com_num VARCHAR2(30) NOT NULL, /* ����ڹ�ȣ */
	com_tel1 VARCHAR2(10) NOT NULL, /* ��ǥ��ȣ1 */
	com_tel2 VARCHAR2(10) NOT NULL, /* ��ǥ��ȣ2 */
	com_tel3 VARCHAR2(10) NOT NULL, /* ��ǥ��ȣ3 */
	com_mobile1 VARCHAR2(10) NOT NULL, /* �޴���1 */
	com_mobile2 VARCHAR2(10) NOT NULL, /* �޴���2 */
	com_mobile3 VARCHAR2(10) NOT NULL, /* �޴���3 */
	com_fax1 VARCHAR2(10) NOT NULL, /* �ѽ���ȣ1 */
	com_fax2 VARCHAR2(10) NOT NULL, /* �ѽ���ȣ2 */
	com_fax3 VARCHAR2(10) NOT NULL, /* �ѽ���ȣ3 */
	com_address VARCHAR2(100) NOT NULL, /* ȸ���ּ� */
	com_ceo VARCHAR2(30) NOT NULL, /* ��ǥ�� */
	com_email1 VARCHAR2(50) NOT NULL, /* ��ǥ����1 */
	com_email2 VARCHAR2(50) NOT NULL, /* ��ǥ����2 */
	com_regdate DATE NOT NULL, /* ������ */
	com_logo VARCHAR2(200), /* ��ü�ΰ� */
	com_outdate DATE /* Ż���� */
);

ALTER TABLE Company
	ADD
		CONSTRAINT PK_Company
		PRIMARY KEY (
			com_id
		);

/* rent_user ȸ�� */
CREATE TABLE rent_user (
	user_id VARCHAR2(30) NOT NULL, /* ȸ�����̵� */
	user_pwd VARCHAR2(30) NOT NULL, /* �н����� */
	user_name VARCHAR2(30) NOT NULL, /* �̸� */
	user_email1 VARCHAR2(50) NOT NULL, /* �̸���1 */
	user_email2 VARCHAR2(50) NOT NULL, /* �̸���2 */
	user_tel1 VARCHAR2(10) NOT NULL, /* ����ó1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* ����ó2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* ����ó3 */
	user_birth VARCHAR2(50) NOT NULL, /* ������� */
	user_address VARCHAR2(100) NOT NULL, /* �ּ� */
	user_gender CHAR(6) NOT NULL, /* ���� */
	user_license VARCHAR2(30) NOT NULL, /* ������ */
	user_regdate DATE NOT NULL, /* ������ */
	user_outdate DATE /* Ż���� */
);

ALTER TABLE rent_user
	ADD
		CONSTRAINT PK_rent_user
		PRIMARY KEY (
			user_id
		);

/* Reservation �������� */
CREATE TABLE Reservation (
	reserv_num VARCHAR2(20) NOT NULL, /* �����ȣ */
	user_tel1 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ3 */
	reserv_start_date DATE NOT NULL, /* �뿩������ */
	reserv_start_time DATE NOT NULL, /* �뿩���۽ð� */
	reserv_end_date DATE NOT NULL, /* �ݳ��� */
	reserv_end_time DATE NOT NULL, /* �ݳ��ð� */
	ccar_car_id VARCHAR2(50) NOT NULL, /* ��ü�������� */
	reserv_insurance VARCHAR2(20) NOT NULL, /* ���迩�� */
	reserv_date DATE NOT NULL, /* �����Ͻ� */
	reserv_cancel DATE, /* ��������Ͻ� */
	reserv_cancel_why VARCHAR2(1000), /* ������һ��� */
	user_id VARCHAR2(30) /* ȸ�����̵� */
);

ALTER TABLE Reservation
	ADD
		CONSTRAINT PK_Reservation
		PRIMARY KEY (
			reserv_num
		);

/* UserNotice �Ϲ�ȸ���������� */
CREATE TABLE UserNotice (
	unotice_no NUMBER NOT NULL, /* �۹�ȣ */
	unotice_title VARCHAR2(50) NOT NULL, /* ������ */
	unotice_content CLOB NOT NULL, /* �۳��� */
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	unotice_regdate DATE NOT NULL, /* �ۼ��ð� */
	unotice_visible CHAR(6) NOT NULL, /* �۳��� */
	unotice_readcount NUMBER NOT NULL, /* ��ȸ�� */
	unotice_deldate DATE /* ������ */
);

ALTER TABLE UserNotice
	ADD
		CONSTRAINT PK_UserNotice
		PRIMARY KEY (
			unotice_no
		);

/* ServiceCenterNotice ����������� */
CREATE TABLE ServiceCenterNotice (
	scnotice_no NUMBER NOT NULL, /* �۹�ȣ */
	scnotice_title VARCHAR2(50) NOT NULL, /* ������ */
	scnotice_content CLOB NOT NULL, /* �۳��� */
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	scnotice_regdate DATE NOT NULL, /* �ۼ��ð� */
	scnotice_visible CHAR(6) NOT NULL, /* �۳��� */
	scnotice_readcount NUMBER NOT NULL, /* ��ȸ�� */
	scnotice_deldate DATE /* ������ */
);

ALTER TABLE ServiceCenterNotice
	ADD
		CONSTRAINT PK_ServiceCenterNotice
		PRIMARY KEY (
			scnotice_no
		);

/* CompanyNotice ��üȸ���������� */
CREATE TABLE CompanyNotice (
	cnotice_no NUMBER NOT NULL, /* �۹�ȣ */
	cnotice_title VARCHAR2(50) NOT NULL, /* ������ */
	cnotice_content CLOB NOT NULL, /* �۳��� */
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	cnotice_regdate DATE NOT NULL, /* �ۼ��ð� */
	cnotice_visible CHAR(6) NOT NULL, /* �۳��� */
	cnotice_readcount NUMBER NOT NULL, /* ��ȸ�� */
	cnotice_deldate DATE /* ������ */
);

ALTER TABLE CompanyNotice
	ADD
		CONSTRAINT PK_CompanyNotice
		PRIMARY KEY (
			cnotice_no
		);

/* Counsel - ��㳻�� */
CREATE TABLE Counsel (
	counsel_id NUMBER NOT NULL, /* ����ȣ */
	user_id VARCHAR2(30), /* ȸ�����̵� */
	user_tel1 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ3 */
	counsel_category VARCHAR2(30) NOT NULL, /* ������� */
	counsel_content CLOB NOT NULL, /* ��㳻�� */
	counsel_regdate DATE NOT NULL, /* ���ð� */
	counsel_result CLOB NOT NULL, /* ó������ */    --������ Ÿ����  varchar2��CLob�� ����
	counsel_result_flag VARCHAR2(10) NOT NULL, /* ó����� */ --������ Ÿ����  varchar2(200)��varchar2(10)����
	admin_id VARCHAR2(30) NOT NULL /* �����ھ��̵� */
);

ALTER TABLE Counsel
	ADD
		CONSTRAINT PK_Counsel
		PRIMARY KEY (
			counsel_id
		);

/* comments - ȸ���ڸ�Ʈ */
CREATE TABLE comments (
	cmt_no NUMBER NOT NULL, /* �ڸ�Ʈ��ȣ */
	cmt_content CLOB NOT NULL, /* �ڸ�Ʈ���� */
	user_id VARCHAR2(30) NOT NULL, /* ȸ�����̵� */
	com_id VARCHAR2(30) NOT NULL, /* ��ü���̵� */
	cmt_kind_score NUMBER NOT NULL, /* ģ���� */
	cmt_clean_score NUMBER NOT NULL, /* û�ᵵ */
	cmt_conv_score NUMBER NOT NULL, /* ���Ǽ� */
	cmt_img1 VARCHAR2(200) NOT NULL, /* �ı��̹���1 */
	cmt_img2 VARCHAR2(200) NOT NULL, /* �ı��̹���2 */
	cmt_regdate DATE NOT NULL, /* ����� */
	cmt_deldate DATE, /* ������ */
	admin_id VARCHAR2(30) /* �����ھ��̵� */
);

ALTER TABLE comments
	ADD
		CONSTRAINT PK_comments
		PRIMARY KEY (
			cmt_no
		);

/* PayInfo - �������� */
CREATE TABLE PayInfo (
	pay_no NUMBER NOT NULL, /* ������ȣ */
	reserv_num VARCHAR2(20) NOT NULL, /* �����ȣ */
	user_tel1 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ1 */
	user_tel2 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ2 */
	user_tel3 VARCHAR2(10) NOT NULL, /* ȸ����ȭ��ȣ3 */
	pay_method VARCHAR2(30) NOT NULL, /* ������� */
	pay_money NUMBER NOT NULL, /* �����ݾ� */
	pay_discount NUMBER, /* ���αݾ� */
	pay_regdate DATE NOT NULL, /* �����Ͻ� */
	pay_condition VARCHAR2(20) NOT NULL /* ������� */
);

ALTER TABLE PayInfo
	ADD
		CONSTRAINT PK_PayInfo
		PRIMARY KEY (
			pay_no
		);

/* Event �̺�Ʈ */
CREATE TABLE Event (
	event_num NUMBER NOT NULL, /* �̺�Ʈ��ȣ */
	event_title VARCHAR2(200) NOT NULL, /* �̺�Ʈ���� */
	event_content VARCHAR2(200) NOT NULL, /* �̺�Ʈ���� */
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	event_regdate DATE NOT NULL, /* �ۼ��ð� */
	event_start_date DATE NOT NULL, /* �̺�Ʈ������ */
	event_end_date DATE NOT NULL, /* ������ */
	event_target_grade VARCHAR2(10) NOT NULL, /* ����ȸ����� */
	event_image1 VARCHAR2(200) NOT NULL, /* �̺�Ʈ�̹���1 */
	event_original_image1 VARCHAR2(200) NOT NULL, /* �̹���1 ������ */
	event_image2 VARCHAR2(200), /* �̺�Ʈ�̹���2 */
	event_original_image2 VARCHAR2(200), /* �̹���2 ������ */
	event_target_company VARCHAR2(200) /* �����ü */
);

ALTER TABLE Event
	ADD
		CONSTRAINT PK_Event
		PRIMARY KEY (
			event_num
		);

/* CompanyCarOption ��ü ���� ���� */
CREATE TABLE CompanyCarOption (
	ccar_car_id VARCHAR2(50) NOT NULL, /* ��ü�������� */
	car_code VARCHAR2(100) NOT NULL, /* ���ڵ� */
	com_id VARCHAR2(30) NOT NULL, /* ��ü���̵� */
	ccar_use_yn CHAR(6) NOT NULL, /* ������밡�ɿ��� */
	ccar_blackbox_yn CHAR(6) NOT NULL, /* ���ڽ����� */
	ccar_smoke_yn CHAR(6) NOT NULL, /* �ݿ����� */
	ccar_rear_camera_yn CHAR(6) NOT NULL, /* �Ĺ�ī�޶� */
	ccar_rear_sence_yn CHAR(6) NOT NULL, /* �Ĺ漾�� */
	ccar_navi_yn CHAR(6) NOT NULL, /* �׺���̼� */
	ccar_sun_roof_yn CHAR(6) NOT NULL, /* ����� */
	ccar_bluetooth_yn CHAR(6) NOT NULL, /* ������� */
	ccar_aux_yn CHAR(6) NOT NULL, /* AUX */
	ccar_smartkey_yn CHAR(6) NOT NULL, /* ����ƮŰ */
	ccar_rentalcount NUMBER NOT NULL, /* �����뿩Ƚ�� */
	ccar_normal_price NUMBER NOT NULL, /* ���Ͽ��డ�� */
	ccar_weekend_price NUMBER NOT NULL, /* �ָ����డ�� */
	ccar_peak_price NUMBER NOT NULL, /* �����⿹�డ�� */
	ccar_s_peak_price NUMBER NOT NULL, /* �ؼ����⿹�డ�� */
	ccar_arrear NUMBER NOT NULL, /* ��ü��(ǥ���) */
	comcar_regdate DATE NOT NULL, /* ��������� */
	comcar_outdate DATE /* ���������� */
);

ALTER TABLE CompanyCarOption
	ADD
		CONSTRAINT PK_CompanyCarOption
		PRIMARY KEY (
			ccar_car_id
		);

/* rent_admin ������ */
CREATE TABLE rent_admin (
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	admin_pwd VARCHAR2(30) NOT NULL, /* �н����� */
	admin_name VARCHAR2(30) NOT NULL, /* �̸� */
	admin_tel1 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ1 */
	admin_tel2 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ2 */
	admin_tel3 VARCHAR2(10) NOT NULL, /* ��ȭ��ȣ3 */
	admin_email1 VARCHAR2(50) NOT NULL, /* �̸���1 */
	admin_email2 VARCHAR2(50) NOT NULL, /* �̸���2 */
	admin_regdate DATE NOT NULL, /* ����� */
	admin_authcode VARCHAR2(10) NOT NULL, /* ���� */
	admin_outdate DATE /* Ż���� */
);

ALTER TABLE rent_admin
	ADD
		CONSTRAINT PK_rent_admin
		PRIMARY KEY (
			admin_id
		);

/* Member_grade ȸ����� */
CREATE TABLE Member_grade (
	mem_gra_no NUMBER NOT NULL, /* ���ȸ����ȣ */
	mem_gra_tel1 VARCHAR2(10) NOT NULL, /* �����ȭ��ȣ1 */
	mem_gra_tel2 VARCHAR2(10) NOT NULL, /* �����ȭ��ȣ2 */
	mem_gra_tel3 VARCHAR2(10) NOT NULL, /* �����ȭ��ȣ3 */
	user_id VARCHAR2(30), /* ȸ�����̵� */
	mem_grade VARCHAR2(30) NOT NULL, /* ��� */
	mem_gra_regdate DATE NOT NULL, /* ��ް����� */
	mem_gra_reason VARCHAR2(1000) NOT NULL, /* �������� */
	admin_id VARCHAR2(30) NOT NULL, /* �����ھ��̵� */
	mem_gra_deldate DATE /* ��޻����� */
);

ALTER TABLE Member_grade
	ADD
		CONSTRAINT PK_Member_grade
		PRIMARY KEY (
			mem_gra_no
		);



/* Reserv_User ����ȸ������ */
CREATE TABLE Reserv_User (
	user_id VARCHAR2(30) NOT NULL, /* ȸ�����̵� */
	res_u_name VARCHAR2(30) NOT NULL, /* �������̸� */
	res_u_tel1 VARCHAR2(10) NOT NULL, /* ��������ȭ1 */
	res_u_tel2 VARCHAR2(10) NOT NULL, /* ��������ȭ2 */
	res_u_tel3 VARCHAR2(10) NOT NULL, /* ��������ȭ3 */
	res_u_mail1 VARCHAR2(50) NOT NULL, /* �������̸���1 */
	res_u_mail2 VARCHAR2(50) NOT NULL, /* �������̸���2 */
	res_drv_name VARCHAR2(30) NOT NULL, /* �������̸� */
	res_drv_tel1 VARCHAR2(10) NOT NULL, /* ��������ȭ1 */
	res_drv_tel2 VARCHAR2(10) NOT NULL, /* ��������ȭ2 */
	res_drv_tel3 VARCHAR2(10) NOT NULL, /* ��������ȭ3 */
	res_drv_birth DATE NOT NULL, /* ������� */
	res_drv_category VARCHAR2(10) NOT NULL /* �������� */
);

ALTER TABLE Reserv_User
	ADD
		CONSTRAINT PK_Reserv_User
		PRIMARY KEY (
			user_id
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
		CONSTRAINT FK_Res_User_TO_Res
		FOREIGN KEY (
			user_id
		)
		REFERENCES Reserv_User (
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
		CONSTRAINT FK_rent_us_TO_Res_User
		FOREIGN KEY (
			user_id
		)
		REFERENCES rent_user (
			user_id
		);