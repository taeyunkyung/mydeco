package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.ProdDiaryVo;
import com.mydeco.vo.ProdImgVo;

@Repository
public class MyProdImgDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int add(ProdImgVo prodImgVo) {
		System.out.println("imgadd.dao");
		return sqlSession.insert("myProdImg.addImg", prodImgVo);
	}
	
	public int addDiary(ProdDiaryVo prodDiaryVo) {
		System.out.println("diaryadd.dao");
		return sqlSession.insert("myProdImg.addDiary", prodDiaryVo);
	}
	
	public String previewImg(int prodNo) {
		return sqlSession.selectOne("myProdImg.previewImg", prodNo);
	}
	
	public int diaryCnt(int prodNo) {
		return sqlSession.selectOne("myProdImg.diaryCnt", prodNo);
	}
	
	public int pickCnt(int prodNo) {
		return sqlSession.selectOne("myProdImg.pickCnt", prodNo);
	}
}
