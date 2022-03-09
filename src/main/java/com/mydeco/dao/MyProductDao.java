package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProductVo;

@Repository
public class MyProductDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<DiaryVo2> diaryList(int userNo) {
		return sqlSession.selectList("myProduct.diaryList", userNo);
	}
	
	public int add(ProductVo productVo) {
		System.out.println("add.dao");
		return sqlSession.insert("myProduct.addProduct", productVo);		
	}
}
