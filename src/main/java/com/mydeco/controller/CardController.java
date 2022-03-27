package com.mydeco.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.CardService;
import com.mydeco.vo.CardVo;
import com.mydeco.vo.CardandReplyVo;
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
		
		if(authUser != null) { //로그인 했으면
			int userNo = authUser.getUserNo();
			
			//소통카드 메인에 필요한 데이터 요청(작성카드 리스트, 받은카드 리스트))
			
			//자신이 작성한 카드 리스트 가져오기
			Map<String, Object> mainMap = cardService.getMain(userNo);
			//System.out.println(mainMap);
			
			model.addAttribute("mainMap", mainMap);
			
			return "card/cardMain";
		
		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
		
	}
	
	
	@RequestMapping("/cardWriteForm")
	public String cardWriteForm(Model model, HttpSession session) {//컨트롤러에서 jsp
		System.out.println("controller > 카드쓰기폼");
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) { //로그인 했으면
			List<CardVo> bgList = cardService.imgList();
			model.addAttribute("bgList", bgList);
			return "card/cardWriteForm";
			
		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
	
	}
	
	
	
	@RequestMapping("/cardWrite")//로그인한 값을 가져와야할때 httpsession
	public String cardWrite(HttpSession session, @ModelAttribute CardVo cardVo) {//jsp에서 컨트롤러로 보낼때
		System.out.println("controller > writeForm> main으로 리다이렉트");
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) { //로그인 했으면
			cardVo.setUserNo(authUser.getUserNo());
			cardService.sendcard(cardVo);
			
			return "redirect:/card/main";

		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
		
		
	}
	
	
	//받은 카드 읽기폼
	@RequestMapping("/replyReadForm")
	public String replyReadForm(HttpSession session, Model model){
		
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) { //로그인 했으면
			
			return "card/replyReadForm";

		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/getReplyCardList")
	public List<CardandReplyVo> getReplyCardList(HttpSession session){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();

		List<CardandReplyVo> replyCardList = cardService.getReplyCardList(userNo);
		
		return replyCardList;
	}
	
	
	/* 특정카드의 댓글 모두 가져오기 */
	@ResponseBody
	@RequestMapping("/getReplyCardCommentList")
	public List<CardandReplyVo> getReplyCardCommentList(@ModelAttribute CardVo cardVo){

		System.out.println(cardVo);
		List<CardandReplyVo> cardandReplyList = cardService.getReplyCardCommentList(cardVo);
		
		System.out.println(cardandReplyList);
		return cardandReplyList;
	}
	
	

	/* 댓글번호로 원글 댓글 카드 가져오기 */
	@RequestMapping("/replyWriteForm")
	public String replyWriteForm(Model model, HttpSession session, @ModelAttribute CardandReplyVo cardandReplyVo){
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) { //로그인 했으면
			int reUserNo =  authUser.getUserNo();
			cardandReplyVo.setReUserNo(reUserNo);
			CardandReplyVo vo = cardService.selectOneCardAndReplyCard(cardandReplyVo);
			
			model.addAttribute("cardandReplyVo", vo);
			
			return "card/replyWriteForm";

		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
				
	}
	
	
	/* 댓글저장 */
	@RequestMapping("/replyWrite")
	public String replyWrite(Model model, HttpSession session, @ModelAttribute CardandReplyVo cardandReplyVo){
		
		//로그인 사용자 유저번호 세션에서 가져오기
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser != null) { //로그인 했으면
			
			int reUserNo = authUser.getUserNo();
			cardandReplyVo.setReUserNo(reUserNo);
			System.out.println("=====================");
			System.out.println(cardandReplyVo);
			System.out.println("=====================");
			int count = cardService.replyWrite(cardandReplyVo);
			
			return "redirect:replyReadForm?cardNo="+cardandReplyVo.getCardNo();

		}else { //로그인 안했으면 로그인 페이지로
			
			return "redirect:/loginForm";
		}
				
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

		List<CardVo> cardList = cardService.getCardList(userNo);
		System.out.println("================================================");
		System.out.println(cardList);
		System.out.println("================================================");
		return cardList;
	}
	
	
	
	
	
	
	
}
