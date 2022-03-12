package com.mydeco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.ShoppingService;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;

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

	


///////////////////////상품상세의 댓글 ajax//////////////////////////////
	@ResponseBody
	@RequestMapping("/cmtwrite")
	public void cmtwrite(@RequestBody ShoppingCmtVo shoppingCmtVo) {
		System.out.println("ajax 코멘트전송 컨트롤러 진입");
		
		System.out.println(shoppingCmtVo);
	
	}
	

	
	
	

}

