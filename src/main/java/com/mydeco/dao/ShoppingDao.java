package com.mydeco.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;
import com.mydeco.vo.ShoppingMainListVo;
import com.mydeco.vo.UserVo;

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

	/////////////////////////////// 이미지출력/////////////////////////
	public List<ProdImgVo> getImg(int no) {
		System.out.println("다오의 프로덕트 이미지 접근");

		List<ProdImgVo> prodImgList = sqlSession.selectList("shopping.getImg", no);

		return prodImgList;
	}
	///////////////////////// 코멘트넣기////////////////////////////

	public void addcmt(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("다오의 cmt 넣기 도킹");
		System.out.println(shoppingCmtVo);
		sqlSession.insert("shopping.addcmt", shoppingCmtVo);
	}
	////////////////////////////코멘코멘트 넣기///////////////////////
	public int addReCmt(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("다오의 recmt 넣기 도킹");
		System.out.println(shoppingCmtVo);
		System.out.println("최종 대댓글 확인용"+shoppingCmtVo);
		return sqlSession.insert("shopping.reAddCmt", shoppingCmtVo);
		
	}
	/////////////////////// 코멘트리스트가져오기//////////////////////////

	public List<ShoppingCmtVo> getCmtList(int no) {
		System.out.println("다오의 cmt list 가져오기 도킹");

		List<ShoppingCmtVo> shoppingCmtVo = sqlSession.selectList("shopping.cmtList", no);

		return shoppingCmtVo;
	}

	///////////////////////// 쇼핑메인페이지 리스트 가져오기////////////////////
	public List<ShoppingMainListVo> getmerchandiseList() {
		System.out.println("다오의 메인페이지 리스트 가져오기 도킹");
		List<ShoppingMainListVo> productList = sqlSession.selectList("shopping.merchandiseList");

		System.out.println(productList);
		return productList;
	}

	//////////////////////////// 찜하기//////////////////////////////
	public int addpick(ProductVo productVo) {
		System.out.println("다오의 픽미픽미픽미업");
		System.out.println("다오의 픽미픽미픽미업 정보" + productVo);
		return sqlSession.insert("shopping.addpick", productVo);
	}

	////////////////////////// 페이징////////////////////////////
	public List<ProductVo> myProductpgList(String keyword, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		System.out.println(map);

		return sqlSession.selectList("myProduct.myProductpgList", map);
	}

	public int selectTotal() {
		System.out.println();
		return sqlSession.selectOne("myProduct.totalCnt");
	}

	////////////////////////// 감정별 리스트출력///////////////////////
	public List<ShoppingMainListVo> getmerchandiseEmotionList(ProductVo productVo) {
		System.out.println("다오의 메인페이지 이모션리스트 가져오기 도킹");
		List<ShoppingMainListVo> productList = sqlSession.selectList("shopping.merchandiseEmotionList", productVo);

		System.out.println(productList);
		return productList;
	}

	///////////////////////// 검색별 리스트 출력///////////////////
	public List<ShoppingMainListVo> getmerchandiseSearchList(Map<String, Object> map) {
		System.out.println("다오의 맵 서치리스트 도킹");
		System.out.println(map);
		List<ShoppingMainListVo> productList = sqlSession.selectList("shopping.searchList", map);

		return productList;
	}

	/////////////////////// 쇼핑 다이어리 리스트 출력////////////////////
	public List<DiaryContentVo> getDiaryContentList(int no) {
		System.out.println("다오의 일기리스트 도킹");
		System.out.println("다오의 인트 확인용"+ no);
		List<DiaryContentVo> dcList = sqlSession.selectList("shopping.shoppingGetDiaryContentList", no);
		System.out.println("다오의 다이어리 확인용" + dcList);
		return dcList;
	}

	///////////////////////찜 추가되었는지 확인////////////
	public ProductVo pickCheck(ProductVo productVo) {
		System.out.println("다오의 픽첵 도킹");
		System.out.println("다오의 푸로덕트 브이오" +productVo);
		
		ProductVo pVo = sqlSession.selectOne("shopping.pickCheck", productVo);
		System.out.println("다오의 넘버체크"+pVo);
		return pVo;
	}	
	////////////////////픽 지우기//////////////////////
	public int deletepick(int no) {
		System.out.println("다오의 픽딜리트 도킹");
		return sqlSession.delete("shopping.delPick", no);
	}
}
