package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.CardDao;
import com.mydeco.vo.CardImgVo;
import com.mydeco.vo.CardVo;

@Service
public class CardService {//�ڷ��� ����,���

	@Autowired
	CardDao cardDao;

	
	public void cardImg(CardVo cardVo) {
		System.out.println("service > dao 로 카드이미지 전달");
		System.out.println(cardVo);
		cardDao.cardImg(cardVo);
	}
	
	public List<CardImgVo> imgList(){
		System.out.println("서비스의 igList");
		List<CardImgVo> imgList = cardDao.imgList();
		return imgList;
	}
}