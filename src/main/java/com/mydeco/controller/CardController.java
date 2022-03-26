package com.mydeco.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//소통카드 메인에 필요한 데이터 요청(작성카드 리스트, 받은카드 리스트))
		cardService.getMain(userNo);
		
		
		//자신이 작성한 카드 리스트 가져오기
		Map<String, Object> mainMap = cardService.getMain(userNo);
		System.out.println(mainMap);
		
		model.addAttribute("mainMap", mainMap);
		
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
	

	//받은 카드 읽기폼
	@RequestMapping("/replyReadForm")
	public String replyReadForm(HttpSession session, Model model){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		return "card/replyReadForm";
	}
	
	
	@ResponseBody
	@RequestMapping("/getReplyCardList")
	public List<CardReplyVo> getReplyCardList(HttpSession session){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();

		List<CardReplyVo> replyCardList = cardService.getReplyCardList(userNo);
		
		return replyCardList;
	}
	
	
	//보낸 카드 읽기폼
	@RequestMapping("/cardReadForm")
	public String cardReadForm(HttpSession session, Model model){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		return "card/cardReadForm";
	}
	
	@ResponseBody
	@RequestMapping("/getCardList")
	public List<CardVo> getCardList(HttpSession session){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();

		List<CardVo> CardList = cardService.getCardList(userNo);
		
		return CardList;
	}
	
	@RequestMapping("/replyWriteForm")
	public String replyWriteForm(){
		
		return "card/replyWriteForm";
	}
	
	
}
