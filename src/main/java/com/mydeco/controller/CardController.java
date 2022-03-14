package com.mydeco.controller;

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
	CardService cardService;
	
	@RequestMapping("/main")
	public String card() {
		System.out.println("card");
		return "card/cardMain";
	}
	
	@RequestMapping("/writecardForm")
	public String cardWriteForm() {
		System.out.println("writecard controller");
		
		return "card/cardWriteForm";
	}
	
	@RequestMapping("writecard")
	public String cardWrite(HttpSession session, @ModelAttribute CardVo cardVo) {
		System.out.println("writecard controller");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		cardVo.setUserNo(authUser.getUserNo());
		System.out.println(cardVo);
		cardService.sendcard(cardVo);
		
		return "redirect:card/writecard";
		
	}
	
	@RequestMapping("/writereply")
	public String replyWriteForm(Model model) {
		System.out.println("card/replyWriteForm");
		
		return "card/replyWriteForm";
	}
	
	@RequestMapping("/readcard")
	public String cardReadForm(Model model) {
		System.out.println("card/cardReadForm");
		
		return "card/cardReadForm";
	}
	
	@RequestMapping("/readreply")
	public String replyReadForm(Model model) {
		System.out.println("card/replyReadForm");
		
		return "card/replyReadForm";
	}
	
	
}
