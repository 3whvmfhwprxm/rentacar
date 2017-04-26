package com.third.rent.highcharts.model;

import java.util.List;

import com.third.rent.user.model.UserVO;

public interface Highcharts_UserDAO {
	public List<UserVO> selectAllUserByChart();
}
