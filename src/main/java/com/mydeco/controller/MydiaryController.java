package com.mydeco.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.MydiaryService;
import com.mydeco.vo.DiaryContentVo;
import com.mydeco.vo.StickerVo;

@Controller
@RequestMapping("/diary")
public class MydiaryController {
	
	@Autowired 
	MydiaryService mydiaryService;
	
	@RequestMapping("/list")
	public String list() {
		System.out.println("mydiarycontroller-list");
		return "diary/list";
	}
	

	@RequestMapping("/writeForm")
	public String writeForm(Model model) {
		System.out.println("mydiarycontroller-writeForm");
		
		//db에 있는 이미지경로 이용해서 스티커들 갖고와야함.
		List<StickerVo> stickerList = mydiaryService.getStickerList();
		model.addAttribute("stickerList",stickerList);
		
		//db의 종이 갖고오기
		/*
		List<PaperVo> paperList = mydiaryService.getPaperList();
		model.addAttribute("paperList",paperList);
		System.out.println(paperList);*/
		
		return "diary/writeForm";
	}
	
	@ResponseBody
	@RequestMapping("/write")
	public int write(@RequestBody DiaryContentVo diarycontentvo) {
		System.out.println("mydiarycontroller-write");
		System.out.println(diarycontentvo);
		
		return mydiaryService.addContent(diarycontentvo);
		
		
		/*
		try {
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return "fail";
		}
		// mydiaryService.addSticker(diarycontentvo);*/
	}
	
	
	/*db에 스티커 이미지 경로,이름 저장하기*/
	@RequestMapping("/dbsticker")
	public String dbsticker() {
		System.out.println("dbs");
			
		mydiaryService.dbsticker();
		return "";
	}
	
	/*db에 종이 이미지 경로,이름 저장하기*/
	/*
	@RequestMapping("/dbpaper")
	public String dbpaper() {
		System.out.println("dbp");
			
		mydiaryService.dbpaper();
		return "";
	}*/
}

