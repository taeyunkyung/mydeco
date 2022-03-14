package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	
//////////////////////////////쇼핑몰 메인///////////////////////////////////////////
	@RequestMapping("/main")
	public String main(Model model) {
		System.out.println("쇼핑몰도킹");
		
		List<ProductVo> merchandiseList = shoppingService.getmerchandiseList();
		model.addAttribute("merchandiseList",merchandiseList);
		
		List<ProductVo> cntdiaryList = shoppingService.countDiary();
		List<ShoppingCmtVo> cntcmtList = shoppingService.countCmt();
		
		System.out.println("카운트 다이어리다" +cntdiaryList);
		System.out.println("카운트 코멘트다" +cntcmtList);
		return "shopping/shoppingmain";
	}
	
	
	
	
	
	
	
	
///////////////////////////상품상세정보와 ajax리스트 정보까지 동시에/////////////////////////////////////////////////////////////
	@RequestMapping("/merchandise")
	public String getonemerchandise(@RequestParam("no") int no, Model model) {
		System.out.println("몰찬다이스 도킹");
		
		ProductVo productVo = shoppingService.getonemerchandise(no);
		
		model.addAttribute("product", productVo);
		
		List<ShoppingCmtVo> cmtList = shoppingService.getCmtList(no);
		
		model.addAttribute("cmtList", cmtList);
		
		System.out.println("자 모델정보 뿌린다 잘봐라 밑에");
		System.out.println(model);
		return "shopping/merchandiseinfo";
	}

	


///////////////////////상품상세의 댓글 ajax//////////////////////////////
	@ResponseBody
	@RequestMapping("/cmtwrite")
	public String cmtwrite(@RequestBody ShoppingCmtVo shoppingCmtVo, HttpSession session) {
		System.out.println("ajax 코멘트전송 컨트롤러 진입");
		
		System.out.println(shoppingCmtVo);
		
		
		System.out.println(session.getAttribute("authUser"));
	
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		shoppingCmtVo.setUserNo(authUser.getUserNo());
		shoppingCmtVo.setName(authUser.getName());
		
		System.out.println(shoppingCmtVo);
		shoppingService.cmtwrite(shoppingCmtVo);
		
		System.out.println("리다이렉트 바로전");
		return "redirect:shopping/merchandise";
	}
	
	


}

