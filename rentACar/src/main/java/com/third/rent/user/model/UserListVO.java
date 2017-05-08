package com.third.rent.user.model;

import java.util.List;

public class UserListVO {
	
	private List<UserVO> userItems;

	public List<UserVO> getUserItems() {
		return userItems;
	}

	public void setUserItems(List<UserVO> userItems) {
		this.userItems = userItems;
	}

	@Override
	public String toString() {
		return "UserListVO [userItems=" + userItems + "]";
	}
}
