package com.mydeco.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydeco.service.MydiaryService;
import com.mydeco.vo.StickerVo;
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
	public String writeForm() {
		System.out.println("mydiarycontroller-writeForm");
		
		//db에 있는 이미지경로 이용해서 스티커들 갖고와야함.
		
		return "diary/writeForm";
	}
	
	
	/*db에 스티커 이미지 경로,이름 저장하기*/
	@RequestMapping("/dbsticker")
	public String dbsticker() {
		System.out.println("dbs");
			
		mydiaryService.dbsticker();
		return "";
	}
}
