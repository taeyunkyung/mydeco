package com.mydeco.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo2;
import com.mydeco.vo.UserChatVo;

@Repository
public class MyProductDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품 상세 //
	public List<DiaryVo2> diaryPreview(int prodNo) {
		return sqlSession.selectList("myProduct.diaryPreview", prodNo);
	}
	
	public DiaryContentVo selectByDiaryNo(int diaryNo) {
		return sqlSession.selectOne("myProduct.selectByDNo", diaryNo);
	}
	
	public List<DiaryItemVo> diaryItemList(int diaryNo) {
		return sqlSession.selectList("myProduct.diaryItemList", diaryNo);
	}
	// 상품 상세 //	
		
	// 상품 등록 //
	public List<DiaryContentVo> diaryList(int userNo) {
		return sqlSession.selectList("myProduct.diaryList", userNo);
	}
	
	// 상픔 등록 - 일기 페이징 //
	public List<DiaryVo2> diaryListpg(int userNo, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return sqlSession.selectList("myProduct.diaryListpg", map);
	}
	
	public int diaryTotal(int userNo) {
		return sqlSession.selectOne("myProduct.diaryTotalCnt", userNo);
	}
	// 상픔 등록 - 일기 페이징 //
	
	public int add(ProductVo productVo) {
		System.out.println("add.dao");
		return sqlSession.insert("myProduct.addProduct", productVo);		
	}
	// 상품 등록 //
	
	public List<ProductVo> myProductList(int userNo) { // <--페이징x
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
	
	public int update(ProductVo productVo) {
		return sqlSession.update("myProduct.update", productVo);
	}
	
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
	
	//채팅방리스트-고유번호:prodNo, authUserNo//
	public List<UserChatVo> buyList(int authUserNo) {
		return sqlSession.selectList("myProduct.myBuyList", authUserNo);
	}
	
	public List<UserChatVo> sellList(int authUserNo) {
		return sqlSession.selectList("myProduct.mySellList", authUserNo);
	}
	//채팅방리스트-고유번호:prodNo, authUserNo//
		
	public List<UserChatVo> buyDetails(UserChatVo userChatVo) {
		return sqlSession.selectList("myProduct.buychatDetails", userChatVo);
	}
	
	public List<UserChatVo> sellDetails(UserChatVo userChatVo) {
		return sqlSession.selectList("myProduct.sellchatDetails", userChatVo);
	}
	
	// addReturn chat//
	public int buyChat(UserChatVo userChatVo) {
		return sqlSession.insert("myProduct.buyChat", userChatVo);
	}
	
	public int sellChat(UserChatVo userChatVo) {
		return sqlSession.insert("myProduct.sellChat", userChatVo);
	}
	
	public UserChatVo addReturn(int chatNo) {
		return sqlSession.selectOne("myProduct.selectByNo", chatNo);
	}
	// addReturn chat//
	
	// 임시 기능 // 
	public ProductVo selectOne(int prodNo) {
		return sqlSession.selectOne("myProduct.selectOneProd", prodNo);
	}
	
	public ProductVo checkpick(ProductVo productVo) {
		return sqlSession.selectOne("myProduct.checkpick", productVo);
	}
	
	public int addpick(ProductVo productVo) {
		return sqlSession.insert("myProduct.addpick", productVo);
	}
	
	public List<ShoppingCmtVo2> getList(int prodNo) {
		return sqlSession.selectList("myProduct.commentList", prodNo);
	}
	
	// addReturn comment //
	public int insertFirst(ShoppingCmtVo2 shoppingCmtVo) {
		return sqlSession.insert("myProduct.insertFirst", shoppingCmtVo);
	}
	
	public ShoppingCmtVo2 addRComment(int cmtNo) {
		return sqlSession.selectOne("myProduct.selectByCmtNo", cmtNo);
	}
	// addReturn comment //
	
	public int orderUpdate(ShoppingCmtVo2 shoppingCmtVo) {
		return sqlSession.update("myProduct.sequpdate", shoppingCmtVo);
	}
	
	public int insertReply(ShoppingCmtVo2 shoppingCmtVo) {
		return sqlSession.insert("myProduct.insertReply", shoppingCmtVo);
	}
}
