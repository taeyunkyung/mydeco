package com.mydeco.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.LetterDao;
import com.mydeco.vo.LetterItemVo;
import com.mydeco.vo.LetterVo;
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
	
	
	/*스티커목록(꾸기미패널) 가져오기*/
	public Map<String, List<StickerVo>> getStickerList(){
		
		List<StickerVo> stickerList = letterDao.getStickerList(2);
		List<StickerVo> paperList = letterDao.getStickerList(1);
		
		
		Map<String, List<StickerVo>> stickerMap = new HashMap<String, List<StickerVo>>();
		stickerMap.put("stickerList", stickerList);
		stickerMap.put("paperList", paperList);
		
		return stickerMap;
	}
	
	
	
	//편지 삭제하기
	public void letterDelete(int letterNo) {
		
		//편지 아이템 삭제하기
		letterDao.letterItemDelete(letterNo);
		
		//편지 삭제하기
		letterDao.letterDelete(letterNo);
		
	}
	
	
	
	
	
	
	//편지 아이템 정보 저장
	public int itemSave(LetterVo letterVo) {
		int stickerCnt = 0;
		
		//편지 정보 저장 --> selectkey로 letterNo 먼저 삽입
		letterDao.letterSave(letterVo);
	
		//위 메소드 실행 후 letterVo에 letterNo 추가 : 호출 가능
		int letterNo = letterVo.getLetterNo(); 
		
		//letterVo 안에 있는 리스트 필드에 담은 값 letterItem에 넣기
		List<LetterItemVo> letterItem = letterVo.getItemList();
		
		for(int i=0; i<letterItem.size(); i++) {
			LetterItemVo lItemVo = letterItem.get(i);//해당 배열 안 값 vo에 담기
			lItemVo.setLetterNo(letterNo);//위에서 받은 letterNo 넣어주기
			
			
			/*text가 없을때의 처리를 해줘야함!*/
			if(lItemVo.getText() == null) {
				lItemVo.setText("");
			}
			
			int count = letterDao.itemSave(lItemVo); //스티커 정보 저장
			
			stickerCnt += count;
		}
		
		
		return stickerCnt;
	}
	
	
	
	//편지 아이템 정보 업데이트
	public int itemUpdate(LetterVo letterVo) {
		
		int stickerCnt = 0;
		
		int letterNo = letterVo.getLetterNo();
		
		//편지 아이템 삭제
		letterDao.letterItemDelete(letterNo);
		
		//편지 정보 업데이트
		letterDao.letterUpdate(letterVo);
		
		System.out.println("서비스: 아이템 업데이트");
		System.out.println(letterVo);
		
		//letterVo 안에 있는 리스트 필드에 담은 값 letterItem에 넣기(편지 아이템 업데이트)
		List<LetterItemVo> letterItem = letterVo.getItemList();
		
		for(int i=0; i<letterItem.size(); i++) {
			LetterItemVo lItemVo = letterItem.get(i);//해당 배열 안 값 vo에 담기
			lItemVo.setLetterNo(letterNo);
			
			/*text가 없을때의 처리를 해줘야함!*/
			if(lItemVo.getText() == null) {
				lItemVo.setText("");
			}
			
			int count = letterDao.letterItemUpdate(lItemVo); //스티커 정보 저장
			
			stickerCnt += count;
		}
		
		return stickerCnt;
	}
	
	
	
	
	//편지 목록 불러오기 : 보낸 편지 목록
	public List<LetterVo> selectSaveList() {
		List<LetterVo> saveList = letterDao.selectSaveList();

		return saveList;
	}
	
	//편지 목록 불러오기 : 작성중인 편지 목록
	public List<LetterVo> selectKeepList() {
		List<LetterVo> keepList = letterDao.selectKeepList();

		return keepList;
	}
	
	
	//편지 읽어오기(아이템 추가)
	public LetterVo readLetter(int letterNo) {
		System.out.println("---------------------------------");
		
		//편지 정보
		LetterVo letterVo = letterDao.selectLetter(letterNo);
		System.out.println("편지 정보" + letterVo);
		//아이템 정보
		List<LetterItemVo> itemList = letterDao.selectLetterItem(letterNo);
		System.out.println("아이템 정보" + itemList);
		//편지에 아이템 정보 추가
		letterVo.setItemList(itemList);
		
		return letterVo;
		
	}
	
	

}
