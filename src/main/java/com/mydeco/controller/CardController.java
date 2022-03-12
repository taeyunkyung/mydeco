package com.mydeco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.CardService;
import com.mydeco.vo.CardImgVo;

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
	
	@RequestMapping("/write")
	public String cardWriteForm(Model model) {
		System.out.println("card/cardWriteForm");
		
		List<CardImgVo> cardimgList = cardService.getCardImgList();
		model.addAttribute("cardimgList",cardimgList);
		
		return "card/cardWriteForm";
	}
	
	@RequestMapping("/reply")
	public String replyWriteForm(Model model) {
		System.out.println("card/replyWriteForm");
		
		return "card/replyWriteForm";
	}
	
	@RequestMapping("/sendList")
	public String cardReadForm(Model model) {
		System.out.println("card/cardReadForm");
		
		return "card/cardReadForm";
	}
	
	@RequestMapping("/receiveList")
	public String replyReadForm(Model model) {
		System.out.println("card/replyReadForm");
		
		return "card/replyReadForm";
	}
	
	
}
