package com.third.rent.counselor.model;

import java.sql.Timestamp;

public class CounselVO {
	
	private int counselId;				 /*상담번호*/ 
	private String userId;   			 /*회원아이디*/
	private String userTel1;   			 /*전화번호1*/ 
	private String userTel2;  			 /* 전화번호2 */
	private String userTel3; 			 /* 전화번호3 */
	private String counselCategory;  	 /* 상담종류 */
	private String counselContent; 	 	 /* 상담내용 */
	private Timestamp counselRegdate;	 /* 상담시간 */
	private String counselResult;  	 	 /* 처리내용 */
	private String counselResultFlag;    /* 처리결과 */
	private String adminId; 			 /* 관리자아이디 */
	
	public int getCounselId() {
		return counselId;
	}
	public void setCounselId(int counselId) {
		this.counselId = counselId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserTel1() {
		return userTel1;
	}
	public void setUserTel1(String userTel1) {
		this.userTel1 = userTel1;
	}
	public String getUserTel2() {
		return userTel2;
	}
	public void setUserTel2(String userTel2) {
		this.userTel2 = userTel2;
	}
	public String getUserTel3() {
		return userTel3;
	}
	public void setUserTel3(String userTel3) {
		this.userTel3 = userTel3;
	}
	public String getCounselCategory() {
		return counselCategory;
	}
	public void setCounselCategory(String counselCategory) {
		this.counselCategory = counselCategory;
	}
	public String getCounselContent() {
		return counselContent;
	}
	public void setCounselContent(String counselContent) {
		this.counselContent = counselContent;
	}
	public Timestamp getCounselRegdate() {
		return counselRegdate;
	}
	public void setCounselRegdate(Timestamp counselRegdate) {
		this.counselRegdate = counselRegdate;
	}
	public String getCounselResult() {
		return counselResult;
	}
	public void setCounselResult(String counselResult) {
		this.counselResult = counselResult;
	}
	public String getCounselResultFlag() {
		return counselResultFlag;
	}
	public void setCounselResultFlag(String counselResultFlag) {
		this.counselResultFlag = counselResultFlag;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	@Override
	public String toString() {
		return "CounselVO [counselId=" + counselId + ", userId=" + userId + ", userTel1=" + userTel1 + ", userTel2="
				+ userTel2 + ", userTel3=" + userTel3 + ", counselCategory=" + counselCategory + ", counselContent="
				+ counselContent + ", counselRegdate=" + counselRegdate + ", counselResult=" + counselResult
				+ ", counselResultFlag=" + counselResultFlag + ", adminId=" + adminId + "]";
	}
	
	
	
	
}
