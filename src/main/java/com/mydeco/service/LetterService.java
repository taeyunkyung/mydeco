package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.LetterDao;
import com.mydeco.vo.StickerVo;

@Service
public class LetterService {

	@Autowired
	LetterDao letterDao;
	
	//스티커 이름과 경로 vo에 담은 뒤 dao에 전송(스티커 목록 삽입)
	public void stickerDB() {
		
	    for(int i=1; i<55; i++) {
	    	String stickerName = i + ".png";
	    	String stickerSrc = "/mydeco/assets/img/sticker/"+stickerName;
	    
	    	StickerVo vo = new StickerVo(stickerName,stickerSrc);
	    	letterDao.stickerDB(vo);
	    }	
	}
	
	//스티커목록 가져오기
	public List<StickerVo> getStickerList(){
		
		return letterDao.getStickerList();
	}
}
