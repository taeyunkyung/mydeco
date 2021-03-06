package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.UserDao;
import com.mydeco.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public UserVo login(UserVo userVo) {
		System.out.println("유저서비스접근");
		UserVo authUser = userDao.selectUser(userVo);
		
		return authUser;
	}
}
