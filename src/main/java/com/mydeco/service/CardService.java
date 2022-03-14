package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.CardDao;
import com.mydeco.vo.CardImgVo;

@Service
public class CardService {//자료의 조작,계산

	@Autowired
	CardDao cardDao;

	public void cardimgDB() {

		for (int i = 1; i < 9; i++) {
			String cardImgName = i + ".png";
			String cardImgSrc = "/mydeco/assets/img/card/" + cardImgName;

			CardImgVo vo = new CardImgVo(cardImgName,cardImgSrc);
			cardDao.cardimgDB(vo);
		}
	}
		
		public List<CardImgVo> getCardImgList(){
			return cardDao.getCardImgList();
		}
	}
