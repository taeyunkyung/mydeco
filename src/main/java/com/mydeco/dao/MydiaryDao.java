package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.StickerVo2;

@Repository
public class MydiaryDao {

	@Autowired 
	SqlSession sqlSession;
	
	public void dbsticker(StickerVo2 vo) {
		
		sqlSession.insert("mydiary.diary-db",vo);
	}
}
