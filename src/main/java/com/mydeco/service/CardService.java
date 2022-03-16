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
		System.out.println("service > dao 로 카드이미지 전달");
		System.out.println(cardVo);
		cardDao.sendcard(cardVo);
	}
	
	public List<CardVo> imgList(){
		System.out.println("서비스의 imgList");
		List<CardVo> imgList = cardDao.imgList();
		return imgList;
	}
}