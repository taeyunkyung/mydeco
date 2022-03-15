package com.mydeco.dao;

import java.util.List;

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
	
	public List<UserVo> searchId(String keyword) {
		return sqlSession.selectList("myUser.searchId", keyword);
	}
	
	public UserVo login(UserVo userVo) {
		System.out.println("login.dao");
		return sqlSession.selectOne("myUser.login", userVo);
	}
	
	public UserVo selectByNo(int userNo) {
		return sqlSession.selectOne("myUser.selectByNo", userNo);
	}	
	
	public int update(UserVo userVo) {
		return sqlSession.update("myUser.update", userVo);
	}
}
