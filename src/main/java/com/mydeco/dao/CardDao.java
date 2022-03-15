package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.CardVo;

@Repository
public class CardDao {

	@Autowired 
	SqlSession sqlSession;
	

	public void sendcard(CardVo cardVo) {
		System.out.println("dao.sendcard 접속완");
		
		sqlSession.insert("card.sendcard", cardVo);
	}
	
	
}
