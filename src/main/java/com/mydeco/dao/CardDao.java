package com.mydeco.dao;

import java.util.List;

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
		System.out.println(cardVo);
		sqlSession.insert("card.sendcard", cardVo);
		System.out.println("insert완료");
	}
	
	public void receivecard(CardVo cardVo) {
		System.out.println("dao.receivecard 접속완");
		System.out.println(cardVo);
		sqlSession.insert("card.receivecard", cardVo);
		System.out.println("insert완료");
	}
	
	public void cardImg(CardVo cardVo) {
		System.out.println("dao.cardImg 접속완");
		System.out.println(cardVo);
		sqlSession.insert("card.cardImg", cardVo);
		System.out.println("insert완료");
	}
	
	public List<CardVo> imgList(){
		System.out.println("다오의 imgList");
		List<CardVo> bgList = sqlSession.selectList("card.cardbg");
		System.out.println("다오의 bgList확인용"+bgList);
		return bgList;
	}
	
	
	
	
	
	
}
