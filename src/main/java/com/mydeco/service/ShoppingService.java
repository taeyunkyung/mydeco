package com.mydeco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mydeco.dao.ShoppingDao;
import com.mydeco.vo.ProductVo;

@Service
public class ShoppingService {
	
	@Autowired
	private ShoppingDao shoppingDao;
	
	public ProductVo getonemerchandise(int no) {
				
		System.out.println("서비스의 겟원멀철");
		
		ProductVo productVo = shoppingDao.getonemerchandise(no);
		
		return productVo;
	}

}
