package com.mydeco.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.MydiaryDao;
import com.mydeco.vo.BgmVo;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Service
public class MydiaryService {
	
	@Autowired 
	MydiaryDao mydiaryDao;
	
	/*다이어리 리스트 가져오기*/
	public List<DiaryContentVo> getDiaryContentList(UserVo authUser,String diaryDate){
		
		int userNo = authUser.getUserNo();
		DiaryContentVo diarycontentvo = new DiaryContentVo(userNo,diaryDate);
		
		List<DiaryContentVo> dcList = mydiaryDao.getDiaryContentList(diarycontentvo);
		
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
	
	/*달력에서 날짜 클릭시 해당 날짜에 쓴 일기리스트 출력*/
	public List<DiaryContentVo> getclickDateDiaryList(DiaryContentVo diarycontentvo,UserVo authUser){
		
		int userNo = authUser.getUserNo();
		diarycontentvo.setUserNo(userNo);
		
		return mydiaryDao.getclickDateDiaryList(diarycontentvo);
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
	
	/*bgm리스트*/
	public List<BgmVo> getBgmList() {
		
		return mydiaryDao.getBgmList();
	}
	
	/*일기에 쓴 컨텐츠 저장하기*/
	// db error rollback
	//	@Transactional
	public int addContent(DiaryContentVo diarycontentvo){
		
		mydiaryDao.addContent(diarycontentvo);
		
		/*다이어리 번호(seq_diary_no.nextval) 가져오기*/
		int diaryno = mydiaryDao.selectDiaryNo();
		System.out.println(diaryno);
		System.out.println("******43인지 확인");
		
		List<DiaryItemVo> diarysticker = diarycontentvo.getItemList();
		for(int i = 0; i<diarysticker.size(); i++) {
			DiaryItemVo diarySticker = diarysticker.get(i);
			diarySticker.setDiaryNo(diaryno);
			
			/*text가 없을때의 처리를 해줘야함!*/
			if(diarySticker.getText() == null) {
				diarySticker.setText("");
			}
			mydiaryDao.addSticker(diarySticker);
		}
		System.out.println("aaa");
	
		return 1;
	}
	
	/*일기 아이템 정보 업데이트*/
	public String itemUpdate(DiaryContentVo diarycontentvo) {
		
		int count1;
		int count2;
		int diaryNo = diarycontentvo.getDiaryNo();
		
		//일기 정보 업데이트
		count1 = mydiaryDao.updateDiary(diarycontentvo);
		
		//일기 아이템 삭제
		count2 = mydiaryDao.deleteDiaryItem(diaryNo);
		
		//일기 아이템리스트 업데이트
		List<DiaryItemVo> diaryItem = diarycontentvo.getItemList();
		System.out.println("modifyservice-item"+diaryItem); //여기까지 잘 왔음.
		
		for(int i=0; i<diaryItem.size(); i++) {
			DiaryItemVo diaryItemvo = diaryItem.get(i);
			diaryItemvo.setDiaryNo(diaryNo);
			
			/*220319 text가 없을때의 처리를 해줘야함!*/
			if(diaryItemvo.getText() == null) {
				diaryItemvo.setText("");
			}
			
			mydiaryDao.updateDiaryItem(diaryItemvo);
		}
		
		System.out.println("bbb");
		
		int sum = count1 + count2;
		if(sum>0) {
			return "1";
		}else {
			return "0";
		}
		
	}
	
	
	/*삭제하기*/
	public String deleteDiary(DiaryContentVo diarycontentvo) {
		int count1;
		int count2;
		int diaryNo = diarycontentvo.getDiaryNo();
		count1 = mydiaryDao.deleteDiaryItem(diaryNo);
		count2 = mydiaryDao.deleteDiary(diaryNo);
		
		int sum = count1+count2;
		
		if(sum>0) {
			return "2";
		}else {
			return "0";
		}
	}
	
}
