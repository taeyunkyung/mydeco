package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MydiaryDao;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo2;

@Service
public class MydiaryService {
	
	@Autowired 
	MydiaryDao mydiaryDao;
	
	public void dbsticker() {
		
	    for(int i=1; i<55; i++) {
	    	String stickerName = i + ".png";
	    	String stickerSrc = "/mydeco/assets/img/sticker/"+stickerName;
	    
	    	StickerVo2 vo = new StickerVo2(stickerName,stickerSrc);
	    	mydiaryDao.dbsticker(vo);
	    }	
	}
	

	/*스티커목록 가져오기*/
	public List<StickerVo2> getStickerList(){
		
		return mydiaryDao.getStickerList();
	}
	
	/*일기에 쓴 스티커 저장하기*/
	public void addSticker(List<DiaryItemVo> diaryItemVo){
		
		mydiaryDao.addSticker(diaryItemVo);
	}
	
	
}
