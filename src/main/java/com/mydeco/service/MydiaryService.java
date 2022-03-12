package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mydeco.dao.MydiaryDao;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
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
	
	/*
	public void dbpaper() {
			
		    for(int i=1; i<2; i++) {
		    	String paperName = i + ".jpg";
		    	String paperSrc = "/mydeco/assets/img/diarypaper/"+paperName;
		    
		    	PaperVo vo = new PaperVo(paperName,paperSrc);
		    	mydiaryDao.dbpaper(vo);
	    }	
	}*/
	

	/*스티커목록 가져오기*/
	public List<StickerVo> getStickerList(){
		
		return mydiaryDao.getStickerList();
	}
	
	/*종이목록 가져오기*/
	/*
	public List<PaperVo> getPaperList(){
		
		return mydiaryDao.getPaperList();
	}*/
	
	/*일기에 쓴 컨텐츠 저장하기*/
	// db error rollback
	//	@Transactional
	public int addContent(DiaryContentVo diarycontentvo){
		
		mydiaryDao.addContent(diarycontentvo);
		int diaryno = mydiaryDao.selectDiaryNo();
		System.out.println(diaryno);
		
		List<DiaryItemVo> diarysticker = diarycontentvo.getItemList();
		for(int i = 0; i<diarysticker.size(); i++) {
			DiaryItemVo diarySticker = diarysticker.get(i);
			diarySticker.setDiaryNo(diaryno);
			
			if(diarySticker.getText() == null) {
				diarySticker.setText("");
			}
			mydiaryDao.addSticker(diarySticker);
		}
		
		return 1;
	}
	
	/*일기에 쓴 스티커 저장하기*/
	public void addSticker(DiaryContentVo diarycontentvo) {
		/*
		List<DiaryItemVo> diarysticker = diarycontentvo.getItemList();
		System.out.println(diarysticker);
		System.out.println("-=====================");
		System.out.println(diarysticker.get(2));
		
		for(int i=0; i<diarysticker.size(); i++) {
			/*
			diarysticker.get(i).getDiaryItemNo();
			diarysticker.get(i).getDiaryNo();
			diarysticker.get(i).getStickerNo();
			diarysticker.get(i).getTop();
			diarysticker.get(i).getLeft();
			diarysticker.get(i).getScaleX();
			diarysticker.get(i).getScaleY();
			diarysticker.get(i).getAngle();
			diarysticker.get(i).getText();*/
			/*
			DiaryItemVo diarySticker = diarysticker.get(i);
			System.out.println(diarySticker);
			System.out.println(diarysticker.size());
			mydiaryDao.addSticker(diarySticker);*/
		/*}*/
		
		// mydiaryDao.addSticker(diarycontentvo);
		
	}
	
}
