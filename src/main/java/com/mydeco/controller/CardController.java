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
		//데이터를 리스트 형태로 모아서 model model 써서 model.addAttribute --넣어줘야 cardMain.jsp에서 넣어준 정보를 쓸수가있음
		//List<CardVo> cardList = cardService.getCardList();
		//xml select 작성카드번호/카드이미지경로/날짜/컨텐츠/댓글갯수(카운트) , from card --dao sqlSession.selectList()
		//댓글갯수카운트 어떻게 할지..

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
	
	@RequestMapping("cardwrite")//로그인한 값을 가져와야할때 httpsession
	public String cardWrite(HttpSession session, @ModelAttribute CardVo cardVo) {//jsp에서 컨트롤러로 보낼때
		System.out.println("controller > writeForm> main으로 리다이렉트");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		cardVo.setUserNo(authUser.getUserNo());
		System.out.println(cardVo);
		cardService.sendcard(cardVo);
		/* return "redirect:/card/main"; */
		
		return "";
		
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
	
	@RequestMapping("/replywrite")
	public String replyWriteForm(Model model) {
		System.out.println("card/replyWriteForm");
		
		return "card/replyWriteForm";
	}
	
}
