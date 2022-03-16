package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.CardService;
import com.mydeco.vo.CardVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/card")
public class CardController {

	@Autowired 
	private CardService cardService;
	
	@RequestMapping("/main")
	public String card() {
		System.out.println("controller > main");
		
		return "/card/cardMain";
	}
	
	
	
	@RequestMapping("cardwrite")
	public String cardWrite(HttpSession session, @ModelAttribute CardVo cardVo) {
		System.out.println("controller > writeForm> main으로 리다이렉트");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		cardVo.setUserNo(authUser.getUserNo());
		System.out.println(cardVo);
		cardService.sendcard(cardVo);
		return "redirect:main";
		
	}
	
	@RequestMapping("/replywrite")
	public String replyWriteForm(Model model) {
		System.out.println("card/replyWriteForm");
		
		return "card/replyWriteForm";
	}
	
	@RequestMapping("/cardread")
	public String cardReadForm(Model model) {
		System.out.println("card/cardReadForm");
		
		return "card/cardReadForm";
	}
	
	@RequestMapping("/replyread")
	public String replyReadForm(Model model) {
		System.out.println("card/replyReadForm");
		
		return "card/replyReadForm";
	}
	
	
}
