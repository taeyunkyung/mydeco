package com.mydeco.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mydeco.dao.MyProdImgDao;
import com.mydeco.dao.MyProductDao;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProdDiaryVo;
import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.UserChatVo;

@Service
public class MyShopService {

	@Autowired
	private MyProductDao myProductDao;
	@Autowired
	private MyProdImgDao myProdImgDao;

	public List<DiaryVo2> getDiaryList(int userNo) {
		return myProductDao.diaryList(userNo);
	}

	public void addProduct(ProductVo productVo, MultipartFile[] file, String[] diaryNoArr) {
		System.out.println("add.service");

		myProductDao.add(productVo);

		// 이미지추가
		int prodNo = productVo.getProdNo();
		System.out.println(prodNo);

		for (int i = 0; i < file.length; i++) {

			String saveDir = "C:\\javastudy\\upload";
			String orgName = file[i].getOriginalFilename();
			String exName = orgName.substring(orgName.lastIndexOf("."));
			String prodImgSrc = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			String filePath = saveDir + "\\" + prodImgSrc;

			try {
				byte[] fileData = file[i].getBytes();
				OutputStream out = new FileOutputStream(filePath);
				BufferedOutputStream bout = new BufferedOutputStream(out);

				bout.write(fileData);
				bout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			ProdImgVo prodImgVo = new ProdImgVo(prodImgSrc, orgName, prodNo);
			myProdImgDao.add(prodImgVo);
		}

		// 일기추가
		for (int i = 0; i < diaryNoArr.length; i++) {
			ProdDiaryVo prodDiaryVo = new ProdDiaryVo(prodNo, Integer.parseInt(diaryNoArr[i]));
			myProdImgDao.addDiary(prodDiaryVo);
		}
	}

	public List<ProductVo> getMyProductList(int userNo) {

		List<ProductVo> myProductList = myProductDao.myProductList(userNo);
				
		for (int i = 0; i < myProductList.size(); i++) {
			int prodNo = myProductList.get(i).getProdNo();
			String prodImgSrc = myProdImgDao.previewImg(prodNo);
			int diaryCnt = myProdImgDao.diaryCnt(prodNo);
			
			myProductList.get(i).setProdImgSrc(prodImgSrc);
			myProductList.get(i).setDiaryCnt(diaryCnt);
		}
		
		return myProductList;
	}
	
	// 페이징-나의상품//
	public Map<String, Object> getMyProductpgList(int userNo, String keyword, int crtPage) {
		int listCnt = 5;
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
		
		int startNum = (crtPage - 1) * listCnt + 1;
		int endNum = startNum + listCnt - 1;
		List<ProductVo> myProductList = myProductDao.myProductpgList(userNo, keyword, startNum, endNum);
		
		for (int i = 0; i < myProductList.size(); i++) {
			int prodNo = myProductList.get(i).getProdNo();
			String prodImgSrc = myProdImgDao.previewImg(prodNo);
			int diaryCnt = myProdImgDao.diaryCnt(prodNo);
			int pickCnt = myProdImgDao.pickCnt(prodNo);
			
			myProductList.get(i).setProdImgSrc(prodImgSrc);
			myProductList.get(i).setDiaryCnt(diaryCnt);
			myProductList.get(i).setPickCnt(pickCnt);
		}
		
		int totalCnt = myProductDao.selectTotal(userNo);
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
	// 페이징-나의상품//
	
	public int myProductRemove(ProductVo productVo) {
		System.out.println("remove.service");
		return myProductDao.remove(productVo);
	}
	
	// 페이징-찜한상품//
	public Map<String, Object> getMyPickpgList(int userNo, String keyword, int crtPage) {
		int listCnt = 5;
		crtPage = (crtPage > 0) ? crtPage : (crtPage = 1);
		
		int startNum = (crtPage - 1) * listCnt + 1;
		int endNum = startNum + listCnt - 1;
		List<ProductVo> myPickList = myProductDao.myPickpgList(userNo, keyword, startNum, endNum);
		
		for (int i = 0; i < myPickList.size(); i++) {
			int prodNo = myPickList.get(i).getProdNo();
			String prodImgSrc = myProdImgDao.previewImg(prodNo);
			int diaryCnt = myProdImgDao.diaryCnt(prodNo);
			int pickCnt = myProdImgDao.pickCnt(prodNo);
			
			myPickList.get(i).setProdImgSrc(prodImgSrc);
			myPickList.get(i).setDiaryCnt(diaryCnt);
			myPickList.get(i).setPickCnt(pickCnt);
		}
		
		int totalCnt = myProductDao.selectTotalPick(userNo);
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
		map.put("myPickList", myPickList);
		map.put("prev", prev);
		map.put("startPageBtnNo", startPageBtnNo);
		map.put("endPageBtnNo", endPageBtnNo);
		map.put("next", next);
		
		return map;
	}
	// 페이징-찜한상품//
	
	public int myPickRemove(ProductVo productVo) {
		System.out.println("pickRemove.service");
		return myProductDao.pickRemove(productVo);
	}
	
	public Map<String, Object> getChatList(int authUserNo) {
		List<UserChatVo> myBuyList = myProductDao.buyList(authUserNo);
		List<UserChatVo> mySellList = myProductDao.sellList(authUserNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myBuyList", myBuyList);
		map.put("mySellList", mySellList);
		
		return map;
	}
	
	public Map<String, Object> getChatDetails(UserChatVo userChatVo) {
		List<UserChatVo> myBuyDetails = myProductDao.buyDetails(userChatVo);
		List<UserChatVo> mySellDetails = myProductDao.sellDetails(userChatVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myBuyDetails", myBuyDetails);
		map.put("mySellDetails", mySellDetails);
		
		return map;
	}
}
