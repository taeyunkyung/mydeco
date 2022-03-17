package com.mydeco.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		return dcList;
	}
	
	
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
	
	
	/*다이어리번호가 ? 인 다이어리의 정보*/
	public DiaryContentVo getOneDiary(int diaryNo) {
		
		/*다이어리 정보*/
		DiaryContentVo diarycontent = mydiaryDao.getDiary(diaryNo);
		System.out.println(diarycontent);
		
		/*220316쿼리문 수정*/
		/*다이어리 스티커 정보*/
		List<DiaryItemVo> diaryItem = mydiaryDao.getDiaryItemList(diaryNo);
		System.out.println(diaryItem);
		
		diarycontent.setItemList(diaryItem);
		
		return diarycontent;
	}
	
	
	/* 220316수정 */
	/*스티커목록(꾸기미패널) 가져오기*/
	public Map<String, List<StickerVo>> getStickerList(){
		
		List<StickerVo> stickerList = mydiaryDao.getStickerList(2);//카테고리 번호로 스티커(베이직)가져오기
		List<StickerVo> paperList = mydiaryDao.getStickerList(1);//카테고리 번호로 스티커(종이)가져오기
		
		Map<String, List<StickerVo>> stickerMap = new HashMap<String, List<StickerVo>>();
		stickerMap.put("stickerList", stickerList);
		stickerMap.put("paperList", paperList);
		
		return stickerMap;
	}
	
	
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
	
}
