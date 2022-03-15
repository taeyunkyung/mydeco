package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.CardImgVo;
import com.mydeco.vo.CardVo;

@Repository
public class CardDao {

	@Autowired 
	SqlSession sqlSession;
	

	public void cardImg(CardVo cardVo) {
		System.out.println("dao.cardImg 접속완");
		System.out.println(cardVo);
		sqlSession.insert("card.cardImg", cardVo);
	}
	
	public List<CardImgVo> imgList(){
		System.out.println("다오의 imgList");
		List<CardImgVo> bgList = sqlSession.selectList("card.cardbg");
		return bgList;
	}
	
	
	
}
