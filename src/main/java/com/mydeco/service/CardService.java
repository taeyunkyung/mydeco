package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.CardDao;
import com.mydeco.vo.CardReplyVo;
import com.mydeco.vo.CardVo;
import com.mydeco.vo.UserVo;

@Service
public class CardService {//�ڷ��� ����,���

	@Autowired
	CardDao cardDao;

	
	public void sendcard(CardVo cardVo) {
		System.out.println("service > dao 로 작성카드 전달");
		System.out.println(cardVo);
		
		//원본카드 저장
		cardDao.sendcard(cardVo);
		
		//저장후 카드번호 가져오기 selectKey 사용
		int cardNo = cardVo.getCardNo();
		
		System.out.println("============================");
		System.out.println(cardVo);
		System.out.println("============================");
		
		//대상자 뽑기   유저 테이블 조회 리스트로 가져온다
		List<CardReplyVo> cardReplyList = cardDao.selectTargetList(cardVo);
		System.out.println("============================");
		System.out.println(cardVo);
		System.out.println("============================");
		
		//댓글카드 저장 여러개
		for(int i=0; i<=cardReplyList.size(); i++) {
			CardReplyVo cardReplyVo = cardReplyList.get(i);
			cardReplyVo.setCardNo(cardNo);
			cardReplyVo.setSendYN("N");
			cardDao.replyCardInsert(cardReplyVo);
		}
		
		
	}
	
	public void receivecard(CardVo cardVo) {
		System.out.println("service > dao 로 받은카드 전달");
		System.out.println(cardVo);
		cardDao.sendcard(cardVo);
	}
	
	public void cardImg(CardVo cardVo) {
		System.out.println("service > dao 로 카드이미지 전달");
		System.out.println(cardVo);
		cardDao.cardImg(cardVo);
	}
	
	
	public List<CardVo> imgList(){
		System.out.println("서비스의 imgList");
		List<CardVo> imgList = cardDao.imgList();
		System.out.println("서비스의 imgList확인용"+imgList);

		return imgList;
	}
	
	public List<CardVo> ListaddCount(int no){
		System.out.println("서비스의 ListaddCount");
		List<CardVo> addList = cardDao.ListaddCount(no);
		System.out.println("서비스의 addList확인용"+addList);
		
		return addList;
	}
	
	public List<CardReplyVo> receiveCardList(int no){
		System.out.println("서비스의 리시브카드리스트 진입");
		List<CardReplyVo> dList = cardDao.receiveCardList(no);
		System.out.println("서비스의 dList"+dList);
		return dList;
	}

//	public String getOneAge(int no) {
//		System.out.println("서비스의 겟원에이지");
//		
//		int age = cardDao.getOneAge(no);
//		
//		if(age < 20) {
//			System.out.println("컨트롤러의 10대 출력");
//			return "teen";
//		}else if(age<30) {
//			System.out.println("컨트롤러의 20대 출력");
//			return "twn";
//		}else if(age<40) {
//			System.out.println("컨트롤러의 30대 출력");
//			return "trn";
//		}else {
//			System.out.println("컨트롤러의 40대 출력");
//			return "ftn";
//		}
//	}
	
	
}