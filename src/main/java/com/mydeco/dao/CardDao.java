package com.mydeco.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.CardReplyVo;
import com.mydeco.vo.CardVo;
import com.mydeco.vo.CardandReplyVo;

@Repository
public class CardDao {

	@Autowired 
	SqlSession sqlSession;
	
	/*보낸카드(자신이 작성한) 리스트 가져오기*/
	public List<CardVo> selectListCard(int userNo){
		System.out.println("CardDao.selectListCard()");
		
		List<CardVo> cardList = sqlSession.selectList("card.selectListCard", userNo);
		return cardList; 
		
	}
	
	
	/*받은 카드 리스트 출력*/											
	public List<CardReplyVo> selectListReplyCard(int userNo){
		System.out.println("CardDao.selectListReplyCard()");
		
		List<CardReplyVo> replyCardList = sqlSession.selectList("card.selectListReplyCard", userNo);
		return replyCardList;
	}
	
	
	/*선택한 받은 카드 가져오기*/
	public CardandReplyVo selectReplyOne(Map<String, Object> map) {
		System.out.println("Dao > SelectReplyOne "+ map);
		CardandReplyVo cardandreplyVo = sqlSession.selectOne("card.selectReplyOne", map);
		System.out.println("ReplyVo반환확인용"+ cardandreplyVo);
		return cardandreplyVo;
	}
	
	
	
	
	
	//원본카드 저장
	public void sendcard(CardVo cardVo) {
		System.out.println("dao.sendcard 접속완");
		System.out.println(cardVo);
		sqlSession.insert("card.sendcard", cardVo);
		System.out.println("insert완료");
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
