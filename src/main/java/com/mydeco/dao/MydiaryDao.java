package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Repository
public class MydiaryDao {

	@Autowired 
	SqlSession sqlSession;
	
	/*다이어리 리스트 가져오기*/
	public List<DiaryContentVo> getDiaryContentList(UserVo authUser){
		
		return sqlSession.selectList("mydiary.getDiaryContentList", authUser);
	}
	
	/*다이어리번호가 ? 인 다이어리 정보 가져오기(스티커 아이템제외)*/
	public DiaryContentVo getDiary(int diaryNo) {
		
		return sqlSession.selectOne("mydiary.getDiary", diaryNo);
	}
	
	/*220316쿼리문 수정*/
	/*다이어리번호가 ? 인 다이어리에 사용된 스티커 아이템리스트 가져오기 */
	public List<DiaryItemVo> getDiaryItemList(int diaryNo){
		return sqlSession.selectList("mydiary.getDiaryItemList", diaryNo);
	}
	
	/*다이어리 쓴 날짜 리스트*/
	public List<DiaryContentVo> getDiaryDateList(UserVo authUser){
		return sqlSession.selectList("mydiary.getDiaryDateList",authUser);
	}
	
	public void dbsticker(StickerVo vo) {
		
		sqlSession.insert("mydiary.diary-db",vo);
	}
	
	/* 220316수정 */
	/*스티커목록(꾸미기패널) 가져오기*/
	public List<StickerVo> getStickerList(int cateNo){
		return sqlSession.selectList("mydiary.getStickerList", cateNo);
	}
	
	
	/*일기에 쓴 컨텐츠 추가하기*/
	public int addContent(DiaryContentVo diarycontentvo) {
		return sqlSession.insert("mydiary.diaryContent",diarycontentvo);
	}
	
	public int selectDiaryNo() {
		return sqlSession.selectOne("mydiary.selectDiaryNo");
	}
	
	/*일기에 쓴 스티커 저장하기*/
	public void addSticker(DiaryItemVo diarySticker) {
		System.out.println(diarySticker);
		sqlSession.insert("mydiary.diaryitem",diarySticker);
		
	}
	
	/*수정하기 클릭시 아이템 삭제하기*/
	public int deleteDiaryItem(DiaryContentVo diarycontentvo) {
		return sqlSession.delete("mydiary.deleteDiaryItem",diarycontentvo);
	}
	
}
