package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.CardService;
import com.mydeco.vo.CardReplyVo;
import com.mydeco.vo.CardVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/card")
public class CardController {

	@Autowired 
	private CardService cardService;
	
	@RequestMapping("/main")
	public String card(Model model, HttpSession session, @ModelAttribute CardVo cardVo) {
		System.out.println("controller > main");
		//데이터를 리스트 형태로 모아서 model model 써서 model.addAttribute --넣어줘야 cardMain.jsp에서 넣어준 정보를 쓸수가있음
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		System.out.println("컨트롤러의 어스유저 확인" + authUser);
		List<CardVo> addList = cardService.ListaddCount(authUser.getUserNo());
		model.addAttribute("addList", addList);
		
		
		int no = authUser.getUserNo();
		
		
//		String age = cardService.getOneAge(authUser.getUserNo());
//		
//		cardVo.setCardGender(authUser.getGender());
//		cardVo.setCardAge(age);
//		
//		System.out.println("컨트롤러 gender확인" + authUser.getGender());
//		System.out.println("컨트롤러 age확인" + age);
		System.out.println("리시브카드리스트 진행 바로전");
		List<CardReplyVo> dList = cardService.receiveCardList(no);
		System.out.println("컨트롤러의 dList확인"+ dList);
		model.addAttribute("dList", dList);

		return "card/cardMain";
	}
	
	@RequestMapping("/cardWriteForm")
	public String cardWriteForm(Model model) {//컨트롤러에서 jsp
		System.out.println("controller > 카드쓰기폼");
		List<CardVo> bgList = cardService.imgList();
		model.addAttribute("bgList", bgList);
		System.out.println(bgList);
		return "card/cardWriteForm";
	}
	
	@RequestMapping("/cardWrite")//로그인한 값을 가져와야할때 httpsession
	public String cardWrite(HttpSession session, @ModelAttribute CardVo cardVo) {//jsp에서 컨트롤러로 보낼때
		System.out.println("controller > writeForm> main으로 리다이렉트");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		cardVo.setUserNo(authUser.getUserNo());
		System.out.println(cardVo);
		cardService.sendcard(cardVo);
		/* return "redirect:/card/main"; */
		
		return "redirect:main";
		
	}
	
	
	
	
	
}
