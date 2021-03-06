package com.mydeco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.MydiaryService;
import com.mydeco.service.ShoppingService;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.ProductVo;
import com.mydeco.vo.ShoppingCmtVo;
import com.mydeco.vo.ShoppingMainListVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private MydiaryService mydiaryService;
	
//////////////////////////////쇼핑몰 메인///////////////////////////////////////////
	@RequestMapping("/main")
	public String main(Model model, HttpSession session, ProductVo productVo) {
		System.out.println("쇼핑몰도킹");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		

		
		
		if(authUser == null) {
			return "shopping/loginForm";
		}else {
			
			productVo.setUserNo(authUser.getUserNo());
			
			List<ShoppingMainListVo> merchandiseList = shoppingService.getmerchandiseList(productVo);
			model.addAttribute("merchandiseList",merchandiseList);
			return "shopping/shopmain";
		}
		
		
	}

//////////////////////////////쇼핑몰 메인 감정///////////////////////////////////////////
	@RequestMapping("/emotionMain")
	public String emotionmain(@RequestParam("emotion") String emotion, Model model, ProductVo productVo, HttpSession session) {
		System.out.println("이모션 쇼핑몰도킹");
		
		productVo.setEmotion(emotion);

		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		productVo.setUserNo(authUser.getUserNo());
		
		List<ShoppingMainListVo> merchandiseList = shoppingService.getmerchandiseEmotionList(productVo);
		model.addAttribute("merchandiseList", merchandiseList);

		System.out.println("최종 이모션 리스트 :" + merchandiseList);
		return "shopping/shopmain";
	}

	@ResponseBody
	@RequestMapping("/addpick")
	public String addpick(@RequestBody ProductVo productVo, HttpSession session) {
		
		System.out.println("컨트롤러의 픽미픽미픽미업");
		
		System.out.println(productVo);
		
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		System.out.println(session.getAttribute("authUser"));
	
		productVo.setUserNo(authUser.getUserNo());
		String pickResult = shoppingService.addpick(productVo); 
		
		//shoppingService.pickCheck(productVo);
		
		return pickResult;
	}
	
	///////////////////////////쇼핑몰 메인 제목 검색////////////////////////////////////

	@RequestMapping("/search")
	public String emotionmain(@RequestParam("search") String search,
							  @RequestParam("searchText") String stext, Model model, ProductVo productVo) {
		System.out.println("서치 쇼핑몰도킹");
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("search", search);
        map.put("text", stext);;

		System.out.println(map);
		List<ShoppingMainListVo> merchandiseList = shoppingService.getSearchList(map);
		model.addAttribute("merchandiseList", merchandiseList);

		System.out.println("최종 서치 리스트 :" + merchandiseList);
		return "shopping/shopmain";	
	}
	
///////////////////////////상품상세정보와 ajax리스트 정보까지 동시에/////////////////////////////////////////////////////////////
	@RequestMapping("/merchandise")
	public String getonemerchandise(@RequestParam("no") int no, Model model, HttpSession session) {
		System.out.println("몰찬다이스 도킹");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		
		ProductVo productVo = shoppingService.getonemerchandise(no);
		
		model.addAttribute("product", productVo);
		
		List<ShoppingCmtVo> cmtList = shoppingService.getCmtList(no);
		
		model.addAttribute("cmtList", cmtList);
		
		List<DiaryContentVo> diarycontentList = shoppingService.getDiaryContentList(no);
		model.addAttribute("diarycontentList", diarycontentList);
		System.out.println("=============================");
		System.out.println(diarycontentList);
		
		List<DiaryContentVo> day = mydiaryService.getDiaryDateList(authUser);
		model.addAttribute("dayList", day);
		
		
		System.out.println("자 모델정보 뿌린다 잘봐라 밑에");
		System.out.println(model);
		return "shopping/merchandise";
	}

	


///////////////////////상품상세의 댓글 ajax//////////////////////////////
	@ResponseBody
	@RequestMapping("/cmtwrite")
	public void cmtwrite(@RequestBody ShoppingCmtVo shoppingCmtVo, HttpSession session) {
		System.out.println("ajax 코멘트전송 컨트롤러 진입");
		
		System.out.println(shoppingCmtVo);
		
		
		System.out.println(session.getAttribute("authUser"));
	
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		shoppingCmtVo.setUserNo(authUser.getUserNo());
		shoppingCmtVo.setName(authUser.getName());
		
		System.out.println(shoppingCmtVo);
		shoppingService.cmtwrite(shoppingCmtVo);
		
		
	}
///////////////////상품상세의 대댓글 ajax//////////////////////////////
	@ResponseBody
	@RequestMapping("/recmtwrite")
	public int recmtwrite(@RequestBody ShoppingCmtVo shoppingCmtVo, HttpSession session) {
		System.out.println("ajax 리코멘트전송 컨트롤러진입");
		
		System.out.println(shoppingCmtVo);
		
		System.out.println(session.getAttribute("authUser"));
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		shoppingCmtVo.setUserNo(authUser.getUserNo());
		shoppingCmtVo.setName(authUser.getName());
		
		System.out.println(shoppingCmtVo);
		return shoppingService.cmtwrite2(shoppingCmtVo);
		
		 
	}
	
	
	
///////////////////////////댓글 패치리스트///////////////////////
	

	@ResponseBody
	@RequestMapping("/fetch")
	public List<ShoppingCmtVo> fetch(@RequestParam("no") int no){
		System.out.println("컨트롤러의 패치리스트 도킹");
		
		List<ShoppingCmtVo> cmtList = shoppingService.getCmtList(no);
		
		System.out.println(cmtList);
		return cmtList;
	}
	////////////////////////페이징//////////////////////
	@RequestMapping("/page")
	public String myProductList(Model model,
			@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

		System.out.println("페이징 시작");
		
		Map<String, Object> map = shoppingService.getMyProductpgList(keyword, crtPage);
		model.addAttribute("map", map);

		return "shopping/main";
	}


	
}

