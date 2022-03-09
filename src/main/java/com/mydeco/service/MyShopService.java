package com.mydeco.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mydeco.dao.MyProdImgDao;
import com.mydeco.dao.MyProductDao;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.ProdImgVo;
import com.mydeco.vo.ProductVo;

@Service
public class MyShopService {

	@Autowired
	private MyProductDao myProductDao;
	@Autowired
	private MyProdImgDao myProdImgDao;
	
	public List<DiaryVo2> getDiaryList(int userNo) {
		return myProductDao.diaryList(userNo);
	}
	
	public void addProduct(ProductVo productVo, MultipartFile[] file) {
		System.out.println("add.service");
		
		myProductDao.add(productVo);		
		int prodNo = productVo.getProdNo(); 
		System.out.println(prodNo);	System.out.println(file);
		
		for(int i=0; i<file.length; i++ ) {
			
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
		
	}
}
