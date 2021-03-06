package com.mydeco.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.BgmVo;
import com.mydeco.vo.LetterItemVo;
import com.mydeco.vo.LetterVo;
import com.mydeco.vo.StickerVo;

@Repository
public class LetterDao {

	@Autowired 
	SqlSession sqlSession;
	
	
	
	//db에 스티커 목록 삽입
	public void stickerDB(StickerVo stickerVo) {
		System.out.println("스티커가 저장되었습니다.");
		
		sqlSession.insert("myLetter.stickerDB", stickerVo);
	}
	
	
	/*bgm가져오기*/
	public List<BgmVo> getBgmList(){
		return sqlSession.selectList("myLetter.getBgmList");
	}
	
	
	/*스티커 카테고리 목록 가져오기*/
	public List<StickerVo> getStickerList(int cateNo){
		return sqlSession.selectList("myLetter.getStickerList", cateNo);
	}
	
	
	
	
	//편지 아이템 삭제하기
	public void letterItemDelete(int letterNo) {
		
		sqlSession.delete("myLetter.deleteLetterItem", letterNo);
		
	}
	
	//편지 삭제하기
	public void letterDelete(int letterNo) {
		
		sqlSession.delete("myLetter.deleteLetter", letterNo);
		
	}
	
	
	//편지 정보 업데이트
	public void letterUpdate(LetterVo letterVo) {
	
		
		sqlSession.update("myLetter.updateLetterContents", letterVo);
		
	}
	
	//편지 아이템 업데이트
	public int letterItemUpdate(LetterItemVo lItemVo) {
		
		//System.out.println("DAO" + lItemVo);
		int count = sqlSession.insert("myLetter.updateLetterItem", lItemVo);
		
		return count;
		
	}
	
	
	
	
	//편지에 사용한 스티커 정보 저장
	public int  itemSave(LetterItemVo lItemVo) {
		int count = sqlSession.insert("myLetter.itemSave", lItemVo);
		System.out.println(lItemVo);  //여기에는 letterNo가 들어가 있음
		System.out.println("스티커 정보가 저장되었습니다.");
		
		return count;
	}
	
	
	//편지 정보 저장
	public int letterSave(LetterVo letterVo) {
		//System.out.println(letterVo); //편지번호 없음
		int count = sqlSession.insert("myLetter.letterContent", letterVo);
		//System.out.println(letterVo); //편지번호 있음
		return count;
		
	}
	
	
	
	
	//편지 목록 불러오기 : 보낸 편지 목록
	public List<LetterVo> selectSaveList(int startRnum, int endRnum) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<LetterVo> saveList = sqlSession.selectList("myLetter.selectSaveList",map);
		
		return saveList;
	}
	
	//편지 목록 불러오기 : 작성중인 편지 목록
	public List<LetterVo> selectKeepList(int startRnum, int endRnum) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<LetterVo> keepList = sqlSession.selectList("myLetter.selectKeepList",map);

		
		return keepList;
	}
	
	
	//편지 글 개수 가져오기: 보낸 편지 목록
	public int selectSaveListTotal() {
		
		return sqlSession.selectOne("myLetter.totalSaveListCount");
	}
	
	
	//편지 글 개수 가져오기: 작성 중인 편지 목록
	public int selectKeepListCount() {
		
		return sqlSession.selectOne("myLetter.totalKeepListCount");
	}
	
	
	
	
	
	
	//편지 읽어오기
	public LetterVo selectLetter(int letterNo) {
		
		sqlSession.update("myLetter.updateLetter", letterNo);
		
		return sqlSession.selectOne("myLetter.selectLetter", letterNo);
	}
	
	//편지 아이템 가져오기
	public List<LetterItemVo> selectLetterItem(int letterNo) {
		System.out.println("selectLetterItem");
		
		
		List<LetterItemVo> itemList = sqlSession.selectList("myLetter.selectLetterItemList", letterNo);
		System.out.println(itemList);
		
		return itemList;
	}
	

	
}
