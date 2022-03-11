package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo;

@Repository
public class MydiaryDao {

	@Autowired 
	SqlSession sqlSession;
	
	public void dbsticker(StickerVo vo) {
		
		sqlSession.insert("mydiary.diary-db",vo);
	}
	
	/*
	public void dbpaper(PaperVo vo) {
		
		sqlSession.insert("mydiary.diary-db-p",vo);
	}*/
	
	/*스티커목록 가져오기*/
	public List<StickerVo> getStickerList(){
		return sqlSession.selectList("mydiary.getStickerList");
	}
	
	/*종이목록 가져오기*/
	/*
	public List<PaperVo> getPaperList(){
		return sqlSession.selectList("mydiary.getPaperList");
	}*/
	
	/*일기에 쓴 컨텐츠 추가하기*/
	public int addContent(DiaryContentVo diarycontentvo) {
		return sqlSession.insert("mydiary.diaryContent",diarycontentvo);
	}
	
	public int selectDiaryNo() {
		return sqlSession.selectOne("mydiary.selectDiaryNo");
	}
	
	/*일기에 쓴 스티커 저장하기*/
	
	public void addSticker(DiaryItemVo diarySticker) {
		sqlSession.insert("mydiary.diaryitem",diarySticker);
	}
	
	/*일기에 쓴 스티커 저장하기2*/
	/*public void addSticker(DiaryContentVo diarycontentvo) {
		
		List<DiaryItemVo> diarystickerList = diarycontentvo.getItemList();

		for(int i=0; i<diarystickerList.size(); i++) {
			//DiaryItemVo diarysticker = diarystickerList.get(i);
			//System.out.println(diarysticker);
			sqlSession.insert("mydiary.diaryitem",diarystickerList.get(i));
		}
	}*/
	
}
