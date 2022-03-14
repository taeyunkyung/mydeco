package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MyUserDao;
import com.mydeco.vo.UserVo;

@Service
public class MyUserService {

	@Autowired
	private MyUserDao myUserDao;
	
	public int signup(UserVo userVo) {
		System.out.println("signup.service");
		return myUserDao.signup(userVo);
	}
	
	public boolean idCheck(String keyword) {
		System.out.println("UserService.checkId");
		List<UserVo> list = myUserDao.searchId(keyword);
		
		boolean result = false;
		if(list.isEmpty() == true) {
			result = true;
		}
		return result;
	}
	
	public UserVo login(UserVo userVo) {
		System.out.println("login.service");
		return myUserDao.login(userVo);
	}
	
	public UserVo modifyForm(int userNo) {
		return myUserDao.selectByNo(userNo);
	}
	
	public int modify(UserVo userVo) {
		return myUserDao.update(userVo);
	}
}
