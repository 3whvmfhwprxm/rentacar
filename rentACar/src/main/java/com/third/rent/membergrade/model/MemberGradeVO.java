package com.third.rent.membergrade.model;

import java.sql.Timestamp;

public class MemberGradeVO {
	private int memGraNo; 				/* 대상회원번호 */
	private String memGraTel1;			/* 대상전화번호1 */
	private String memGraTel2;			/* 대상전화번호2 */
	private String memGraTel3; 			/* 대상전화번호3 */
	private String userId; 				/* 회원아이디 */
	private String memGrade; 			/* 등급 */
	private Timestamp memGraRegdate;	/* 등급결정일 */
	private String memGraReason; 		/* 결정사유 */
	private String adminId; 			/* 관리자아이디 */
	private Timestamp memGraDeldate; 	/* 등급삭제일 */
	
	public int getMemGraNo() {
		return memGraNo;
	}
	public void setMemGraNo(int memGraNo) {
		this.memGraNo = memGraNo;
	}
	public String getMemGraTel1() {
		return memGraTel1;
	}
	public void setMemGraTel1(String memGraTel1) {
		this.memGraTel1 = memGraTel1;
	}
	public String getMemGraTel2() {
		return memGraTel2;
	}
	public void setMemGraTel2(String memGraTel2) {
		this.memGraTel2 = memGraTel2;
	}
	public String getMemGraTel3() {
		return memGraTel3;
	}
	public void setMemGraTel3(String memGraTel3) {
		this.memGraTel3 = memGraTel3;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemGrade() {
		return memGrade;
	}
	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}
	public Timestamp getMemGraRegdate() {
		return memGraRegdate;
	}
	public void setMemGraRegdate(Timestamp memGraRegdate) {
		this.memGraRegdate = memGraRegdate;
	}
	public String getMemGraReason() {
		return memGraReason;
	}
	public void setMemGraReason(String memGraReason) {
		this.memGraReason = memGraReason;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public Timestamp getMemGraDeldate() {
		return memGraDeldate;
	}
	public void setMemGraDeldate(Timestamp memGraDeldate) {
		this.memGraDeldate = memGraDeldate;
	}
	
	@Override
	public String toString() {
		return "MemberGradeVO [memGraNo=" + memGraNo + ", memGraTel1=" + memGraTel1 + ", memGraTel2=" + memGraTel2
				+ ", memGraTel3=" + memGraTel3 + ", userId=" + userId + ", memGrade=" + memGrade + ", memGraRegdate="
				+ memGraRegdate + ", memGraReason=" + memGraReason + ", adminId=" + adminId + ", memGraDeldate="
				+ memGraDeldate + "]";
	}
	
}
