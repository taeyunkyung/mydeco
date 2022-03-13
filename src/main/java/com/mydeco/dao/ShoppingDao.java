package com.mydeco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;

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
	///////////////////////////////이미지출력/////////////////////////
	public List<ProdImgVo> getImg(int no) {
		System.out.println("다오의 프로덕트 이미지 접근");
		
		List<ProdImgVo> prodImgList = sqlSession.selectList("shopping.getImg", no);
		
		return prodImgList;
	}
	/////////////////////////코멘트넣기////////////////////////////
	
	public void addcmt(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("cmt 다오 진입");
		System.out.println(shoppingCmtVo);
		sqlSession.insert("shopping.addcmt", shoppingCmtVo);
	}
	///////////////////////코멘트리스트가져오기//////////////////////////

	public List<ShoppingCmtVo> getCmtList(int no) {
		System.out.println("다오의 cmt list 가져오기");
		
		List<ShoppingCmtVo> shoppingCmtVo = sqlSession.selectList("shopping.cmtList", no);
		
		return shoppingCmtVo;
	}
	/////////////////////////쇼핑메인페이지 리스트 가져오기////////////////////
	public List<ProductVo> getmerchandiseList(){
		System.out.println("메인페이지 리스트가져오기 다오도킹");
		List<ProductVo> productList = sqlSession.selectList("shopping.merchandiseList");
		
		System.out.println(productList);
		return productList;
	}
}
