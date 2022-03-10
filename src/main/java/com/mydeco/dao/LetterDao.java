package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//스티커 목록 가져오기
	public List<StickerVo> getStickerList(){
		return sqlSession.selectList("myLetter.getStickerList");
	}
}
