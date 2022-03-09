package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.UserVo;

@Repository
public class MyUserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int signup(UserVo userVo) {
		System.out.println("signup.dao");
		System.out.println(userVo);
		return sqlSession.insert("myUser.signup", userVo);
	}
	
	public UserVo login(UserVo userVo) {
		System.out.println("login.dao");
		return sqlSession.selectOne("myUser.login", userVo);
	}
}
