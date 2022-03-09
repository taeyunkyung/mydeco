package com.mydeco.service;

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
	
	public UserVo login(UserVo userVo) {
		System.out.println("login.service");
		return myUserDao.login(userVo);
	}
	
}
