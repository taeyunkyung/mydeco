package com.mydeco.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MydiaryDao;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Service
public class MydiaryService {
	
	@Autowired 
	MydiaryDao mydiaryDao;
	
	/*다이어리 리스트 가져오기*/
	public List<DiaryContentVo> getDiaryContentList(UserVo authUser){
		
		List<DiaryContentVo> dcList = mydiaryDao.getDiaryContentList(authUser);
		List<DiaryContentVo> diarycontentList = new ArrayList<DiaryContentVo>();
		//List<DiaryItemVo> diarySticker = mydiaryDao.getDiaryStickerList();
		for(int i=0; i<dcList.size(); i++) {
			
			/*다이어리 리스트 중 하나--##*/
			DiaryContentVo diarycontent = dcList.get(i);
			
			/*다이어리 개별 다이어리번호 가져오기*/
			int diaryNo = dcList.get(i).getDiaryNo();
			System.out.println(diaryNo);
			
			/*각 다이어리마다 사용된 스티커 가져오기--$$*/
			List<DiaryItemVo> diaryitemList = mydiaryDao.getDiaryStickerList(diaryNo);
			
			
			/* ##의 itemList에 $$ 추가하기*/
			diarycontent.setItemList(diaryitemList);
			
			/*리스트로 모으기*/
			diarycontentList.add(diarycontent);
		}
		System.out.println(diarycontentList);
		System.out.println("=======");
		return diarycontentList;
		//return dcList;
	}
	
	/*다이어리 번호별 리스트*/
	/*
	public List<DiaryContentVo> getDiaryNoContentList(UserVo authUser){
		
		List<DiaryContentVo> dcList = mydiaryDao.getDiaryContentList(authUser);
		List<DiaryContentVo> diarycontentList = new ArrayList<DiaryContentVo>();
		
		for(int i=0; i<dcList.size(); i++) {
		
			/*다이어리 개별 다이어리번호 가져오기*/
			
			//int diaryNo = dcList.get(i).getDiaryNo();
			
			/*다이어리 내용 번호별로 가져오기--##*/
			//List<DiaryContentVo> diaryContent = mydiaryDao.getDiaryNoContentList(diaryNo);
			
			/*각 다이어리마다 사용된 스티커 가져오기--$$*/
			//List<DiaryItemVo> diaryitemList = mydiaryDao.getDiaryStickerList(diaryNo);
		
			/* ##의 itemList에 $$ 추가하기*/
			//diaryContent.setItemList(diaryitemList);
	/*	}
		
		return "";
	}*/
	
	/*다이어리 쓴 날짜 리스트*/
	public List<DiaryContentVo> getDiaryDateList(UserVo authUser){
		return mydiaryDao.getDiaryDateList(authUser);
	}
	
	
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
		
		/*다이어리 번호(seq_diary_no.nextval) 가져오기*/
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
		System.out.println("aaa");
	
		return 1;
	}
	
	/*일기에 쓴 스티커 저장하기*/
	/*
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
		
	//}
	
}
