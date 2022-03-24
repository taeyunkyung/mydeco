package com.mydeco.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.ShoppingDao;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;
import com.mydeco.vo.ShoppingMainListVo;
import com.mydeco.vo.UserVo;

@Service
public class ShoppingService {

	@Autowired
	private ShoppingDao shoppingDao;

	public ProductVo getonemerchandise(int no) {

		System.out.println("서비스의 겟원멀철");

		ProductVo productVo = shoppingDao.getonemerchandise(no);
		List<ProdImgVo> prodimgList = shoppingDao.getImg(no);

		productVo.setProdImgList(prodimgList);

		System.out.println(productVo);

		return productVo;
	}

	/////////////////// 댓글리스트가져오기/////////

	public List<ShoppingCmtVo> getCmtList(int no) {
		System.out.println("서비스의 댓글리스트가져오기");

		List<ShoppingCmtVo> cntCmtList = shoppingDao.getCmtList(no);

		return cntCmtList;
	}
	///////////////////// 상세정보 댓글////////////////

	public void cmtwrite(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("서비스도킹 쇼핑댓글");

		shoppingDao.addcmt(shoppingCmtVo);
	}
	/////////////////// 상세정보 대댓글///////////////
	public int cmtwrite2(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("서비스의 쇼핑대댓글");
		shoppingCmtVo.setCmtSeq(shoppingCmtVo.getCmtSeq()+1);
		shoppingCmtVo.setDepth(shoppingCmtVo.getDepth()+1);
		System.out.println("쇼핑의 대댓글 확인용"+shoppingCmtVo);
		return shoppingDao.addReCmt(shoppingCmtVo);
		
	}

	/////////////////////// 쇼핑메인리스트가져오기//////////////
	public List<ShoppingMainListVo> getmerchandiseList() {

		List<ShoppingMainListVo> merchandiseList = shoppingDao.getmerchandiseList();

		return merchandiseList;
	}

	///////////////////// 찜하기 /////////////////////////
	public String addpick(ProductVo productVo) {
		System.out.println("서비스의 픽미픽미픽미업");

		ProductVo pVo = shoppingDao.pickCheck(productVo);
		
		if(pVo == null) {
			shoppingDao.addpick(productVo);
			return "addPick";
		}else{
			System.out.println("서비스의 픽넘"+pVo.getPickNo());
			shoppingDao.deletepick(pVo.getPickNo()); 
			return "delPick";
		}
	}

	////////////////// 페이징/////////////
	public Map<String, Object> getMyProductpgList(String keyword, int crtPage) {
		System.out.println("서비스의 페이징 시작");
		int listCnt = 4;// 한페이지에 4개
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1); // 디폴트값 넣는거

		int startNum = (crtPage - 1) * listCnt + 1;
		int endNum = startNum + listCnt - 1;
		List<ProductVo> myProductList = shoppingDao.myProductpgList(keyword, startNum, endNum);

		int totalCnt = shoppingDao.selectTotal();
		int pageBtnCnt = 5;
		int endPageBtnNo = (int) (Math.ceil(crtPage / (double) pageBtnCnt)) * pageBtnCnt;
		int startPageBtnNo = endPageBtnNo - pageBtnCnt + 1;

		boolean next = false;
		if (endPageBtnNo * listCnt < totalCnt) {
			next = true;
		} else {
			endPageBtnNo = (int) (Math.ceil(totalCnt / (double) listCnt));
		}

		boolean prev = false;
		if (startPageBtnNo != 1) {
			prev = true;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myProductList", myProductList);
		map.put("prev", prev);
		map.put("startPageBtnNo", startPageBtnNo);
		map.put("endPageBtnNo", endPageBtnNo);
		map.put("next", next);

		return map;
	}

	/////////////////////// 쇼핑메인이모션리스트가져오기//////////////
	public List<ShoppingMainListVo> getmerchandiseEmotionList(ProductVo productVo) {

		List<ShoppingMainListVo> merchandiseList = shoppingDao.getmerchandiseEmotionList(productVo);

		return merchandiseList;
	}

	////////////////////// 쇼핑서치리스트 가져오기///////////////
	public List<ShoppingMainListVo> getSearchList(Map<String, Object> map) {
		System.out.println("서비스의 겟서치리스트 도킹");

		List<ShoppingMainListVo> merchandiseList = shoppingDao.getmerchandiseSearchList(map);

		return merchandiseList;

	}

	////////////////////// 일기의 다이어리 가져오기////////////////
	/* 다이어리 리스트 가져오기 */
	public List<DiaryContentVo> getDiaryContentList(int no) {
		System.out.println("서비스의 겟다이어리 콘텐츠리스트");
		List<DiaryContentVo> dcList = shoppingDao.getDiaryContentList(no);
		System.out.println("서비스의 다이어리 확인용" + dcList);
		return dcList;
	}
	
	//////////////////메인 리스트 기능 다 합침/////////


}
