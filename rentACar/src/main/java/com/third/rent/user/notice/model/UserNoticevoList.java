package com.third.rent.user.notice.model;

import java.util.List;

public class UserNoticevoList {
	private List<UserNoticeVO> uvolist;

	public List<UserNoticeVO> getUvolist() {
		return uvolist;
	}

	public void setUvolist(List<UserNoticeVO> uvolist) {
		this.uvolist = uvolist;
	}

	@Override
	public String toString() {
		return "UserNoticevoList [uvolist=" + uvolist + "]";
	}
	
}
