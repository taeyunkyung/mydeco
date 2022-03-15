package com.mydeco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydeco.dao.ShoppingDao;
import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;

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

	
	
	///////////////////댓글리스트가져오기/////////
	
	public List<ShoppingCmtVo> getCmtList(int no){
		System.out.println("서비스의 댓글리스트가져오기");
		
		List<ShoppingCmtVo> cntCmtList = shoppingDao.getCmtList(no);
		
		return cntCmtList;
	}
	/////////////////////상세정보 댓글////////////////
	
	public void cmtwrite(ShoppingCmtVo shoppingCmtVo) {
		System.out.println("서비스도킹 쇼핑댓글");
		
		shoppingDao.addcmt(shoppingCmtVo);
	}
	
	///////////////////////쇼핑메인리스트가져오기//////////////
	public List<ProductVo> getmerchandiseList(){
		
		List<ProductVo> merchandiseList = shoppingDao.getmerchandiseList();
		
		return merchandiseList;
	}

	/////////////////////찜하기 /////////////////////////
	public void addpick(ProductVo productVo) {
		System.out.println("서비스의 픽미픽미픽미업");
		
		/* shoppingDao.addpick(productVo); */
	}
	

	
}
