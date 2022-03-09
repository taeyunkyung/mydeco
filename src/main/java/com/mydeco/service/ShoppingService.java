package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.ShoppingDao;
import com.mydeco.vo.UserVo;

@Service
public class ShoppingService {
	
	@Autowired
	private ShoppingDao shoppingDao;
	
	public UserVo login(UserVo userVo) {
		System.out.println("로그인서비스 도킹");
		
		UserVo authUser = shoppingDao.selectUser(userVo);
		return authUser;
	}
	
}
