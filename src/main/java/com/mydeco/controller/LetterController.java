package com.mydeco.controller;

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

import com.mydeco.service.LetterService;
import com.mydeco.vo.BgmVo;
import com.mydeco.vo.LetterVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/letter")
public class LetterController {

	@Autowired
	LetterService letterService;
	
	
	//편지 목록 + 페이징
	@RequestMapping("")
	public String letter(Model model,
						@RequestParam(value = "crtPage1", required = false, defaultValue = "1") int crtPage1,
						@RequestParam(value = "crtPage2", required = false, defaultValue = "1") int crtPage2) {
		System.out.println("letter/list");
		
		//보낸 편지 리스트
		Map<String, Object> saveMap = letterService.getSaveList(crtPage1);
		model.addAttribute("saveMap", saveMap);

		//작성 중인 편지 리스트
		Map<String, Object> keepMap = letterService.getKeepList(crtPage2);
		model.addAttribute("keepMap", keepMap);

		
		return "letter/letterList";
	}
	
	
	@RequestMapping("/writeForm")
	public String writeForm(Model model, HttpSession Session) {
		System.out.println("letter/writeForm");
		
		UserVo authUser = (UserVo)Session.getAttribute("authUser");
		
		//로그인 하지 않은 유저의 접근 제한
		if(authUser!= null) {
			//DB의 스티커 목록 불러와 어트리뷰트에 저장
			Map<String, List<StickerVo>> stickerMap = letterService.getStickerList();
			model.addAttribute("stickerMap",stickerMap);
			System.out.println(stickerMap);
			
			List<BgmVo> bgmList = letterService.getBgmList();
			model.addAttribute("bgmList",bgmList);
			
			return "letter/writeForm";
		}else {
			return "letter/letterList";
		}
	}
	
	@ResponseBody
	@RequestMapping("/write")
	public int write(@RequestBody LetterVo letterVo, HttpSession session) {
		System.out.println("letter/write");
		System.out.println(letterVo);  
		                              
		//로그인한 사용자 번호 추가
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		letterVo.setUserNo(userNo);
		
		System.out.println(userNo);
		
		return letterService.itemSave(letterVo);
	}
	
	@ResponseBody
	@RequestMapping("/read")
	public LetterVo read(@RequestBody LetterVo letterVo) {
		System.out.println("letter/read");
		
		int letterNo = letterVo.getLetterNo();
		
		return letterService.readLetter(letterNo);
	}
	
	
	@RequestMapping("/modifyForm")
	public String modifyForm(Model model, HttpSession Session) {
		System.out.println("letter/modifyForm");
		
		UserVo authUser = (UserVo)Session.getAttribute("authUser");
		
		//로그인 하지 않은 유저의 접근 제한
		if(authUser!= null) {
			//DB의 스티커 목록 불러와 어트리뷰트에 저장
			Map<String, List<StickerVo>> stickerMap = letterService.getStickerList();
			model.addAttribute("stickerMap",stickerMap);
			//System.out.println(stickerMap);
			
			List<BgmVo> bgmList = letterService.getBgmList();
			model.addAttribute("bgmList",bgmList);
			
			return "letter/modifyForm";
		}else {
			return "letter/letterList";
		}
	}
	
	@ResponseBody
	@RequestMapping("/modify")
	public int modify(@RequestBody LetterVo letterVo) {
		System.out.println("letter/modify");
		System.out.println(letterVo);  
		                         
		letterService.itemUpdate(letterVo);
		
		return letterService.itemUpdate(letterVo);
	}
	
	//편지 삭제
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(@RequestBody int letterNo) {
		System.out.println("letter/delete");
		System.out.println(letterNo);  
		                         
		letterService.letterDelete(letterNo);
		
		return 1;
	}
	
	
	
	
	
	/*
	//db에 스티커 이미지 경로와 이름 삽입
	@RequestMapping("/stickerdb")
	public String stickerDB() {
		System.out.println("스티커 목록이 저장되었습니다.");
			
		letterService.stickerDB();
		return "";
	}
	*/
	
}
