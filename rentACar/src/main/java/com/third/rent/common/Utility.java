package com.third.rent.common;

public class Utility {
	public static final int BLOCKSIZE = 3;
	public static final int RECORDCOUNT_PERPAGE = 2;
	
	//업체 차량현황 리스트 페이징
	public static final int COM_BLOCKSIZE = 5; 
	public static final int COM_RECORDCOUNT_PERPAGE = 15;
	
	//관리자 업체 관리
	public static final int ADMIN_COMPANY_BLOCKSIZE = 10;
	public static final int ADMIN_COMPANY_RECORDCOUNT_PERPAGE = 1;
	
	//관리자 탈퇴업체 관리
	public static final int ADMIN_OUT_COMPANY_BLOCKSIZE = 5;
	public static final int ADMIN_OUT_COMPANY_RECORDCOUNT_PERPAGE = 5;
	
	//관리자 업체보유차량
	public static final int ADMIN_COMPANY_CAR_BLOCKSIZE = 10;
	public static final int ADMIN_COMPANY_CAR_RECORDCOUNT_PERPAGE = 4;
	
	//관리자 결제정보 페이지 처리용
	public static final int ADMIN_PAYINFO_BLOCKSIZE=10;
	public static final int ADMIN_PAYINFO_RECORDCOUNT_PERPAGE=10;
	
	//사용자 예약가능 차량 페이징 처리용
	public static final int USER_RESERV_BLOCKSIZE=5;
	public static final int USER_RESERV_RECORDCOUNT_PERPAGE=8;
}
