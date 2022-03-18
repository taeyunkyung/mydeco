package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.CardDao;
import com.mydeco.vo.CardVo;

@Service
public class CardService {//�ڷ��� ����,���

	@Autowired
	CardDao cardDao;

	
	public void sendcard(CardVo cardVo) {
		System.out.println("service > dao 로 작성카드 전달");
		System.out.println(cardVo);
		
		//원본카드 저장
		cardDao.sendcard(cardVo);
		
		//대상자 뽑기   유저 테이블 조회 리스트로 가져온다
		//주민번호 오늘년도 나이계산,  성별
		
		//댓글카드 저장 여러개
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
}