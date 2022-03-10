package com.mydeco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mydeco.service.ShoppingService;
import com.mydeco.vo.ProductVo;

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
	
	
	
	
	
	
	
	
///////////////////////////상품상세/////////////////////////////////////////////////////////////
	@RequestMapping("/merchandise")
	public String getonemerchandise(@RequestParam("no") int no, Model model) {
		System.out.println("몰찬다이스 도킹");
		
		ProductVo productVo = shoppingService.getonemerchandise(no);
		
		model.addAttribute("product", productVo);
		return "shopping/merchandiseinfo";
	}
}
	

	
	

