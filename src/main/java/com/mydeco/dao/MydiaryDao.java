package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.StickerVo2;

@Repository
public class MydiaryDao {

	@Autowired 
	SqlSession sqlSession;
	
	public void dbsticker(StickerVo2 vo) {
		
		sqlSession.insert("mydiary.diary-db",vo);
	}
	
	/*스티커목록 가져오기*/
	public List<StickerVo2> getStickerList(){
		return sqlSession.selectList("mydiary.getStickerList");
	}
	
	/*일기에 쓴 스티커 추가하기*/
	public void addSticker(List<DiaryItemVo> diaryItemVo) {
		sqlSession.insert("mydiary.diaryItem",diaryItemVo);
	}
}
