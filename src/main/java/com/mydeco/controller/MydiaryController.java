package com.mydeco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mydeco.service.MydiaryService;
import com.mydeco.vo.DiaryItemVo;
import com.mydeco.vo.DiaryVo2;
import com.mydeco.vo.StickerVo2;

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
		List<StickerVo2> stickerList = mydiaryService.getStickerList();
		model.addAttribute("stickerList",stickerList);
		
		return "diary/writeForm";
	}
	
	@ResponseBody
	@RequestMapping("/write")
	public String write(@RequestBody List<DiaryItemVo> diaryItemVo) {
		System.out.println("mydiarycontroller-write");
		System.out.println(diaryItemVo);
		
		mydiaryService.addSticker(diaryItemVo);
		
		return "";
	}
	
	
	/*db에 스티커 이미지 경로,이름 저장하기*/
	@RequestMapping("/dbsticker")
	public String dbsticker() {
		System.out.println("dbs");
			
		mydiaryService.dbsticker();
		return "";
	}
}
