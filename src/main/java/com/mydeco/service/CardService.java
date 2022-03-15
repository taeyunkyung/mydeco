package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.CardDao;
import com.mydeco.vo.CardVo;

@Service
public class CardService {//�ڷ��� ����,���

	@Autowired
	CardDao cardDao;

	
	public void sendcard(CardVo cardVo) {
		System.out.println("service sendcard");
		cardDao.sendcard(cardVo);
	}
	
}