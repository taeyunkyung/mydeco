package com.mydeco.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.UserChatVo;

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
	
	public List<ProductVo> myProductList(int userNo) {
		return sqlSession.selectList("myProduct.myProductList", userNo);
	}
	
	//나의 상품//
	public List<ProductVo> myProductpgList(int userNo, String keyword, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("myProduct.myProductpgList", map);
	}
	
	public int selectTotal(int userNo) {
		return sqlSession.selectOne("myProduct.totalCnt", userNo);
	}
	//나의 상품//
	
	public int remove(ProductVo productVo) {
		System.out.println("remove.dao");
		return sqlSession.delete("myProduct.myProductRemove", productVo);
	}
	
	//찜한 상품//
	public List<ProductVo> myPickpgList(int userNo, String keyword, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sqlSession.selectList("myProduct.myPickpgList", map);
	}
	
	public int selectTotalPick(int userNo) {
		return sqlSession.selectOne("myProduct.totalpickCnt", userNo);
	}
	//찜한 상품//
	
	public int pickRemove(ProductVo productVo) {
		System.out.println("pickRemove.dao");
		return sqlSession.delete("myProduct.myPickRemove", productVo);
	}
	
	public List<UserChatVo> buyList(int authUserNo) {
		return sqlSession.selectList("myProduct.myBuyList", authUserNo);
	}
	
	public List<UserChatVo> sellList(int authUserNo) {
		return sqlSession.selectList("myProduct.mySellList", authUserNo);
	}
	
	public List<UserChatVo> buyDetails(UserChatVo userChatVo) {
		return sqlSession.selectList("myProduct.buychatDetails", userChatVo);
	}
	
	public List<UserChatVo> sellDetails(UserChatVo userChatVo) {
		return sqlSession.selectList("myProduct.sellchatDetails", userChatVo);
	}
}
