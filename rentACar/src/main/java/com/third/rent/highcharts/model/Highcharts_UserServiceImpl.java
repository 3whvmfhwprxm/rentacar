package com.third.rent.highcharts.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.third.rent.user.model.UserVO;

@Service
public class Highcharts_UserServiceImpl implements Highcharts_UserService{
	@Autowired
	private Highcharts_UserDAO highchartUserDao;
	
	@Override
	public List<UserVO> selectAllUserByChart() {
		return highchartUserDao.selectAllUserByChart();
	}

}
