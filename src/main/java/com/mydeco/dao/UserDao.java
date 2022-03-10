package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo selectUser(UserVo userVo) {
		System.out.println("유저다오접근");
		System.out.println("다오의"+ userVo);
		UserVo authUser = sqlSession.selectOne("user.login", userVo);
		System.out.println("유저정보받아옴");
		return authUser;
	}
	
}
