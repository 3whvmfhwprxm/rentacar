package com.third.rent.counselor.model;

import java.sql.Timestamp;

public class CommentsVO {
	
	private int cmtNo;				/* 코멘트번호 */
	private String cmtContent; 		/* 코멘트내용 */
	private String userId; 			/* 회원아이디 */
	private String comId; 			/* 업체아이디 */
	private int cmtKindScore; 		/* 친절도 */
	private int cmtCleanScore;		/* 청결도 */
	private int cmtConvScore; 		/* 편의성 */
	private String cmtImg1; 		/* 후기이미지1 */
	private String cmtImg2; 		/* 후기이미지2 */
	private Timestamp cmtRegdate;   /* 기록일 */
	private Timestamp cmtDeldate;   /* 삭제일 */
	private String adminId; 		/* 관리자아이디 */
	
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public int getCmtKindScore() {
		return cmtKindScore;
	}
	public void setCmtKindScore(int cmtKindScore) {
		this.cmtKindScore = cmtKindScore;
	}
	public int getCmtCleanScore() {
		return cmtCleanScore;
	}
	public void setCmtCleanScore(int cmtCleanScore) {
		this.cmtCleanScore = cmtCleanScore;
	}
	public int getCmtConvScore() {
		return cmtConvScore;
	}
	public void setCmtConvScore(int cmtConvScore) {
		this.cmtConvScore = cmtConvScore;
	}
	public String getCmtImg1() {
		return cmtImg1;
	}
	public void setCmtImg1(String cmtImg1) {
		this.cmtImg1 = cmtImg1;
	}
	public String getCmtImg2() {
		return cmtImg2;
	}
	public void setCmtImg2(String cmtImg2) {
		this.cmtImg2 = cmtImg2;
	}
	public Timestamp getCmtRegdate() {
		return cmtRegdate;
	}
	public void setCmtRegdate(Timestamp cmtRegdate) {
		this.cmtRegdate = cmtRegdate;
	}
	public Timestamp getCmtDeldate() {
		return cmtDeldate;
	}
	public void setCmtDeldate(Timestamp cmtDeldate) {
		this.cmtDeldate = cmtDeldate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	@Override
	public String toString() {
		return "CommentsVO [cmtNo=" + cmtNo + ", cmtContent=" + cmtContent + ", userId=" + userId + ", comId=" + comId
				+ ", cmtKindScore=" + cmtKindScore + ", cmtCleanScore=" + cmtCleanScore + ", cmtConvScore="
				+ cmtConvScore + ", cmtImg1=" + cmtImg1 + ", cmtImg2=" + cmtImg2 + ", cmtRegdate=" + cmtRegdate
				+ ", cmtDeldate=" + cmtDeldate + ", adminId=" + adminId + "]";
	}
	
	
	
	
}
