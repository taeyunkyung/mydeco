package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MydiaryDao;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.PaperVo;
import com.mydeco.vo.StickerVo;

@Service
public class MydiaryService {
	
	@Autowired 
	MydiaryDao mydiaryDao;
	
	public void dbsticker() {
		
	    for(int i=1; i<55; i++) {
	    	String stickerName = i + ".png";
	    	String stickerSrc = "/mydeco/assets/img/sticker/"+stickerName;
	    
	    	StickerVo vo = new StickerVo(stickerName,stickerSrc);
	    	mydiaryDao.dbsticker(vo);
	    }	
	}
	
	public void dbpaper() {
			
		    for(int i=1; i<2; i++) {
		    	String paperName = i + ".jpg";
		    	String paperSrc = "/mydeco/assets/img/diarypaper/"+paperName;
		    
		    	PaperVo vo = new PaperVo(paperName,paperSrc);
		    	mydiaryDao.dbpaper(vo);
	    }	
	}
	

	/*스티커목록 가져오기*/
	public List<StickerVo> getStickerList(){
		
		return mydiaryDao.getStickerList();
	}
	
	/*종이목록 가져오기*/
	public List<PaperVo> getPaperList(){
		
		return mydiaryDao.getPaperList();
	}
	
	/*일기에 쓴 스티커 저장하기*/
	public void addSticker(List<DiaryItemVo> diaryItemVo){
		
		mydiaryDao.addSticker(diaryItemVo);
	}
	
	
}
