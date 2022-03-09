package com.mydeco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.ShoppingService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	
	//메인
	@RequestMapping("/main")
	public String main() {
		System.out.println("쇼핑몰도킹");
		
		return "shopping/shoppingmain";
	}
	
	
	//상품상세
	@RequestMapping("/merchandise")
	public String merchandise() {
		System.out.println("몰찬다이스 도킹");
		
		return "shopping/merchandiseinfo";
	}

}
