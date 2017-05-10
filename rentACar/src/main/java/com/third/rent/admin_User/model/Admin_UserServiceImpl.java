package com.third.rent.admin_User.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.third.rent.admin_LogState.model.admin_LogService;
import com.third.rent.common.SearchVO;
import com.third.rent.user.model.UserVO;

@Service
public class Admin_UserServiceImpl implements Admin_UserService{
	@Autowired
	private Admin_UserDAO adminUserDao;
	
	@Override
	public List<UserVO> selectAll(SearchVO searchVo){
		return adminUserDao.selectAll(searchVo);
	}
	
	@Override
	public int selectTotalRecord(SearchVO searchVo){
		return adminUserDao.selectTotalRecord(searchVo);
	}

	@Override
	public UserVO selectByUserId(String userId) {
		return adminUserDao.selectByUserId(userId);
	}

	@Override
	public List<UserVO> selectInUser(SearchVO searchVo) {
		return adminUserDao.selectInUser(searchVo);
	}

	@Override
	public List<UserVO> selectOutUser(SearchVO searchVo) {
		return adminUserDao.selectOutUser(searchVo);
	}

	@Override
	public int userWithdraw(String userId) {
		return adminUserDao.userWithdraw(userId);
	}

	@Override
	public int loginCheck(String adminId, String adminPwd) {
		int result=0;
		String dbPwd = adminUserDao.selectPwdByAdminId(adminId);
		
		if(dbPwd==null || dbPwd.isEmpty()){
			result = admin_LogService.ID_NONE;
		}else{		
			if(adminPwd.equals(dbPwd)){
				result = admin_LogService.LOGIN_OK;
			}else{
				result = admin_LogService.PWD_DISAGREE;
			}
		}		
		return result;
	}

	@Override
	@Transactional
	public int userMultiWithdraw(List<UserVO> userList) {
		int cnt = 0;
		try {
			for (UserVO userVo : userList) {
				if (userVo.getUserId()!=null) {
					cnt = adminUserDao.userWithdraw(userVo.getUserId());
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}

		return cnt;
	}

	@Override
	@Transactional
	public int userMultiReregister(List<UserVO> userList) {
		int cnt = 0;
		try {
			for (UserVO userVo : userList) {
				if (userVo.getUserId()!=null) {
					cnt = adminUserDao.reRegisterUser(userVo.getUserId());
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
		}

		return cnt;
	}

	@Override
	public int updateUser(String userId) {
		return adminUserDao.updateUser(userId);
	}
}
