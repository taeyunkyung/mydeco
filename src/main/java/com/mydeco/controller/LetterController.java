package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.LetterService;
import com.mydeco.vo.LetterVo;
import com.mydeco.vo.StickerVo;
import com.mydeco.vo.UserVo;

@Controller
@RequestMapping("/letter")
public class LetterController {

	@Autowired
	LetterService letterService;
	
	@RequestMapping("")
	public String letter() {
		System.out.println("letter");
		
		
		
		return "letter/letterList";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm(Model model) {
		System.out.println("letter/writeForm");
		
		//DB의 스티커 목록 불러와 어트리뷰트에 저장
		List<StickerVo> stickerList = letterService.getStickerList();
		model.addAttribute("stickerList",stickerList);
		
		return "letter/writeForm";
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
		
		return letterService.itemSave(letterVo);
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
