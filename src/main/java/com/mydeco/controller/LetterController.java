package com.mydeco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.LetterService;
import com.mydeco.vo.StickerVo;

@Controller
@RequestMapping("/letter")
public class LetterController {

	@Autowired
	LetterService letterService;
	
	@RequestMapping("/letter")
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
