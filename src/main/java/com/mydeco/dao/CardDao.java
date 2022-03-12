package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.mydeco.vo.CardImgVo;

@Repository
public class CardDao {

	@Autowired 
	SqlSession sqlSession;
	

	public void cardimgDB(CardImgVo cardimgVo) {
		System.out.println("디비 이미지 불러오기");
		
		sqlSession.insert("Card.cardimgDB", cardimgVo);
	}
	
	
	public List<CardImgVo> getCardImgList(){
		return sqlSession.selectList("Card.getCardImgList");
	}
}
