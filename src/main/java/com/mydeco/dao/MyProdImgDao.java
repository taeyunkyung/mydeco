package com.mydeco.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.ProdImgVo;

@Repository
public class MyProdImgDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int add(ProdImgVo prodImgVo) {
		System.out.println("imgadd.dao");
		return sqlSession.insert("myProdImg.addImg", prodImgVo);
	}
}
