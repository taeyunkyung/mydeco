package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.CardReplyVo;
import com.mydeco.vo.CardVo;

@Repository
public class CardDao {

	@Autowired 
	SqlSession sqlSession;
	
	//원본카드 저장
	public void sendcard(CardVo cardVo) {
		System.out.println("dao.sendcard 접속완");
		System.out.println(cardVo);
		sqlSession.insert("card.sendcard", cardVo);
		System.out.println("insert완료");
	}
	
	/*내가 쓴 카드 리스트*/
	public List<CardVo> ListaddCount(int no){
		System.out.println("다오의 ListaddCount 접속");
		List<CardVo> addList = sqlSession.selectList("card.ListaddCount", no);
		System.out.println("다오의 ListaddCount확인용"+ addList);
		return addList; 
		
	}
	
	//카드수신 대상자 추출
	public List<CardReplyVo> selectTargetList(CardVo cardVo) {
		System.out.println("dao.selectTargetList 접속완");
		System.out.println("다오의 셀렉트타겟리스트");
		List<CardReplyVo> cardReplyList = sqlSession.selectList("card.selectTargetList", cardVo);
		
		return cardReplyList;
	}
	
	//답장카드 저장 보내기 개념
	public int replyCardInsert(CardReplyVo cardReplyVo) {
		System.out.println("dao.replyCardInsert 접속완");
		
		return sqlSession.insert("card.replyCardInsert", cardReplyVo);
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

	
	
	/*받은 카드 리스트 출력*/											
	public List<CardReplyVo> receiveCardList(int no){
		System.out.println("다오의 카드리스트 진입");
		System.out.println("다오의 카드vo" + no);
		List<CardReplyVo> dList = sqlSession.selectList("card.receiveCardList",no);
		System.out.println("다오의 dList" +dList);
		return dList;
	}
	
//	public 포캣몬빵 삼립(재료 포캣몬빵재료 ) {
//		System.out.println("공장 진입");
//		
//		포캣몬빵 빵뭉탱이 = sqlSession.빵만들기("1공정.파이리빵", 포캣몬빵재료);
//		
//		return 포캣몬빵;
//	}

//	/*연령대 넣기*/
//	public int getOneAge(int no) {
//		System.out.println("다오의 겟원에이지 도킹");
//		int countage = sqlSession.selectOne("card.selectTargetList",no);
//		System.out.println("겟원에이지 확인용" + countage);
//		return countage;
//	}
	
	
}
