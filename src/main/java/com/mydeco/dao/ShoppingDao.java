package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;

@Repository
public class ShoppingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ProductVo getonemerchandise(int no) {
		System.out.println("다오의 겟원멀천");
		
		System.out.println(no);
		ProductVo productVo = sqlSession.selectOne("shopping.getOne", no);
		System.out.println(productVo);
		return productVo;
	}
	
	public List<ProdImgVo> getImg(int no) {
		System.out.println("다오의 프로덕트 이미지 접근");
		
		List<ProdImgVo> prodImgList = sqlSession.selectList("shopping.getImg", no);
		
		return prodImgList;
	}
}
