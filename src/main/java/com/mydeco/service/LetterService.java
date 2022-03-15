package com.mydeco.service;


import java.util.List;

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
	
	//스티커목록 가져오기
	public List<StickerVo> getStickerList(){
		
		return letterDao.getStickerList();
	}
	
	
	//일기에 쓰인 스티커 정보 저장하기
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
			int count = letterDao.itemSave(lItemVo); //스티커 정보 저장
			
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
	

}
